import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_face_ai/constants/colors.dart';

class AnalysisGraphWidget extends StatelessWidget {
  const AnalysisGraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text("Title",
            style: GoogleFonts.manrope(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryTextColor),
          ),
          SizedBox(height: 8,),
          Text("Opinion",
            style: GoogleFonts.manrope(
                fontSize: 23,
                fontWeight: FontWeight.w800,
                color: AppColors.primaryTextColor),
          ),

        ]
      ),
    );
  }
}
