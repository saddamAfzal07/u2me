import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/widgets/continue_button_item.dart';
import 'package:u2me/constants/widgets/padding.dart';
import 'package:u2me/pages/settings/onclick/payment_method/successful_subsription_screen.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool premiumSelected = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.background,
          leading: Image.asset(
            "assets/images/backarrow.png",
            width: 7,
            height: 12,
          ),
          title: const Text(
            "Payment method",
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: AppColor.white,
            ),
          ),
        ),
        backgroundColor: AppColor.background,
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    padding48,
                    const Text(
                      "Payment package",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: AppColor.greyBackgroun,
                      ),
                    ),
                    padding20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              premiumSelected = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: premiumSelected == true
                                  ? AppColor.greyBackgroun
                                  : AppColor.white,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            height: 140,
                            width: 160,
                            child: Column(
                              children: [
                                padding16,
                                const Text(
                                  "\$159.99 / year",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                padding8,
                                Text(
                                  "\$19.99 / month",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: premiumSelected == true
                                        ? AppColor.white
                                        : Colors.black,
                                  ),
                                ),
                                padding8,
                                const Text(
                                  "\$5.99 / week",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: premiumSelected == true
                                            ? AppColor.secondary
                                            : AppColor.primary,
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(
                                            4,
                                          ),
                                          bottomRight: Radius.circular(
                                            4,
                                          ),
                                        ),
                                      ),
                                      height: 40,
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/images/basic.png",
                                            width: 17,
                                            height: 17,
                                          ),
                                          padding4,
                                          const Text(
                                            "Basic",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              color: AppColor.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              premiumSelected = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: premiumSelected == true
                                  ? AppColor.white
                                  : AppColor.greyBackgroun,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            height: 140,
                            width: 160,
                            child: Column(
                              children: [
                                padding16,
                                const Text(
                                  "\$159.99 / year",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                padding8,
                                Text(
                                  "\$19.99 / month",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: premiumSelected == true
                                        ? Colors.black
                                        : AppColor.white,
                                  ),
                                ),
                                padding8,
                                const Text(
                                  "\$5.99 / week",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: premiumSelected == true
                                            ? AppColor.primary
                                            : AppColor.secondary,
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(
                                            4,
                                          ),
                                          bottomRight: Radius.circular(
                                            4,
                                          ),
                                        ),
                                      ),
                                      height: 40,
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/images/premiun.png",
                                            width: 17,
                                            height: 17,
                                          ),
                                          padding4,
                                          const Text(
                                            "Premim",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              color: AppColor.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    padding24,
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        premiumSelected == true
                            ? "*Premium packagem\n will be verified"
                            : "*Basic package\nwill be verified",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 17.0,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ContinueButtonItem(
                          text: "Continue",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SuccessfulSubsription(
                                  title: premiumSelected == true
                                      ? "Your Premium package is payed!"
                                      : "Your Basic package is payed!",
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    padding24,
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
