import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartSample extends StatelessWidget {
  Map<String, double>dataMap={
    "Fat": 1,
    "Protein": 16,
    "Mineral": 1,
    "Fibre": 2,
    "Calcuim": 380,
    "Moisture": 78,
    "Energie":89,
    "Phosphorus": 180,
    "Iron": 1,
  };
   PieChartSample({super.key});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: PieChart(dataMap: dataMap,
      chartLegendSpacing: 6,
      chartRadius: MediaQuery.of(context).size.width/1.5,
      chartValuesOptions:  const ChartValuesOptions(
        showChartValuesInPercentage: true,
      ),),
    );
  }
}