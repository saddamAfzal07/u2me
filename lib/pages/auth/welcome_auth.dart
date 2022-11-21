import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/widgets/button_item.dart';
import 'package:u2me/constants/widgets/image.dart';
import 'package:u2me/constants/widgets/padding.dart';
import 'package:u2me/pages/auth/sign_in/sign_in_screen.dart';
import 'package:u2me/pages/auth/sign_up/sign_up_selection_screen.dart';
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
              padding140,
              ButtonItem(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                },
                text: "SIGN IN",
              ),
              padding4,
              ButtonItem(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpSelectionScreen()));
                },
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
