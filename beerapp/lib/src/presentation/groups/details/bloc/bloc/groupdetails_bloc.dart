import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'groupdetails_event.dart';
part 'groupdetails_state.dart';

class GroupdetailsBloc extends Bloc<GroupdetailsEvent, GroupdetailsState> {
  GroupdetailsBloc() : super(GroupdetailsInitial()) {
    on<GroupdetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
