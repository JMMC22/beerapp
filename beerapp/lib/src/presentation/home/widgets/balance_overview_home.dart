import 'package:beerapp/src/themes/themes.dart';
import 'package:flutter/material.dart';

class BalanceOverviewHome extends StatelessWidget {
  const BalanceOverviewHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35),
      child: Container(
        height: 225,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppCustomTheme.colors.white,
          borderRadius: BorderRadius.circular(30),
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Balance hoy',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  color: AppCustomTheme.colors.grey,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '10,00€',
                  style: TextStyle(
                    fontSize: 48,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    color: AppCustomTheme.colors.black,
                  ),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '3 Uds',
                  style: TextStyle(
                    fontSize: 48,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    color: AppCustomTheme.colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
