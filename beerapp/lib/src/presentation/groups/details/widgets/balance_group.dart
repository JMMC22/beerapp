import 'package:beerapp/src/presentation/commons/commons_widgets.dart';
import 'package:beerapp/src/presentation/groups/details/bloc/bloc/groupdetails_bloc.dart';
import 'package:beerapp/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BalanceGroup extends StatelessWidget {
  const BalanceGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailsBloc, GroupDetailsState>(
        builder: (context, state) {
      if (state is GroupDetailsLoaded) {
        return Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppCustomTheme.colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${state.group.totalConsumptions}',
                        style: TextStyle(
                          fontSize: 48,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          color: AppCustomTheme.colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Text(
                          'uds',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            color: AppCustomTheme.colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Precio estándar: ${state.group.standardPrice ?? 0.0} €',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: AppCustomTheme.colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return Container();
    });
  }
}
