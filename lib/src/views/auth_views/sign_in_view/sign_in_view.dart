import 'package:flutter/material.dart';
import 'package:yourdiary/src/controller/common_widgets/text_feild_widget.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';
import 'package:yourdiary/src/controller/constant/app_images/app_images.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    TextEditingController emailController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: screenWidth*.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           BlackText(
             text: "Login to your account",
             fontSize: 20,
             fontWeight: FontWeight.w600,
           ),
           SizedBox(height: screenHeight*.03),
           TextFieldWidget(controller: emailController, hintText: "Email"),
            SizedBox(height: screenHeight*.03),
           TextFieldWidget(
               controller: emailController,
               hintText: "Password",
               suffixIcon: Icon(Icons.remove_red_eye_outlined),
           ),
            SizedBox(height: screenHeight*.03),
            
        ],),
      ),
    );
  }
}
