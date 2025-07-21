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
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
          height: screenHeight*.25,
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
                ],)
              ],)
            ],),
          ),
        ),
      ],),
    );
  }
}
