import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:u2me/constants/app_url.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/userinfo.dart';
import 'package:u2me/constants/widgets/button_item.dart';
import 'package:u2me/constants/widgets/image.dart';
import 'package:u2me/constants/widgets/padding.dart';
import 'package:u2me/pages/auth/widget/question_for_action.dart';
import 'package:u2me/pages/auth/widget/forget_password.dart';
import 'package:u2me/pages/auth/widget/term_policy_text.dart';
import 'package:u2me/pages/profile_information/selection_profile_screen.dart';

import '../reset_password/reset_password_screen.dart';
import 'package:http/http.dart' as http;

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool notVisibity = true;
  String? passvalidation(value) {
    if (value == null || value.isEmpty) {
      return "password is required";
    }
    // else if (value.length < 8) {
    //   return "password must be  5 Characters";
    // } else if (value.length > 15) {
    //   return "password is too Long";
    // }
    else {
      return null;
    }
  }

  signIn({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse("${AppUrl.baseUrl}login"),
      body: {
        'email': email,
        'password': password,
      },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "accept": "application/json",
      },
    );

    print(response.body);
    Map<String, dynamic> data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      if (data["message"] == "User login Successfully") {
        setState(() {
          UserInfo.token = data["token"];
        });
        UserInfo.userId = data["user"]["id"];
        UserInfo.userEmail = data["user"]["email"];

        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SelectionProfile(),
          ),
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text("Email or Password is Incorrect"),
          backgroundColor: Colors.red.shade400,
          behavior: SnackBarBehavior.floating,
        ));
      }
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Something went wrong"),
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
                  key: _formKey,
                  child: Column(
                    children: [
                      padding100,
                      const ImageItem(),
                      padding80,
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        validator: MultiValidator(
                          [
                            RequiredValidator(errorText: "Email is required"),
                            EmailValidator(errorText: "Not a valid Email"),
                          ],
                        ),
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
                        style: const TextStyle(color: Colors.white),
                        obscureText: notVisibity,
                        validator: passvalidation,
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
                          suffix: notVisibity
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        notVisibity = false;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.visibility_off,
                                      color: AppColor.white,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        notVisibity = true;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.visibility,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                          hintStyle: const TextStyle(
                            color: AppColor.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      padding32,
                      ButtonItem(
                        text: "Log In",
                        onTap: () {
                          final isvalid = _formKey.currentState!.validate();
                          if (isvalid) {
                            signIn(email: email.text, password: password.text);
                          } else {}
                        },
                      ),
                      padding64,
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ResetPasswordScreen()));
                          },
                          child: const ForGetPassText()),
                      padding12,
                      const QuestionText(
                        color: AppColor.primary,
                        questionTitle: "Don't have an account? ",
                        actionTitle: "Sign Up ",
                      ),
                      const Expanded(
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: TermAndPolicy())),
                      padding16,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
