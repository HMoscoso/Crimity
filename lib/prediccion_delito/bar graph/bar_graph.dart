
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bar_data.dart';

class MyBarGraph extends StatelessWidget{
  final List weeklySummary;
  const MyBarGraph({
    super.key,
    required this.weeklySummary,
});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      sunAmount: weeklySummary[0],
      monAmount: weeklySummary[1],
      tueAmount: weeklySummary[2],
      wedAmount: weeklySummary[3],
      thurAmount: weeklySummary[4],
      satAmount: weeklySummary[5],
    );
    myBarData.initializeBarData();
    return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child:Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black54,
                ),
              ),
              centerTitle: true,
            ),
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
            child: Center(
        child: Column(
        children: [
              Text(
                'Grafico estadistico',
                style: GoogleFonts.bebasNeue(
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Grafico estadistico de prediccion de delitos',
                    style: TextStyle(
                      color:  Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80,),SizedBox(
      height: 400,
        child: BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        gridData: FlGridData(show: false,),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false, getTitlesWidget:
          getBottomTitles)),
        ),
        barGroups: myBarData.barData
            .map(
                (data) => BarChartGroupData(
                    x: data.x,
                    barRods: [
                      BarChartRodData(toY: data.y,
                      color: Colors.grey[800],
                      width: 20,
                      borderRadius: BorderRadius.circular(4),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: 100,
                        color: Colors.grey[100],
                      )),
                    ],
                ),)
          .toList(),
      ),
    )
    )
  ]    )
    )
    )
    )
    );
  }
  
}

Widget getBottomTitles (double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  late Widget text;
  switch (value.toInt()){
    case 0:
      text = const Text('LO', style: style);
      break;
    case 1:
      text = const Text('SMP', style: style);
      break;
    case 2:
      text = const Text('Callao', style: style);
      break;
    case 3:
      text = const Text('Miraflores', style: style);
      break;
    case 4:
      text = const Text('Los Olivos', style: style);
      break;
    case 5:
      text = const Text('Los Olivos', style: style);
      break;
  }
  
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}