

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:yourdiary/src/views/starting_views/splash_screen.dart';

class AppRoutes
{
  static String splash='/';
  static String signUpView='/signUpView';

  static final routes =
  [
    GetPage(
      name: splash,
      page: ()=>SplashScreen(),
    ),

  ];
}