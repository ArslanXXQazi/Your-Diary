


import '../../controller/constant/linker/linker.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Container(
        height: screenHeight*.5,
        width: screenWidth*.8,
        child: Lottie.asset('assets/splash.json'),
      )),
    );
  }
}
