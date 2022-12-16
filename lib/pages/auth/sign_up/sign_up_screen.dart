// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:u2me/constants/app_url.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/userinfo.dart';
import 'package:u2me/constants/widgets/button_item.dart';
import 'package:u2me/constants/widgets/changebtn.dart';
import 'package:u2me/constants/widgets/image.dart';
import 'package:u2me/constants/widgets/padding.dart';
import 'package:u2me/pages/auth/widget/forget_password.dart';
import 'package:u2me/pages/auth/widget/term_policy_text.dart';
import 'package:u2me/pages/auth/profile_information/profile_information_screen.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool visibility = true;
  bool emailVerify = false;
  bool passVisibility = true;
  bool passwordVerify = false;
  bool btnForward = false;
  signUpRegistration({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final response = await http.post(
      Uri.parse("${AppUrl.baseUrl}register"),
      body: {
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
      },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "accept": "application/json",
      },
    );

    print(response.body);
    Map<String, dynamic> data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      setState(() {
        visibility = false;
        emailVerify = true;
        passVisibility = false;
        passwordVerify = true;
        btnForward = true;
      });
      UserInfo.token = data["token"];
      UserInfo.userId = data["user"]["id"];
      print(UserInfo.token);
    } else if (data["message"] ==
        "The email has already been taken. (and 1 more error)") {
      setState(() {
        visibility = false;
        emailVerify = false;
        passVisibility = true;
        passwordVerify = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("The email has already been taken"),
        backgroundColor: Colors.red.shade400,
        behavior: SnackBarBehavior.floating,
      ));
    } else if (data["message"] == "The email must be a valid email address.") {
      setState(() {
        visibility = false;
        emailVerify = false;
        passVisibility = true;
        passwordVerify = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("The email must be a valid email address"),
        backgroundColor: Colors.red.shade400,
        behavior: SnackBarBehavior.floating,
      ));
    } else if (data["message"] ==
        "The email must be a valid email address. (and 1 more error)") {
      setState(() {
        visibility = false;
        emailVerify = false;
        passVisibility = true;
        passwordVerify = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("The email must be a valid email address"),
        backgroundColor: Colors.red.shade400,
        behavior: SnackBarBehavior.floating,
      ));
    } else if (data["message"] == "The password field is required.") {
      setState(() {
        visibility = false;
        emailVerify = true;
        passVisibility = false;
        passwordVerify = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("password field is required"),
        backgroundColor: Colors.red.shade400,
        behavior: SnackBarBehavior.floating,
      ));
    } else if (data["message"] ==
        "The password must be at least 8 characters.") {
      setState(() {
        print("==>");
        visibility = false;
        emailVerify = true;
        passVisibility = false;
        passwordVerify = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("The password must be at least 8 characters."),
        backgroundColor: Colors.red.shade400,
        behavior: SnackBarBehavior.floating,
      ));
    } else if (data["message"] ==
        "The password must be at least 8 characters. (and 1 more error)") {
      setState(() {
        visibility = false;
        emailVerify = true;
        passVisibility = false;
        passwordVerify = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("The password must be at least 8 characters."),
        backgroundColor: Colors.red.shade400,
        behavior: SnackBarBehavior.floating,
      ));
    }

    if (data["message"] == "The password confirmation does not match.") {
      setState(() {
        visibility = false;
        emailVerify = true;
        passVisibility = false;
        passwordVerify = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Password and Confirm Password must be same"),
        backgroundColor: Colors.red.shade400,
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

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
                key: formKey,
                child: Column(
                  children: [
                    padding100,
                    const ImageItem(),
                    padding80,
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 20, right: 10),
                          child: visibility
                              ? const Text("")
                              : emailVerify
                                  ? const Text(
                                      "Valid",
                                      style: TextStyle(
                                        color: AppColor.primary,
                                      ),
                                    )
                                  : const Text(
                                      "Not Valid",
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
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
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 20, right: 10),
                          child: passVisibility
                              ? const Text("")
                              : passwordVerify
                                  ? const Text(
                                      "Valid",
                                      style: TextStyle(
                                        color: AppColor.primary,
                                      ),
                                    )
                                  : const Text(
                                      "Not Valid",
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
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
                      style: const TextStyle(color: Colors.white),
                      obscureText: true,
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 20, right: 10),
                          child: passVisibility
                              ? const Text("")
                              : passwordVerify
                                  ? const Text(
                                      "Valid",
                                      style: TextStyle(
                                        color: AppColor.primary,
                                      ),
                                    )
                                  : const Text(
                                      "Not Valid",
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
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
                    btnForward
                        ? ChangeButtonItem(
                            text: "Sign up",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ProfileInfoScreen(),
                                ),
                              );
                            },
                          )
                        : ButtonItem(
                            text: "Sign up",
                            onTap: () {
                              final isvalid = formKey.currentState!.validate();
                              if (isvalid) {
                                // if (password.text == confirmPassword.text) {
                                signUpRegistration(
                                    email: email.text,
                                    password: password.text,
                                    confirmPassword: confirmPassword.text);
                              } else {}
                            },
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
