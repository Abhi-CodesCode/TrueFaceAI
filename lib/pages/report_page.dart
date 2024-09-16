import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:true_face_ai/constants/colors.dart';

import '../models/confidence_data.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final List<ConfidenceData> data = List.generate(
    10,
    (index) => ConfidenceData(
        frame: index + 1, confidence: 60 + Random().nextInt(40).toDouble()),
  );
  double averageConfidence = 0;
  @override
  void initState() {
    super.initState();
    // Calculate and print the average confidence
    averageConfidence = getAverageConfidence(data);
    print('Average Confidence: $averageConfidence');
  }

  // Function to calculate the average confidence
  double getAverageConfidence(List<ConfidenceData> data) {
    double sum = data.fold(
        0, (previousValue, element) => previousValue + element.confidence);
    return sum / data.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        title: Text(
          "Analysis Report",
          style: GoogleFonts.manrope(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Deep Fake detected",
                  style: GoogleFonts.manrope(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryTextColor),
                ),
                SizedBox(height: 10),
                Text(
                  "This video was analyzed by our machine learning model and it appears to be a deep fake. The model is ${averageConfidence.toStringAsFixed(2)}% confident in its prediction.",
                  style: GoogleFonts.manrope(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryTextColor),
                ),
                SizedBox(height: 32),
                Text(
                  "Confidence Level",
                  style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryTextColor),
                ),
                SizedBox(height: 4),
                Text(
                  "${averageConfidence.toStringAsFixed(2)}%",
                  style: GoogleFonts.manrope(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryTextColor),
                ),
                Text(
                  "The model is ${averageConfidence.toStringAsFixed(2)}% confident in its prediction.",
                  style: GoogleFonts.manrope(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: AppColors.secondaryTextColor),
                ),
                SizedBox(height: 12),
                Text(
                  "Confidence per Frame",
                  style: GoogleFonts.manrope(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryTextColor),
                ),
                SizedBox(height: 25),
                SizedBox(
                  height: 200,
                  child: SfCartesianChart(
                    borderWidth: 0, plotAreaBorderWidth: 0,
                    tooltipBehavior:
                        TooltipBehavior(enable: true, format: 'point.y%'),
                    primaryXAxis: NumericAxis(
                      title: AxisTitle(text: 'Frame'), isVisible: false,
                      majorGridLines:
                          MajorGridLines(width: 0), // Remove grid lines
                      axisLine: AxisLine(width: 0), // Remove axis line
                      majorTickLines: MajorTickLines(size: 0),
                    ), // Remove tick lines ),),
                    primaryYAxis: NumericAxis(
                      title: null, minimum: 0, maximum: 105, labelFormat: '',
                      isVisible: false,
                      majorGridLines:
                          MajorGridLines(width: 0), // Remove grid lines
                      axisLine: AxisLine(width: 0), // Remove axis line
                      majorTickLines: MajorTickLines(size: 0),
                    ), // Remove tick lines ),

                    series: <ChartSeries>[
                      SplineSeries<ConfidenceData, int>(
                        name: "Confidence",
                        color: AppColors.secondaryTextColor,
                        dataSource: data,
                        xValueMapper: (ConfidenceData cd, _) => cd.frame,
                        yValueMapper: (ConfidenceData cd, _) => cd.confidence,
                        opacity: 0.7,
                        enableTooltip: true,
                      )
                    ],
                  ),
                ),
                TextButton(
                  style: ButtonStyle(shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "View Detailed breakdown",
                        style: GoogleFonts.manrope(
                            color: AppColors.primaryTextColor),
                      ),
                      Icon(Icons.navigate_next)
                    ],
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: ElevatedButton(
                    style: ButtonStyle(
                        minimumSize:
                            WidgetStatePropertyAll(Size(double.maxFinite, 48)),
                        backgroundColor:
                            WidgetStatePropertyAll(AppColors.primaryColor),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)))),
                    onPressed: () {},
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.video_file_rounded,color: AppColors.secondaryColor,size: 20,),
                        SizedBox(width: 4,),
                        Text(
                          "Check Video Report",
                          style: GoogleFonts.manrope(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
