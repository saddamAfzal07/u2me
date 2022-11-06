import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';

import 'package:u2me/constants/widgets/image.dart';
import 'package:u2me/constants/widgets/select_signup_item.dart';
import 'package:u2me/constants/widgets/setting_screen_item.dart';
import 'package:u2me/pages/auth/widget/term_policy_text.dart';

import '../../../constants/widgets/padding.dart';

class SelectLanguagesScreen extends StatelessWidget {
  const SelectLanguagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.background,
          // actions: [
          //   Image.asset(
          //     "assets/images/drawer.png",
          //     // width: 7,
          //     // height: 12,
          //   ),
          // ],
          leading: Image.asset(
            "assets/images/backarrow.png",
            width: 7,
            height: 12,
          ),
          title: const Text(
            "Language",
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: AppColor.white,
            ),
          ),
        ),
        backgroundColor: AppColor.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: Column(
              children: [
                padding64,
                SettingScreenItem(
                  image: "assets/images/uk.png",
                  title: "English",
                  onTap: () {},
                ),
                SettingScreenItem(
                  image: "assets/images/germany.png",
                  title: "Germany",
                  onTap: () {},
                ),
                SettingScreenItem(
                  image: "assets/images/SPAIN.png",
                  title: "Spain",
                  onTap: () {},
                ),
                SettingScreenItem(
                  image: "assets/images/france.png",
                  title: "France",
                  onTap: () {},
                ),
                SettingScreenItem(
                  image: "assets/images/SERBIA.png",
                  title: "Serbia",
                  onTap: () {},
                ),
                SettingScreenItem(
                  image: "assets/images/SWEDEN.png",
                  title: "Sweden",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
