import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = [
      Color(0xff23b6e6),
      Color(0xff02d39a),
    ];
    return AspectRatio(
      aspectRatio: 1.70,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          color: Color(0xff232d37)
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 0.0, left: 0.0, top: 24, bottom: 12),
          child: FlChart(
            chart: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: false,
                  drawHorizontalGrid: false,
                  getDrawingVerticalGridLine: (value) {
                    return const FlLine(
                      color: Color(0xff37434d),
                      strokeWidth:  1,
                    );
                  },
                  getDrawingHorizontalGridLine: (value) {
                    return const FlLine(
                      color: Color(0xff37434d),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 22,
                    textStyle: TextStyle(
                      color: const Color(0xff68737d),
                     //fontWeight: FontWeight.bold,
                    fontSize: 10
                    ),
                    getTitles: (value) {
//                      switch(value.toInt()) {
//                        case 2: return 'MAR';
//                        case 5: return 'JUN';
//                        case 8: return 'SEP';
//                      }
                    print(value.toString());
                    if (value.toString() == "0.123456" || value.toString() == "6.123456")
                      return value.toString();
                    },
                    margin: 0,
                    textAlignment: Alignment.bottomRight,
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    textStyle: TextStyle(
                      color: const Color(0xff67727d),
                      //fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                    getTitles: (value) {
                      if(value.toDouble() == 0.0) {
                        return value.toString();
                      }else if(value.toDouble() == 100)
                        {
                          return "199004444567";
                        }
//                      switch(value.toInt()) {
//                        case 1: return '10k';
//                        case 3: return '30k';
//                        case 5: return '50k';
//                      }
                      //return value.toString();
                    },
                    reservedSize: 0,
                    margin: 0,
                    textAlignment: Alignment.topRight
                  ),
                ),
                borderData: FlBorderData(
                    show: true,
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xff4e4965),
                        width: 1,
                      ),
                      left: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),)
                ),
//                minX: 0,
//                maxX: 10.123456,
                minY: 0,
//                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0.123456, 120),
                      FlSpot(2.123456, 15),
                      FlSpot(4.9, 12),
                      FlSpot(3, 0),
                      //FlSpot(6.8, 3.1),
                      //FlSpot(8, 4),
                      //FlSpot(9.5, 3),
                      FlSpot(6.123456, 10),
                    ],
                    isCurved: true,
                    colors: gradientColors,
                    barWidth: 1,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: false,
                    ),
                    belowBarData: BelowBarData(
                      show: true,
                      colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}