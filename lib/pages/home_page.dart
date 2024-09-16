import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_face_ai/constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F8FF),
      appBar: AppBar(title: Text("TrueFaceAI",style: GoogleFonts.poppins(fontSize: 24,color: AppColors.secondaryColor),),backgroundColor: AppColors.primaryColor,),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 710,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow:  [
                  BoxShadow(
                      blurRadius: 10.0,
                      spreadRadius: 0.3,
                      color: Colors.grey.shade400,
                      offset: Offset(8, 14)
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(

                    height: 350,
                    width: 340,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30))),
                  ),

                  Container(
                    height: 350,
                    width: 340,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30))),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
