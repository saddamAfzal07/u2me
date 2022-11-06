import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';

import 'package:u2me/pages/settings/onclick/widget/setting_screen_widget.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

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
            "Data Policy",
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
            child: SettingScreenWidget(
              title: "Browse the latest styles",
              Description:
                  "Browse the latest styles tap the heart to add items you love to your closet. Browse the latest styles, tap the heart to add items you love to your closet. Browse theu love to your closet. Browse the latest styles, tap the heart to add items you love to your closet. Browse the latest styles, tap the heart to add items you love to  your closet. Browse t heu love to your closet. Browse the latest styles, tap the heart to add items you love to your closet. Browse the latest styles, tap the heart to add items you love to your closet. Browse theu love to your closet. Browse the latest styles, tap the heart to add items you love to your closet. Browse the latest styles, tap the heart to add items you love to  your closet. Browse t heu love to your closet.",
            ),
          ),
        ),
      ),
    );
  }
}
