import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/widgets/button_item.dart';
import 'package:u2me/constants/widgets/image.dart';
import 'package:u2me/constants/widgets/padding.dart';
import 'package:u2me/pages/auth/widget/question_for_action.dart';
import 'package:u2me/pages/auth/widget/forget_password.dart';
import 'package:u2me/pages/auth/widget/term_policy_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

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
                      controller: email,
                      cursorColor: AppColor.white,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 23, maxHeight: 20),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.white),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.white),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Image.asset(
                            "assets/images/email.png",
                            height: 15,
                            width: 20,
                          ),
                        ),
                        hintText: "Email Address",
                        hintStyle: const TextStyle(
                          color: AppColor.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    padding16,
                    TextFormField(
                      controller: password,
                      cursorColor: AppColor.white,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 23, maxHeight: 20),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.white),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.white),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Image.asset(
                            "assets/images/password.png",
                            height: 15,
                            width: 20,
                          ),
                        ),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                          color: AppColor.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    padding16,
                    TextFormField(
                      controller: confirmPassword,
                      cursorColor: AppColor.white,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 23, maxHeight: 20),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.white),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.white),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Image.asset(
                            "assets/images/password.png",
                            height: 15,
                            width: 20,
                          ),
                        ),
                        hintText: "Confirm Password",
                        hintStyle: const TextStyle(
                          color: AppColor.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    padding32,
                    ButtonItem(
                      text: "Sign up",
                      onTap: () {},
                    ),
                    padding64,
                    const ForGetPassText(),
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