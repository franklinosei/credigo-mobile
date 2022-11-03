import 'package:credigo/constants/constants.dart';
import 'package:credigo/views/auh/send_otp/verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendOTP extends StatelessWidget {
  const SendOTP({super.key});

  List<Widget> _buildPageIndicator(int activeIndicator) {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(i == activeIndicator ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      width: isActive ? 30.0 : 7.0,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? blueColor : const Color(0xFFCBCBCB),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "CrediGo",
                  style: TextStyle(
                    fontSize: 31,
                    fontWeight: FontWeight.bold,
                    color: blueColor,
                  ),
                ),
                Row(
                  children: _buildPageIndicator(0),
                )
              ],
            ),
            const SizedBox(
              height: 27,
            ),
            const Text(
              "Enter your Phone Number",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              cursorHeight: 30,
              cursorColor: blueColor,
              decoration: textInputDecoration.copyWith(
                // prefix: Text("+233 - "),
                isDense: true,
                hintText: "0541234567",
                hintStyle: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 370,
            ),
            Container(
              height: 90,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: blueColor.withOpacity(
                    0.2,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (bool? value) {},
                    activeColor: whiteColor,
                    checkColor: whiteColor,
                    side: BorderSide.none,
                    hoverColor: whiteColor,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(
                          child: Text(
                            "By submitting my information, I agree to ",
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "all CrediGo’s Terms & Conditions ",
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "and Privacy Policy",
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.only(
          left: 20,
          bottom: 30,
        ),
        decoration: const BoxDecoration(),
        child: ElevatedButton(
          onPressed: () {
            Get.to(
              () => const VerifyOTP(),
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: blueColor,
            fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
              left: 22,
            ),
          ),
          child: const Text(
            'Next',
            style: TextStyle(
              color: whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
