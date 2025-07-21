import 'package:flutter/material.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';
import 'package:yourdiary/src/controller/constant/app_colors/app_color.dart';

class DiaryView extends StatelessWidget {
  const DiaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(children: [
        Container(
          height: screenHeight*.3,
          width: double.infinity,
          color: AppColor.blue,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: screenWidth*.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  BlackText(
                    text: "Hello",
                    textColor: Colors.white,
                  ),
                  SizedBox(height: screenHeight*.01),
                  BlackText(
                    text: "Victoria",
                    textColor: Colors.white,
                    fontSize: 25,
                  ),
                ],),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: screenHeight*.08,
                    width: screenWidth*.18,
                    color: Colors.white,
                  ),
                )
              ],),
              SizedBox(height: screenHeight*.015),

            ],),
          ),
        ),
        SizedBox(height: screenHeight*.02),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenWidth*.02),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlackText(
                  text: "Home Work",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                BlackText(
                  onTap: (){},
                  text: "See all subjects",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textColor: AppColor.blue,
                ),
              ],),
            SizedBox(height: screenHeight*.02),
          ],),
        )
      ],),
    );
  }
}
