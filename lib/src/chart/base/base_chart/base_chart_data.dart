import 'dart:async';

import 'package:fl_chart/src/chart/bar_chart/bar_chart_data.dart';
import 'package:fl_chart/src/chart/line_chart/line_chart_data.dart';
import 'package:fl_chart/src/chart/pie_chart/pie_chart_data.dart';
import 'package:flutter/material.dart';

import 'base_chart_painter.dart';
import 'touch_input.dart';

/// This class holds all data needed to [BaseChartPainter],
/// in this phase just the [FlBorderData] provided
/// to drawing chart border line,
/// see inherited samples:
/// [LineChartData], [BarChartData], [PieChartData]
class BaseChartData {
  FlBorderData borderData;
  FlTouchData touchData;

  BaseChartData({
    this.borderData,
    this.touchData,
  }) {
    borderData ??= FlBorderData();
  }
}

/***** BorderData *****/
/// Border Data that contains
/// used the [Border] class to draw each side of border.
class FlBorderData {
  final bool show;
  Border border;

  FlBorderData({
    this.show = true,
    this.border,
  }) {
    border ??= Border.all(
        color: Colors.black,
        width: 1.0,
        style: BorderStyle.solid,
      );
  }
}


/***** TouchData *****/
/// holds information about touch on the chart
class FlTouchData {
  /// determines enable or disable the touch in the chart
  final bool enabled;

  /// chart notifies the touch responses through this [StreamSink]
  /// in form of a [BaseTouchResponse] class
  final StreamSink<BaseTouchResponse> touchResponseSink;

  const FlTouchData(this.enabled, this.touchResponseSink);
}


/***** TitlesData *****/
/// we use this typedef to determine which titles
/// we should show (according to the value),
/// we pass the value and get a boolean to show the title for that value.
typedef GetTitleFunction = String Function(double value);

String defaultGetTitle(double value) {
  return '${value}';
}

/// This class is responsible to hold data about showing titles.
/// titles show on the each side of chart
class FlTitlesData {
  final bool show;

  final SideTitles leftTitles, topTitles, rightTitles, bottomTitles;

  const FlTitlesData({
    this.show = true,
    this.leftTitles = const SideTitles(reservedSize: 40, showTitles: true),
    this.topTitles = const SideTitles(reservedSize: 6),
    this.rightTitles = const SideTitles(reservedSize: 40,),
    this.bottomTitles = const SideTitles(reservedSize: 22, showTitles: true),
  });
}

/// specify each side titles data
class SideTitles {
  final bool showTitles;
  final GetTitleFunction getTitles;
  final double reservedSize;
  final TextStyle textStyle;
  final double margin;
  final Alignment textAlignment;

  const SideTitles({
    this.showTitles = false,
    this.getTitles = defaultGetTitle,
    this.reservedSize = 22,
    this.textStyle = const TextStyle(
      color: Colors.black,
      fontSize: 11,
    ),
    this.margin = 6,
    this.textAlignment = Alignment.center,

  });
}

/// this class holds the touch response details,
/// specific touch details should be hold on the concrete child classes
class BaseTouchResponse {
  final FlTouchInput touchInput;

  BaseTouchResponse(this.touchInput);
}