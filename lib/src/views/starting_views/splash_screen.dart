import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'starting_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StartingController());

    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: screenHeight * 0.5,
          width: screenWidth * 0.8,
          child: Lottie.asset(
            'assets/splash.json',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}