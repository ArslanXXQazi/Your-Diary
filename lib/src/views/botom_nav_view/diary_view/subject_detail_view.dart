import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';
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
          height: screenHeight * 0.3,
          width: double.infinity,
          color: AppColor.blue,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                 BlackText(
                   text: "Math",
                   fontSize: 20,
                   textColor: Colors.white,
                   fontWeight: FontWeight.w700,
                 ),
                 BlackText(
                   text: "xxxx",
                   textColor: Colors.transparent,
                 ),
               ],)
              ],
            ),
          ),
        ),
      ],),
    );
  }
}
