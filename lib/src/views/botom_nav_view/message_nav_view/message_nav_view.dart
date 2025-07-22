import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:yourdiary/src/controller/constant/app_colors/app_color.dart';
import 'package:yourdiary/src/controller/constant/app_images/app_images.dart';

import '../../../controller/common_widgets/text_widget.dart';


class MessageNavView extends StatelessWidget {
  const MessageNavView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 20,
          child: Container(
            height: screenHeight * 0.2,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(""),
                  BlackText(
                    text: "Inbox",
                    fontSize: 18,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  ImageIcon(AssetImage(AppImages.settings),color: Colors.white,size: screenWidth*.06,)
                ],),
            ),
          ),
        ),
        Expanded(
            flex: 80,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(screenWidth*.02),
                child: Column(children: [
                  
                ],),
              ),
            ))

      ],),
    );
  }
}
