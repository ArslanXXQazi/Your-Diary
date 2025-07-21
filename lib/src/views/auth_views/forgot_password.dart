import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourdiary/src/controller/common_widgets/blue_button.dart';
import 'package:yourdiary/src/controller/common_widgets/text_feild_widget.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';
import 'auth_controller/auth_controller.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final AuthController authController = Get.put(AuthController());
    final _formKey = GlobalKey<FormState>();
    final autoValidate = false.obs;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
        child: Obx(() => Form(
          key: _formKey,
          autovalidateMode: autoValidate.value ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlackText(
                text: "Please enter your email address. We will send you a link to reset your password",
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: screenHeight * .03),
              TextFieldWidget(
                controller: authController.emailController,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                validator: authController.validateEmail,
              ),
              SizedBox(height: screenHeight * .04),
              BlueButton(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // No reset logic, just UI
                    } else {
                      autoValidate.value = true;
                    }
                  },
                  text: "Send Link"),
            ],
          ),
        )),
      ),
    );
  }
}
