import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/widgets/button_item.dart';
import 'package:u2me/constants/widgets/image.dart';
import 'package:u2me/constants/widgets/padding.dart';
import 'package:u2me/pages/auth/widget/question_for_action.dart';

import 'package:u2me/pages/auth/widget/term_policy_text.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController resetemail = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    padding100,
                    const ImageItem(),
                    padding80,
                    TextFormField(
                      textAlign: TextAlign.center,
                      controller: resetemail,
                      cursorColor: AppColor.white,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.white),
                        ),
                        hintText: "Enter Email",
                        hintStyle: TextStyle(
                          color: AppColor.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    padding16,
                    ButtonItem(
                      text: "Log In",
                      onTap: () {},
                    ),
                    padding16,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Enter the email address you used to create your account and we will email you a link to reset your password",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    padding100,
                    const QuestionText(
                      color: AppColor.white,
                      questionTitle: "You have an account? ",
                      actionTitle: "Log In",
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: TermAndPolicy(),
                      ),
                    ),
                    padding16,
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
