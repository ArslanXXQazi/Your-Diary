import 'package:flutter/material.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';

class YourTaskWidget extends StatelessWidget {

  final String image;
  final String title;
  final String description;
  final double value;

   YourTaskWidget({super.key,
     required this.image,
     required this.title,
     required this.description,
     required this.value,
   });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      padding: EdgeInsets.all(screenWidth*.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: screenHeight * 0.08,
                width: screenWidth * 0.18,
                child: CircularProgressIndicator(
                  value: 0.4,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                  backgroundColor: Colors.grey[200],
                  strokeWidth: screenWidth * 0.013,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child:Center(
                  child: Container(
                    height: screenHeight*.03,
                    width: screenWidth*.08,
                    child: ImageIcon(AssetImage(image),color: Colors.orange,),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight*.02),
          BlackText(
            text: title,
          ),
          SizedBox(height: screenHeight*.02),
          BlackText(
            text: "Your completed ${description}%",
            textColor: Colors.grey,
          ),
          SizedBox(height: screenHeight*.02),
          Container(
            height: screenHeight*.008,
            child: LinearProgressIndicator(
              value: value,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              backgroundColor: Colors.grey[200],

            ),
          )
        ],),
    );
  }
}
