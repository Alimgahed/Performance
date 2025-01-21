import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

// ignore: use_key_in_widget_constructors
class YearDegreeChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Year vs Degree Chart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 100,
            barGroups: [
              BarChartGroupData(
                x: 2010,
                barRods: [
                  BarChartRodData(
                    toY: 40,
                    gradient: const LinearGradient(
                      colors: [Color(0xff23b6e6), Color(0xff02d39a)],
                    ),
                  ),
                ],
              ),
              BarChartGroupData(
                x: 2012,
                barRods: [
                  BarChartRodData(
                    toY: 50,
                    gradient: const LinearGradient(
                      colors: [Color(0xff23b6e6), Color(0xff02d39a)],
                    ),
                  ),
                ],
              ),
              BarChartGroupData(
                x: 2015,
                barRods: [
                  BarChartRodData(
                    toY: 60,
                    gradient: const LinearGradient(
                      colors: [Color(0xff23b6e6), Color(0xff02d39a)],
                    ),
                  ),
                ],
              ),
              BarChartGroupData(
                x: 2018,
                barRods: [
                  BarChartRodData(
                    toY: 80,
                    gradient: const LinearGradient(
                      colors: [Color(0xff23b6e6), Color(0xff02d39a)],
                    ),
                  ),
                ],
              ),
              BarChartGroupData(
                x: 2020,
                barRods: [
                  BarChartRodData(
                    toY: 70,
                    gradient: const LinearGradient(
                      colors: [Color(0xff23b6e6), Color(0xff02d39a)],
                    ),
                  ),
                ],
              ),
              BarChartGroupData(
                x: 2024,
                barRods: [
                  BarChartRodData(
                    toY: 90,
                    gradient: const LinearGradient(
                      colors: [Color(0xff23b6e6), Color(0xff02d39a)],
                    ),
                  ),
                ],
              ),
            ],
            titlesData: const FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 10,
                ),
              ),
            ),
            gridData: const FlGridData(show: true),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d)),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: YearDegreeChart(),
  ));
}
