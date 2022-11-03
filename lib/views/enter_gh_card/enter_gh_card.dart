import 'package:credigo/constants/constants.dart';
import 'package:credigo/views/homescreen/homescreen_with_score.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class GhCardDetailsScreen extends StatelessWidget {
  const GhCardDetailsScreen({super.key});

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
            const SizedBox(
              height: 27,
            ),
            const Text(
              "Enter your Ghana card Number",
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
                hintText: "GHA - 726772232 - 9",
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
                            "I hereby authorise CrediGo to receive my credit information  from the credit bureau.",
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
            pushNewScreen(
              context,
              screen: HomeScreenWithScore(),
              withNavBar: true,
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
            'Continue',
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
