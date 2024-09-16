import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_face_ai/constants/colors.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,title: Text("Video Analysis",style: GoogleFonts.manrope(fontWeight: FontWeight.w700,fontSize: 18),),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Analysis in Progress",style: GoogleFonts.manrope(fontSize: 15,fontWeight: FontWeight.w600),),
                Text("30%",style: GoogleFonts.manrope(),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: LinearProgressIndicator(minHeight: 8,borderRadius: BorderRadius.circular(10),value: 0.3,backgroundColor: Colors.grey[300],color: Colors.blue,),
            ),
            Text("We're analyzing your video to detect deepfakes.\n This may take a few minutes.",style: GoogleFonts.manrope(fontWeight: FontWeight.w500,fontSize: 14.4),textAlign: TextAlign.center,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Icon(Icons.lock_outline,size: 24,),
                  SizedBox(width: 8,),
                  Expanded(child: Text("The Video you Provided is Private and will not be shared",maxLines: 1,overflow: TextOverflow.ellipsis,style: GoogleFonts.manrope(color: Colors.grey[500],fontWeight: FontWeight.w500,)))
                ],
              ),
            ),
            ElevatedButton(style: ButtonStyle(minimumSize: WidgetStatePropertyAll(Size(double.maxFinite,48)),backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),onPressed: (){}, child: Text("Cancel Analysis",style: GoogleFonts.manrope(color: Colors.white,fontWeight: FontWeight.w700,),)),

          ],
        ),
      ),
    );
  }
}
