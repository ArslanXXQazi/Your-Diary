import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';
import 'package:yourdiary/src/controller/common_widgets/your_teacher_widget.dart';
import 'package:yourdiary/src/controller/constant/app_colors/app_color.dart';

class SubjectDetailView extends StatelessWidget {
  const SubjectDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(children: [
        Container(
          height: screenHeight * 0.28,
          width: double.infinity,
          color: AppColor.blue,
          child: Padding(
            padding: EdgeInsets.only(left: screenHeight*.02,right:screenHeight*.02,top: screenHeight*.06),
            child: Column(
              children: [
               Row(
                 children: [
                 GestureDetector(
                   onTap: (){Get.back();},
                   child: Row(children: [
                     Row(children: [
                       Icon(Icons.arrow_back_ios,color: Colors.white,),
                       BlackText(text: "Back",textColor: Colors.white,)
                     ],)
                   ],),
                 ),
                 Padding(
                   padding: EdgeInsets.only(left: screenWidth*.2),
                   child: BlackText(
                     text: "Math",
                     fontSize: 20,
                     textColor: Colors.white,
                     fontWeight: FontWeight.w700,
                   ),
                 ),
               ],),
               SizedBox(height: screenHeight*.03),
               Row(
                 children: [
                   Stack(
                     children: [
                       SizedBox(
                         height: screenWidth * 0.2,
                         width: screenWidth * 0.2,
                         child: CircularProgressIndicator(
                           value: 0.6,
                           valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                           backgroundColor: Colors.white.withOpacity(.3),
                           strokeWidth: screenWidth * 0.02,
                         ),
                       ),
                       Positioned(
                         left: 0,
                         right: 0,
                         top: 0,
                         bottom: 0,
                         child: Center(
                           child: BlackText(
                             text: "60%",
                             fontSize: 16,
                             textColor: Colors.white,
                             fontWeight: FontWeight.w500,
                           ),
                         ),
                       ),
                     ],
                   ),
                   SizedBox(width: screenWidth*.06),
                   Expanded(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         BlackText(
                           text: "Good Results!",
                           fontSize: 20,
                           fontWeight: FontWeight.w700,
                           textColor: Colors.white,
                         ),
                         BlackText(
                           text: "Your homework is almost done.",
                           fontSize: 16,
                           textAlign: TextAlign.start,
                           fontWeight: FontWeight.w500,
                           textColor: Colors.white,
                         ),
                       ],),
                   )
                 ],
               ),
              ],
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenWidth*.02,vertical: screenHeight*.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            BlackText(
              text: "Your Teacher",
              textAlign: TextAlign.start,
              textColor: Colors.grey,
            ),
            SizedBox(height: screenHeight*.02,),
           YourTeacherWidget(
               onTap: (){},
               teacherName: "Arslan Qazi",
               subjectName: "Math"),
              SizedBox(height: screenHeight*.02,),
              BlackText(
                text: "Your Task",
                textAlign: TextAlign.start,
                textColor: Colors.grey,
              ),
              SizedBox(height: screenHeight*.02,),
              Container(
                
              )
          ],),
        )
      ],),
    );
  }
}
