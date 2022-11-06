import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';

class ForGetPassText extends StatelessWidget {
  const ForGetPassText({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Center(
        child: Text(
          "Forgot Password?",
          style: TextStyle(
            color: AppColor.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
