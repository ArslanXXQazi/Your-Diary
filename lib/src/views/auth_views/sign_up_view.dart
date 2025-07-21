import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yourdiary/src/controller/common_widgets/green_button.dart';
import 'package:yourdiary/src/controller/common_widgets/text_feild_widget.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';
import 'package:yourdiary/src/routes/app_routes.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: screenWidth*.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlackText(
              text: "Create your account",
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
            SizedBox(height: screenHeight*.03),
            TextFieldWidget(
              controller: confirmController,
              hintText: "Confirm Password",
              suffixIcon: Icon(Icons.remove_red_eye_outlined),
            ),
            SizedBox(height: screenHeight*.04),
            GreenButton(onTap: (){
              Get.toNamed(AppRoutes.signInView);
            }, text: "Sign Up"),
            SizedBox(height: screenHeight*.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlackText(
                  text: "Already have an account ",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                BlackText(
                  onTap: (){
                    Get.toNamed(AppRoutes.signInView);
                  },
                  text: " Sign In",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ],)
          ],),
      ),
    );
  }
}
