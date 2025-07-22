import 'package:flutter/material.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';
import '../constant/app_colors/app_color.dart';
import '../constant/app_images/app_images.dart';

class SettingsButton extends StatelessWidget {

  final VoidCallback onTap;
  final String title;
  final String image;
  final Color? color;

   SettingsButton({super.key,
     required this.onTap,
     required this.image,
     required this.title,
     this.color,
   });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(screenWidth*.02),
        color: Colors.white,
        child: Row(children: [
          ImageIcon(AssetImage(image),size:screenWidth*.07,color: color?? AppColor.blue,),
          SizedBox(width: screenWidth*.04),
          BlackText(
            text: title,
            textColor: color,
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios_outlined,color:color?? AppColor.blue,size: screenWidth*.05,)
        ],),
      ),
    );
  }
}
