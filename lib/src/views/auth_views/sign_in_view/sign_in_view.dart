import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yourdiary/src/controller/common_widgets/green_button.dart';
import 'package:yourdiary/src/controller/common_widgets/text_feild_widget.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';
import 'package:yourdiary/src/controller/constant/app_images/app_images.dart';
import 'package:yourdiary/src/routes/app_routes.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
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
               controller: passwordController,
               hintText: "Password",
               suffixIcon: Icon(Icons.remove_red_eye_outlined),
           ),
            SizedBox(height: screenHeight*.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              BlackText(
                onTap: (){},
                text: "Forgot Password?",
                fontWeight: FontWeight.w600,
              ),
            ],),
            SizedBox(height: screenHeight*.04),
            GreenButton(onTap: (){}, text: "Sign In"),
            SizedBox(height: screenHeight*.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlackText(
                  text: "Don’t have an account? ",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                BlackText(
                  onTap: (){
                    Get.toNamed(AppRoutes.signUpView);
                  },
                  text: " Sign Up",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
            ],)
        ],),
      ),
    );
  }
}
