import 'package:beerapp/src/presentation/stadistics/widgets/line_chart_stadistics.dart';
import 'package:beerapp/src/themes/themes.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StadisticsBody extends StatelessWidget {
  const StadisticsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Text(
                'Estadísticas',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  color: AppCustomTheme.colors.black,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0, left: 30, right: 30),
              child: StadisticCard(title: 'Bebidas totales', value: 0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 30, right: 30),
              child: LineChartStadistics(),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0, left: 30, right: 30),
              child: StadisticCard(title: 'Consumo total', value: 0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 30, right: 30),
              child: LineChartStadistics(),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0, left: 30, right: 30),
              child: StadisticCard(title: 'Día mayor consumición', value: 0),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0, left: 30, right: 30),
              child: StadisticCard(title: 'Mejor compañero', value: 0),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}

class StadisticCard extends StatelessWidget {
  final String title;
  final int value;

  const StadisticCard({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppCustomTheme.colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 1,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                color: AppCustomTheme.colors.black,
              ),
            ),
            const Spacer(),
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                color: AppCustomTheme.colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
