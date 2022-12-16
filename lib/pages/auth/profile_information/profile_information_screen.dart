import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/widgets/button_item.dart';
import 'package:u2me/constants/widgets/padding.dart';
import 'package:u2me/pages/auth/profile_information/selection_role.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({Key? key}) : super(key: key);

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController province = TextEditingController();

  final _formKey = GlobalKey<FormState>();
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      padding72,
                      const Text(
                        "PROFILE INFORMATION",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: AppColor.white,
                        ),
                      ),
                      padding72,
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: firstName,
                        validator:
                            RequiredValidator(errorText: 'Name is required'),
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
                              "assets/images/user.png",
                              height: 20,
                              width: 20,
                            ),
                          ),
                          hintText: "First name",
                          hintStyle: const TextStyle(
                            color: AppColor.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      padding16,
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        validator: RequiredValidator(
                            errorText: 'Last Name is required'),
                        controller: lastName,
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
                              "assets/images/user.png",
                              height: 20,
                              width: 20,
                            ),
                          ),
                          hintText: "Last name",
                          hintStyle: const TextStyle(
                            color: AppColor.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      padding16,
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: city,
                        validator:
                            RequiredValidator(errorText: 'City is required'),
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
                              "assets/images/location.png",
                              height: 15,
                              width: 20,
                            ),
                          ),
                          hintText: "City",
                          hintStyle: const TextStyle(
                            color: AppColor.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      padding16,
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        validator: RequiredValidator(
                            errorText: 'PostalCode is required'),
                        controller: postalCode,
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
                            child: Icon(
                              Icons.vpn_key,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          hintText: "Postal Code",
                          hintStyle: const TextStyle(
                            color: AppColor.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      padding16,
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: province,
                        validator: RequiredValidator(
                            errorText: 'Province is required'),
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
                              "assets/images/location.png",
                              height: 15,
                              width: 20,
                            ),
                          ),
                          hintText: "Province",
                          hintStyle: const TextStyle(
                            color: AppColor.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      padding10,
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ButtonItem(
                            text: "Continue",
                            onTap: () {
                              final isvalid = _formKey.currentState!.validate();
                              if (isvalid) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SelectionProfile(
                                      city: city.text,
                                      lastName: lastName.text,
                                      name: firstName.text,
                                      postalCode: postalCode.text,
                                      province: province.text,
                                    ),
                                  ),
                                );
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
            ),
          ],
        ),
      ),
    );
  }
}
