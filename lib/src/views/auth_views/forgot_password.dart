import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yourdiary/src/controller/common_widgets/green_button.dart';
import 'package:yourdiary/src/controller/common_widgets/text_feild_widget.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';
import 'package:yourdiary/src/controller/constant/app_images/app_images.dart';
import 'package:yourdiary/src/routes/app_routes.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
              text: "Please enter your email address. We will send you a link to reset your password",
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: screenHeight*.03),
            TextFieldWidget(controller: emailController, hintText: "Email"),
            SizedBox(height: screenHeight*.04),
            GreenButton(onTap: (){}, text: "Send Link"),
          ],),
      ),
    );
  }
}
