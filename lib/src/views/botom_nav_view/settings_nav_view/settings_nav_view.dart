import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';
import 'package:yourdiary/src/controller/constant/app_colors/app_color.dart';
import 'package:yourdiary/src/controller/constant/app_images/app_images.dart';

class SettingsNavView extends StatelessWidget {
  const SettingsNavView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.35,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )
            ),
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
                          text: "Settings",
                          fontSize: 18,
                          textColor: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],),
                  SizedBox(height: screenHeight*.02),
                  CircleAvatar(
                    radius: screenWidth*.13,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: screenHeight*.02),
                  BlackText(
                    text: "Arslan Qazi",
                    fontSize: 18,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  BlackText(
                    text: "Teacher",
                    fontSize: 16,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w400,
                  )

                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight*.02),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: screenWidth*.02),
            child: Column(children: [

            ],),
          )
        ],
      ),
    );
  }
}
