import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';

class TermAndPolicy extends StatelessWidget {
  const TermAndPolicy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Text(
        "By creating an account, you agree to our Terms of Service and Privacy Policy",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColor.white,
          fontSize: 12,
        ),
      ),
    );
  }
}
