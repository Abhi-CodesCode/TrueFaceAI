import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_face_ai/constants/colors.dart';
import 'package:true_face_ai/models/model_analysis.dart';
import 'package:true_face_ai/widgets/analysis_graph_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String,ModelAnalysis> analytics={};
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Forensic Analysis",
                style: GoogleFonts.manrope(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryTextColor),
              ),
              SizedBox(height: 20,),
              Expanded(
                child:
                  ListView.builder(itemCount: 1,itemBuilder: (context,index){
                    return AnalysisGraphWidget();
                  }),
              )

            ],
          ),
        ),
      ),
    );
  }
}
