import 'package:flutter/material.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';
import '../constant/app_colors/app_color.dart';
import '../constant/app_images/app_images.dart';

class SettingsButton extends StatelessWidget {

  final VoidCallback onTap;
  final String title;
  final String image;
  final Color? imageColor;
  final Color? iconColor;
  final Color? textColor;

   SettingsButton({super.key,
     required this.onTap,
     required this.image,
     required this.title,
     this.textColor,
     this.iconColor,
     this.imageColor
   });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: (){
      },
      child: Container(
        padding: EdgeInsets.all(screenWidth*.02),
        color: Colors.white,
        child: Row(children: [
          ImageIcon(AssetImage(AppImages.yourSelf),size:screenWidth*.07,color: AppColor.blue,),
          SizedBox(width: screenWidth*.02),
          BlackText(
            text: "Account Settings",
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios_outlined,color: AppColor.blue,size: screenWidth*.05,)
        ],),
      ),
    );
  }
}
