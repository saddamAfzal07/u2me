import 'dart:convert';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:u2me/constants/app_url.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/userinfo.dart';
import 'package:u2me/constants/widgets/button_item.dart';
import 'package:u2me/constants/widgets/changebtn.dart';
import 'package:u2me/constants/widgets/padding.dart';

import 'package:http/http.dart' as http;
import 'package:u2me/pages/services/follow_services/follow_services.dart';
import 'package:u2me/service_provider_role/post_job.dart';

import '../../../constants/widgets/selected_btn/selected_btn_item.dart';

// ignore: must_be_immutable
class SelectionProfile extends StatefulWidget {
  String name;

  String lastName;

  String city;

  String postalCode;

  String province;

  SelectionProfile({
    Key? key,
    required this.city,
    required this.lastName,
    required this.name,
    required this.postalCode,
    required this.province,
  }) : super(key: key);

  @override
  State<SelectionProfile> createState() => _SelectionProfileState();
}

class _SelectionProfileState extends State<SelectionProfile> {
  String? role;

  bool customerSelected = false;
  bool providerSelected = false;
  bool selectedbtn = false;
  void infoRegistration() async {
    print("start");
    print(role);
    var token = await UserInfo.token;
    final response = await http.post(
      Uri.parse("${AppUrl.baseUrl}profile"),
      body: {
        'first_name': widget.name,
        'last_name': widget.lastName,
        'city': widget.city,
        'province': widget.province,
        'postalcode': widget.postalCode,
        'role': role
      },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      },
    );
    print(role);
    // var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      setState(() {
        selectedbtn = true;
      });
      print(role);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Something went wrong try again!"),
        backgroundColor: Colors.red.shade400,
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.background,
        leading: Image.asset(
          "assets/images/backarrow.png",
          width: 7,
          height: 12,
        ),
        title: Image.asset(
          "assets/images/logo.png",
          height: 30,
          width: 60,
          fit: BoxFit.contain,
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                child: Column(
                  children: [
                    padding72,
                    const Text(
                      "You Are ?",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: AppColor.white,
                      ),
                    ),
                    padding120,
                    SelectedButtonItem(
                      color: customerSelected
                          ? AppColor.greyBackground
                          : AppColor.primary,
                      onTap: () {
                        setState(
                          () {
                            providerSelected = false;
                            customerSelected = true;
                            role = "Customer";
                          },
                        );
                      },
                      text: "looking for a service",
                    ),
                    padding4,
                    SelectedButtonItem(
                      color: providerSelected
                          ? AppColor.greyBackground
                          : AppColor.primary,
                      onTap: () {
                        setState(
                          () {
                            providerSelected = true;
                            customerSelected = false;
                            role = "ServiceProvider";
                          },
                        );
                      },
                      text: "provide service",
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: selectedbtn
                            ? ChangeButtonItem(
                                text: "Continu",
                                onTap: () {
                                  if (role == "Customer") {
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const FollowServices(),
                                      ),
                                    );
                                  } else {
                                    print("Select Provider");
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PostJobScreen(),
                                      ),
                                    );
                                  }
                                },
                              )
                            : ButtonItem(
                                text: "Continu",
                                onTap: () {
                                  print("enter");
                                  if (role != null) {
                                    print("role select");
                                    infoRegistration();
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: const Text(
                                        "Role must be selected",
                                      ),
                                      backgroundColor: Colors.red.shade400,
                                      behavior: SnackBarBehavior.floating,
                                    ));
                                  }
                                },
                              ),
                      ),
                    ),
                    padding16,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
