import 'package:flutter/material.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Row(children: [
              Column(children: [
                
              ],)
            ],)
          ],),
        ),
      ],),
    );
  }
}
