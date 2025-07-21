import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourdiary/src/controller/common_widgets/green_button.dart';
import 'package:yourdiary/src/controller/common_widgets/text_feild_widget.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';
import 'package:yourdiary/src/routes/app_routes.dart';
import 'auth_controller/auth_controller.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
                text: "Create your account",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: screenHeight * .03),
              TextFieldWidget(
                controller: authController.emailController,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                validator: authController.validateEmail,
              ),
              SizedBox(height: screenHeight * .03),
              Obx(() => TextFieldWidget(
                    controller: authController.passwordController,
                    hintText: "Password",
                    isPassword: true,
                    validator: authController.validatePassword,
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
              SizedBox(height: screenHeight * .03),
              Obx(() => TextFieldWidget(
                    controller: authController.confirmPasswordController,
                    hintText: "Confirm Password",
                    isPassword: true,
                    validator: authController.validateConfirmPassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        authController.isConfirmPasswordObscure.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () {
                        authController.isConfirmPasswordObscure.value =
                            !authController.isConfirmPasswordObscure.value;
                      },
                    ),
                  )),
              SizedBox(height: screenHeight * .04),
              GreenButton(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // No sign up logic, just UI
                      Get.toNamed(AppRoutes.signInView);
                    } else {
                      autoValidate.value = true;
                    }
                  },
                  text: "Sign Up"),
              SizedBox(height: screenHeight * .03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlackText(
                    text: "Already have an account? ",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  BlackText(
                    onTap: () {
                      Get.toNamed(AppRoutes.signInView);
                    },
                    text: " Sign In",
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
