import 'package:credigo/views/auh/send_otp/send_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        actions: [
          _currentPage == 2
              ? Container()
              : TextButton(
                  onPressed: () {
                    setState(() {
                      _currentPage = _numPages - 1;
                    });
                    _pageController.animateToPage(
                      _numPages - 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: skipColor,
                      fontSize: 17,
                    ),
                  ),
                ),
        ],
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: const BoxDecoration(
            color: whiteColor,
          ),
          child: PageView(
            physics: const ClampingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 117.0,
                  left: 30,
                  right: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Center(
                      child: Image(
                        image: AssetImage(
                          'assets/images/onboard0.png',
                        ),
                        height: 348.0,
                        width: 348.0,
                      ),
                    ),
                    SizedBox(height: 31.0),
                    Center(
                      child: Text(
                        'Check your credit score',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: Text(
                        'Check your latest credit score and credit report for free',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 117.0,
                  left: 30,
                  right: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Center(
                      child: Image(
                        image: AssetImage(
                          'assets/images/onboard1.png',
                        ),
                        height: 348.0,
                        width: 348.0,
                      ),
                    ),
                    SizedBox(height: 31.0),
                    Center(
                      child: Text(
                        'Get finance insights',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: Text(
                        'Select from offers that are  customized for you',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 117.0,
                  left: 30,
                  right: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Center(
                      child: Image(
                        image: AssetImage(
                          'assets/images/onboard2.png',
                        ),
                        height: 348.0,
                        width: 348.0,
                      ),
                    ),
                    SizedBox(height: 31.0),
                    Center(
                      child: Text(
                        'Build your credit',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: Text(
                        'Build credit while saving money. Each on-time monthly payment builds credit history and adds to your savings.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                bottom: 10,
              ),
              height: 150.0,
              width: double.infinity,
              color: whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => const SendOTP());
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: blueColor,
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.9, 70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(
                        left: 22,
                      ),
                    ),
                    child: const Text(
                      "Let's go",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                bottom: 10,
              ),
              height: 150.0,
              width: double.infinity,
              color: whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      
                      _pageController.animateToPage(
                        _numPages - 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: blueColor,
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.9, 70),
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
                ],
              ),
            ),
    );
  }
}
