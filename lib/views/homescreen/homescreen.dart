import 'package:credigo/constants/constants.dart';
import 'package:credigo/views/enter_gh_card/enter_gh_card.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final CircularSliderAppearance appearance01 =
      const CircularSliderAppearance();

  /// Example 02

  final CircularSliderAppearance appearance02 = CircularSliderAppearance(
    customWidths: CustomSliderWidths(trackWidth: 10, progressBarWidth: 10),
    customColors: CustomSliderColors(
        trackColor: const Color(0xFFF2F6FC),
        progressBarColor: grayColor,
        hideShadow: true),
    infoProperties: InfoProperties(
        topLabelStyle: const TextStyle(
          color: Colors.orangeAccent,
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
        mainLabelStyle: const TextStyle(
            color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.w100),
        modifier: (double value) {
          final budget = (value * 1000).toInt();
          return '\$ $budget';
        }),
    startAngle: 180,
    angleRange: 270,
    size: 200.0,
    animationEnabled: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
          ),
          children: [
            const SizedBox(
              height: 54,
            ),
            const Center(
              child: Text(
                "Hi Akua",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Center(
              child: Text(
                "Your credit score is",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: SleekCircularSlider(
                onChangeStart: (double value) {},
                onChangeEnd: (double value) {},
                innerWidget: (double value) {
                  return Center(
                    child: Image.asset(
                      "assets/_.png",
                    ),
                  );
                },
                appearance: appearance02,
                min: 0,
                max: 900,
                initialValue: 700,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: Text(
                "Link your Ghana Card to get started",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                "Finish verifying your identity to get your credit score at no cost",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                pushNewScreen(
                  context,
                  screen: const GhCardDetailsScreen(),
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
                "Get my credit score",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.all(
                20,
              ),
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/customer.png",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Get GHS10!",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Refer someone to open an CrediGo Account and you’ll get GHS 10. ",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const Text(
                    "Share the link below to start earning rewards!",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: blueLight,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("https://credigo/refer/166145678"),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Copy",
                            style: TextStyle(
                              color: blueColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: blueColor,
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.9, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(
                        left: 22,
                      ),
                    ),
                    child: const Text(
                      "Share link",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Total Friends referred",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "0",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Pending referral payout",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "GHS 0.00",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Referral payout to date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "GHS 0.00",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: whiteColor,
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.9, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: blueColor,
                          width: 2,
                        ),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(
                        left: 22,
                      ),
                    ),
                    child: const Text(
                      "Update payout method",
                      style: TextStyle(
                        color: blueColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
