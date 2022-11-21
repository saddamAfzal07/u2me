import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';

import 'package:u2me/constants/widgets/image.dart';
import 'package:u2me/constants/widgets/select_signup_item.dart';
import 'package:u2me/constants/widgets/setting_screen_item.dart';
import 'package:u2me/pages/auth/widget/term_policy_text.dart';
import 'package:u2me/pages/settings/onclick/help_screen.dart';
import 'package:u2me/pages/settings/onclick/langages.dart';
import 'package:u2me/pages/settings/onclick/termofuse_screen.dart';

import '../../../constants/widgets/padding.dart';
import 'onclick/data_policy_screen.dart';
import 'onclick/payment_method/payment_method.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.background,
          actions: [
            Image.asset(
              "assets/images/drawer.png",
              // width: 7,
              // height: 12,
            ),
          ],
          leading: Image.asset(
            "assets/images/backarrow.png",
            width: 7,
            height: 12,
          ),
          title: const Text(
            "Setting",
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
                  image: "assets/images/addperson.png",
                  title: "Invite friends",
                  onTap: () {},
                ),
                SettingScreenItem(
                  image: "assets/images/user.png",
                  title: "User ranking",
                  onTap: () {},
                ),
                SettingScreenItem(
                  image: "assets/images/language.png",
                  title: "Language",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SelectLanguagesScreen()));
                  },
                ),
                SettingScreenItem(
                  image: "assets/images/creditcard.png",
                  title: "Payment method",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaymentMethodScreen()));
                  },
                ),
                SettingScreenItem(
                  image: "assets/images/membership.png",
                  title: "Premium Membership",
                  onTap: () {},
                ),
                SettingScreenItem(
                  image: "assets/images/privacy.png",
                  title: "Data Policy",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DataPolicyScreen()));
                  },
                ),
                SettingScreenItem(
                  image: "assets/images/termofuse.png",
                  title: "Terms of Use",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TermOfUseScreen()));
                  },
                ),
                SettingScreenItem(
                  image: "assets/images/help.png",
                  title: "Help",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HelpScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
