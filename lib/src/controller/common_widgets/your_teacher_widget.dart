import 'package:flutter/material.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';
import 'package:yourdiary/src/controller/constant/app_colors/app_color.dart';

class YourTeacherWidget extends StatelessWidget {

  final String teacherName;
  final String subjectName;
  final VoidCallback onTap;


   YourTeacherWidget({super.key,
     required this.onTap,
     required this.teacherName,
     required this.subjectName,
   });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return  Container(
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth*.025),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: screenHeight * 0.07,
                width: screenWidth * 0.16,
                color: AppColor.blue,
              ),
            ),
            SizedBox(width: screenWidth*.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlackText(
                  text: teacherName,
                  fontWeight: FontWeight.w600,
                ),
                BlackText(
                  text: subjectName,
                  fontWeight: FontWeight.w400,
                  textColor: Colors.grey,
                ),
              ],),
          ],),
          GestureDetector(
            onTap: (){},
            child: Container(
              height: screenHeight * 0.07,
              width: screenWidth * 0.16,
              decoration: BoxDecoration(
                color: AppColor.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(Icons.arrow_circle_right_rounded,color: Colors.white,size: screenWidth*.1,),
            ),
          ),
        ],),
    );
  }
}
