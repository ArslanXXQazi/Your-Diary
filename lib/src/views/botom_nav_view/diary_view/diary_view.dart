import 'package:flutter/material.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';
import 'package:yourdiary/src/controller/constant/app_colors/app_color.dart';
import 'package:yourdiary/src/controller/constant/app_images/app_images.dart';

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
            Row(children: [
              Expanded(child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: screenHeight*.27,
                    color: Colors.white,
                    padding: EdgeInsets.all(screenWidth*.02),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlackText(
                                text: "Math",
                                fontWeight: FontWeight.w600,
                              ),
                              BlackText(
                                text: "Task 1",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                textColor: Colors.grey,
                              ),
                            ],),
                          Stack(
                            children: [
                              SizedBox(
                                height: screenHeight * .05, // Responsive height
                                width: screenWidth * .11,
                                child: CircularProgressIndicator(
                                  value: 0.6,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Fixed blue color
                                  backgroundColor: Colors.grey[200],
                                  strokeWidth: screenWidth * .012,
                                ),
                              ),
                              Positioned(
                                left: 0,right: 0,top: 0,bottom: 0,
                                child: Center(
                                  child:
                                  BlackText(
                                    text: "90%",
                                    fontSize: 12,
                                    textColor: AppColor.blue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  // Icon(Icons.check_circle_rounded,size: screenWidth*.1,color: AppColor.blue,)
                                ),
                              )
                            ],
                          ),

                        ],),
                      SizedBox(height: screenHeight*.01),
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Image(image: AssetImage(AppImages.image1),fit: BoxFit.cover,),
                        ),
                      )
                    ],),
                  ),
                ),
              )),
              SizedBox(width: screenWidth*.03),
              Expanded(child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: screenHeight*.27,
                    color: Colors.white,
                    padding: EdgeInsets.all(screenWidth*.02),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlackText(
                                text: "Math",
                                fontWeight: FontWeight.w600,
                              ),
                              BlackText(
                                text: "Task 1",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                textColor: Colors.grey,
                              ),
                            ],),
                          Stack(
                            children: [
                              SizedBox(
                                height: screenHeight * .05, // Responsive height
                                width: screenWidth * .11,
                                child: CircularProgressIndicator(
                                  value: 0.6,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Fixed blue color
                                  backgroundColor: Colors.grey[200],
                                  strokeWidth: screenWidth * .012,
                                ),
                              ),
                              Positioned(
                                left: 0,right: 0,top: 0,bottom: 0,
                                child: Center(
                                  child:
                                  // BlackText(
                                  //   text: "90%",
                                  //   fontSize: 12,
                                  //   textColor: AppColor.blue,
                                  //   fontWeight: FontWeight.w500,
                                  // ),
                                  Icon(Icons.check_circle_rounded,size: screenWidth*.08,color: AppColor.blue,)
                                ),
                              )
                            ],
                          ),

                        ],),
                      SizedBox(height: screenHeight*.01),
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Image(image: AssetImage(AppImages.image1),fit: BoxFit.cover,),
                        ),
                      )
                    ],),
                  ),
                ),
              )),
            ],)
          ],),
        )
      ],),
    );
  }
}
