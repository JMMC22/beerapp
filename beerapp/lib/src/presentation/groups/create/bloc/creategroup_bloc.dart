import 'package:beerapp/src/data/user/models/Group.dart';
import 'package:beerapp/src/data/user/repository/group_repository.dart';
import 'package:beerapp/src/presentation/groups/create/models/price.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:uuid/uuid.dart';
import '../../../../data/user/models/User.dart';
import '../../../../data/user/repository/user_repository.dart';
import '../../../../preferences/user_preferences.dart';
import '../models/name.dart';

part 'creategroup_event.dart';
part 'creategroup_state.dart';

class CreateGroupBloc extends Bloc<CreateGroupEvent, CreateGroupState> {
  final GroupRepository _groupRepository;
  final UserRepository _userRepository;

  List<User> members = [];
  late Group _group;
  late User _loggedUser;

  CreateGroupBloc({
    required GroupRepository groupRepository,
    required UserRepository userRepository,
  })  : _groupRepository = groupRepository,
        _userRepository = userRepository,
        super(const CreateGroupState()) {
    on<CreateInitialGroupEvent>(_onInitialCreateGroup);
    on<SubmittedCreateGroupEvent>(_onCreateGroup);
    on<GroupNameOnChanged>(_nameOnchanged);
    on<GroupPriceOnChanged>(_priceOnchanged);
    on<MembersSearchOnChanged>(_membersSearchOnChanged);
    on<AddMember>(_addMember);
    on<RemoveMember>(_removeMember);
  }

  void _onInitialCreateGroup(
    CreateInitialGroupEvent event,
    Emitter<CreateGroupState> emit,
  ) async {
    _group = _initialGroup();
    _loggedUser = await _getLoggedUser();
    members.add(_loggedUser);
    emit(state.copyWith(members: members));
  }

  void _onCreateGroup(
    SubmittedCreateGroupEvent event,
    Emitter<CreateGroupState> emit,
  ) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    List<UserItem> membersUserItems = [];

    for (var user in members) {
      UserItem userItem = UserItem(
          id: user.id,
          username: user.username,
          avatar: user.avatar,
          totalAmount: 0,
          totalConsumptions: 0,
          consumptions: []);
      membersUserItems.add(userItem);
    }
    _group.members = membersUserItems;
    _group.name = state.name.value;

    var price = state.price.value;
    if (price.contains(",")) {
      price = price.replaceAll(",", ".");
    }
    _group.standardPrice = double.parse(price);

    try {
      await _groupRepository.createGroup(_group);
      await _userRepository.addGroupToUsers(members, _group);

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  void _nameOnchanged(
      GroupNameOnChanged event, Emitter<CreateGroupState> emit) {
    final name = Name.dirty(event.name);
    emit(state.copyWith(
      name: name,
      status: Formz.validate([state.price, name]),
    ));
  }

  void _priceOnchanged(
      GroupPriceOnChanged event, Emitter<CreateGroupState> emit) {
    final price = Price.dirty(event.price);
    emit(state.copyWith(
      price: price,
      status: Formz.validate([price, state.name]),
    ));
  }

  void _membersSearchOnChanged(
      MembersSearchOnChanged event, Emitter<CreateGroupState> emit) async {
    if (event.username != "") {
      var users = await _userRepository.getUserByUsername(event.username);
      if (users.contains(_loggedUser)) users.remove(_loggedUser);
      emit(state.copyWith(
        usersSearched: users,
        status: Formz.validate([state.price, state.name]),
      ));
    } else {
      emit(state.copyWith(
        usersSearched: [],
        status: Formz.validate([state.price, state.name]),
      ));
    }
  }

  void _addMember(AddMember event, Emitter<CreateGroupState> emit) async {
    members.add(event.user);
    emit(state.copyWith(
      members: members,
      usersSearched: [],
      status: Formz.validate([state.price, state.name]),
    ));
  }

  void _removeMember(RemoveMember event, Emitter<CreateGroupState> emit) async {
    members.remove(event.user);
    emit(state.copyWith(
      members: members,
      usersSearched: [],
      status: Formz.validate([state.price, state.name]),
    ));
  }

  Group _initialGroup() {
    return Group(
        id: const Uuid().v1(),
        name: "",
        createdAt: DateTime.now(),
        image: 'image',
        totalAmount: 0.0,
        standardPrice: 0.0,
        totalConsumptions: 0,
        members: const []);
  }

  Future<User> _getLoggedUser() async {
    var id = await UserPreferences.getUserId();
    User user = await _userRepository.getUserById(id!);
    return user;
  }
}
