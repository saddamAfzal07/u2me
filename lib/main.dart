import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/pages/settings/onclick/chat/chat_screen.dart';
import 'package:u2me/pages/settings/onclick/data_policy_screen.dart';
import 'package:u2me/pages/settings/onclick/payment_method/payment_method.dart';

import 'package:u2me/pages/settings/setting_screen.dart';

import 'pages/settings/onclick/langages.dart';

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
      home: ChatPage(),
    );
  }
}
