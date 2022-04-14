import 'package:beerapp/src/data/user/models/User.dart';
import 'package:beerapp/src/presentation/commons/commons_widgets.dart';
import 'package:beerapp/src/presentation/groups/create/bloc/creategroup_bloc.dart';
import 'package:beerapp/src/presentation/groups/create/view/creategroup_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../themes/themes.dart';

class MemberListSearch extends StatefulWidget {
  final TextEditingController searchController;
  final VoidCallback searchListenerFuction;
  final List<User> users;

  const MemberListSearch({
    Key? key,
    required this.searchController,
    required this.searchListenerFuction,
    required this.users,
  }) : super(key: key);

  @override
  State<MemberListSearch> createState() => _MemberListSearchState();
}

class _MemberListSearchState extends State<MemberListSearch> {
  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(widget.searchListenerFuction);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearch(
            tintText: 'Buscar...', searchController: widget.searchController),
        const SizedBox(height: 20),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const Divider(
            height: 10,
          ),
          shrinkWrap: true,
          itemCount: widget.users.length,
          itemBuilder: (context, index) {
            return UserItemList(
              index: index,
              users: widget.users,
              searchController: widget.searchController,
            );
          },
        )
      ],
    );
  }
}

class CustomSearch extends StatefulWidget {
  final String tintText;
  final TextEditingController searchController;
  const CustomSearch({
    Key? key,
    required this.tintText,
    required this.searchController,
  }) : super(key: key);

  @override
  State<CustomSearch> createState() => _SearchState();
}

class _SearchState extends State<CustomSearch> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateGroupBloc, CreateGroupState>(
      builder: (context, state) {
        return TextField(
          controller: widget.searchController,
          cursorColor: AppCustomTheme.colors.grey,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: widget.tintText,
              hintStyle: TextStyle(
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                color: AppCustomTheme.colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppCustomTheme.colors.lightGrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppCustomTheme.colors.grey),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear_rounded),
                color: AppCustomTheme.colors.grey,
                splashColor: Colors.transparent,
                onPressed: () {
                  widget.searchController.clear();
                  context
                      .read<CreateGroupBloc>()
                      .add(const MembersSearchOnChanged(""));
                },
              )),
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            color: AppCustomTheme.colors.black,
          ),
        );
      },
    );
  }
}

class UserItemList extends StatelessWidget {
  final int index;
  final List<User> users;
  final TextEditingController searchController;

  UserItemList(
      {Key? key,
      required this.index,
      required this.users,
      required this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateGroupBloc, CreateGroupState>(
      builder: (context, state) {
        bool isMember = state.members
                .where((element) => element.username == users[index].username)
                .isEmpty
            ? false
            : true;
        return GestureDetector(
          onTap: () {
            isMember
                ? context
                    .read<CreateGroupBloc>()
                    .add(RemoveMember(users[index]))
                : context.read<CreateGroupBloc>().add(AddMember(users[index]));
            searchController.clear();
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppCustomTheme.colors.white,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: AppCustomTheme.colors.grey,
                        image: const DecorationImage(
                            image: AssetImage('assets/images/avatar.png'),
                            fit: BoxFit.fill)),
                  ),
                  const SizedBox(width: 13),
                  Text(
                    users[index].username,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      color: AppCustomTheme.colors.black,
                    ),
                  ),
                  const Spacer(),
                  Visibility(
                    visible: isMember,
                    child: Icon(
                      Icons.add_reaction_rounded,
                      color: AppCustomTheme.colors.lightGrey,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
