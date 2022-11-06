import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/widgets/button_item.dart';
import 'package:u2me/constants/widgets/image.dart';
import 'package:u2me/constants/widgets/padding.dart';
import 'package:u2me/pages/auth/widget/forget_password.dart';
import 'package:u2me/pages/auth/widget/term_policy_text.dart';

class WelcomeAuth extends StatelessWidget {
  const WelcomeAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: Column(
            children: [
              padding100,
              const ImageItem(),
              padding100,
              ButtonItem(
                onTap: () {},
                text: "SIGN IN",
              ),
              padding4,
              ButtonItem(
                onTap: () {},
                text: "SIGN UP",
              ),
              const Spacer(),
              const ForGetPassText(),
              const Spacer(),
              const TermAndPolicy(),
              padding16,
            ],
          ),
        ),
      ),
    );
  }
}
