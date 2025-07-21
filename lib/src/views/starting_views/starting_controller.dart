import 'package:get/get.dart';
import 'dart:async';

import 'package:yourdiary/src/routes/app_routes.dart';


class StartingController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Timer(const Duration(seconds: 3), () {
      Get.offAndToNamed(AppRoutes.signInView);
    });
  }
}