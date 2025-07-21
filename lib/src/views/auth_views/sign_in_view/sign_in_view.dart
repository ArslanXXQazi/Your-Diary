import 'package:flutter/material.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         BlackText(
           text: "",
         )
      ],),
    );
  }
}
