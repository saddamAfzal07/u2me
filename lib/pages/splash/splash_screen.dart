import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        const Duration(
          seconds: 3,
        ),
        () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          height: 75,
          width: 150,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
