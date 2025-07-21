import 'package:flutter/material.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';
import 'package:yourdiary/src/controller/constant/app_colors/app_color.dart';

class BlueButton extends StatelessWidget {
  VoidCallback onTap;
  String text;
  double? height;
  double? width;
  double? fontSize;
  double? borderRadius;
  String? image;
  Color? color;
  Color borderColor;
  Color textColor;
  FontWeight fontWeight;

  BlueButton({
    super.key,
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.fontSize,
    this.color ,
    this.borderColor = Colors.white,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.w500,
    this.image,
    this.borderRadius
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ??60,
        decoration: BoxDecoration(
          color: AppColor.blue,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ImageIcon(AssetImage(image!),color: Colors.white,),
                ),
              BlackText(
                text: text,
                textColor: Colors.white,
                fontSize: fontSize ?? 16,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
