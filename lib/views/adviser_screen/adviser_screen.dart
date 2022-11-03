import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class AdvisorScreen extends StatelessWidget {
  const AdvisorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Ask Robo Advisor",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "If you have any difficulty in selecting a suitable investment or loan package for your goals and budget, ask our robo advisor.",
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Let Robo advisor guide you!"),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 349,
              width: double.infinity,
              child: Image.asset("assets/customer.png"),
            ),
            const SizedBox(
              height: 120,
            ),
            ElevatedButton(
              onPressed: () {},
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
                "Start a conversation",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
