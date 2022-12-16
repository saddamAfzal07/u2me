import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/widgets/padding.dart';

class ServiceProviderDetails extends StatefulWidget {
  const ServiceProviderDetails({Key? key}) : super(key: key);

  @override
  State<ServiceProviderDetails> createState() => _ServiceProviderDetailsState();
}

class _ServiceProviderDetailsState extends State<ServiceProviderDetails> {
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
          "Ugradnja parketa",
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: AppColor.white,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 120,
              child: Image.asset(
                "assets/images/image.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    padding24,
                    TextFormField(
                      controller: firstName,
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
                          padding: const EdgeInsets.only(right: 15),
                          child: Image.asset(
                            "assets/images/question.png",
                            height: 20,
                            width: 20,
                          ),
                        ),
                        hintText: "Ugradnja parketa",
                        hintStyle: const TextStyle(
                          color: AppColor.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    padding16,
                    TextFormField(
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
                          padding: const EdgeInsets.only(right: 15),
                          child: Image.asset(
                            "assets/images/document.png",
                            height: 20,
                            width: 20,
                          ),
                        ),
                        hintText: "Zelim da mi se zamene plafonjerke u stanu",
                        hintStyle: const TextStyle(
                          color: AppColor.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    padding16,
                    TextFormField(
                      controller: city,
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
                          padding: const EdgeInsets.only(right: 15),
                          child: Image.asset(
                            "assets/images/category.png",
                            height: 15,
                            width: 20,
                          ),
                        ),
                        hintText: "Home Repairs",
                        hintStyle: const TextStyle(
                          color: AppColor.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    padding16,
                    TextFormField(
                      controller: city,
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
                          padding: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: Image.asset(
                            "assets/images/dollar.png",
                            height: 15,
                            width: 20,
                          ),
                        ),
                        hintText: "Budget \$ 50-85",
                        hintStyle: const TextStyle(
                          color: AppColor.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    padding16,
                    TextFormField(
                      controller: city,
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
                        hintText: "Uciteljska 11, 11000 Beograd",
                        hintStyle: const TextStyle(
                          color: AppColor.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    padding16,
                    TextFormField(
                      controller: city,
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
                            "assets/images/dollar.png",
                            height: 15,
                            width: 20,
                          ),
                        ),
                        hintText: "Enter your price?",
                        hintStyle: const TextStyle(
                          color: AppColor.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: city,
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
                        hintText: "Add Message",
                        hintStyle: const TextStyle(
                          color: AppColor.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
