import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/widgets/continue_button_item.dart';
import 'package:u2me/constants/widgets/padding.dart';

class SuccessfulSubsription extends StatelessWidget {
  String title;
  SuccessfulSubsription({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppColor.background,
            leading: Image.asset(
              "assets/images/backarrow.png",
              width: 7,
              height: 12,
            ),
            title: const Text(
              "Premium Membership",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: AppColor.white,
              ),
            ),
          ),
          backgroundColor: AppColor.background,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  padding100,
                  Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset(
                      "assets/images/sccessful.png",
                      width: 17,
                      height: 17,
                    ),
                  ),
                  padding24,
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17.0,
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
