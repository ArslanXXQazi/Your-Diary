import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourdiary/src/controller/common_widgets/blue_button.dart';
import 'package:yourdiary/src/controller/common_widgets/text_feild_widget.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';
import 'package:yourdiary/src/controller/constant/app_images/app_images.dart';
import 'package:yourdiary/src/routes/app_routes.dart';
import '../auth_controller/auth_controller.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
                text: "Login to your account",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: screenHeight * .03),
              TextFieldWidget(
                controller: authController.emailController,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
               // validator: authController.validateEmail,
              ),
              SizedBox(height: screenHeight * .03),
              Obx(() => TextFieldWidget(
                    controller: authController.passwordController,
                    hintText: "Password",
                    isPassword: true,
                  //  validator: authController.validatePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        authController.isPasswordObscure.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () {
                        authController.isPasswordObscure.value =
                            !authController.isPasswordObscure.value;
                      },
                    ),
                  )),
              SizedBox(height: screenHeight * .01),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BlackText(
                    onTap: () {
                      Get.toNamed(AppRoutes.forgotPassword);
                    },
                    text: "Forgot Password?",
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * .04),
              BlueButton(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                     Get.toNamed(AppRoutes.botomNavView);
                    } else {
                      autoValidate.value = true;
                    }
                  },
                  text: "Sign In"),
              SizedBox(height: screenHeight * .03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlackText(
                    text: "Don’t have an account? ",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  BlackText(
                    onTap: () {
                      Get.toNamed(AppRoutes.signUpView);
                    },
                    text: " Sign Up",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
