import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';

import 'package:u2me/pages/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColor.primary,
      ),
      home: const SplashScreen(),
    );
  }
}
