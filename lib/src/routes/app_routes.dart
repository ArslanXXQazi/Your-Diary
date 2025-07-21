

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:yourdiary/src/views/auth_views/forgot_password.dart';
import 'package:yourdiary/src/views/auth_views/sign_in_view/sign_in_view.dart';
import 'package:yourdiary/src/views/auth_views/sign_up_view.dart';
import 'package:yourdiary/src/views/botom_nav_view/botom_nav_view/botom_nav_view.dart';
import 'package:yourdiary/src/views/starting_views/splash_screen.dart';

class AppRoutes
{
  static String splash='/';
  static String signUpView='/signUpView';
  static String signInView='/signInView';
  static String forgotPassword='/forgotPassword';
  static String botomNavView='/botomNavView';

  static final routes =
  [
    GetPage(
      name: splash,
      page: ()=>SplashScreen(),
    ),

    GetPage(
      name: signUpView,
      page: ()=>SignUpView(),
    ),

    GetPage(
      name: signInView,
      page: ()=>SignInView(),
    ),

    GetPage(
      name: forgotPassword,
      page: ()=>ForgotPassword(),
    ),

    GetPage(
      name: botomNavView,
      page: ()=>BotomNavView(),
    ),


  ];
}