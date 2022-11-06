import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';

import 'package:u2me/constants/widgets/image.dart';
import 'package:u2me/constants/widgets/select_signup_item.dart';
import 'package:u2me/pages/auth/widget/term_policy_text.dart';

import '../../../constants/widgets/padding.dart';

class SignUpSelectionScreen extends StatelessWidget {
  const SignUpSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: Column(
            children: [
              padding100,
              const ImageItem(),
              padding120,
              SelectSignUpItem(
                image: "assets/images/facebook.png",
                title: "Sign up with Facebook",
                onTap: () {},
              ),
              SelectSignUpItem(
                image: "assets/images/google.png",
                title: "Sign up with Facebook",
                onTap: () {},
              ),
              SelectSignUpItem(
                image: "assets/images/email.png",
                title: "Sign up with Facebook",
                onTap: () {},
              ),
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
