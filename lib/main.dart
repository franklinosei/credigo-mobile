import 'dart:io';

import 'package:credigo/views/onboarding/onboading.dart';
import 'package:credigo/views/splashscreen/spalshscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'firebase_options.dart';
import 'views/auh/send_otp/send_otp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  await openHiveBox('settings');

  runApp(const MyApp());
}

Future<void> openHiveBox(String boxName, {bool limit = false}) async {
  final box = await Hive.openBox(boxName).onError((error, stackTrace) async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final String dirPath = dir.path;
    File dbFile = File('$dirPath/$boxName.hive');
    File lockFile = File('$dirPath/$boxName.lock');

    await dbFile.delete();
    await lockFile.delete();
    await Hive.openBox(boxName);
    throw 'Failed to open $boxName Box\nError: $error';
  });
  // clear box if it grows large
  if (limit && box.length > 500) {
    box.clear();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Widget pageToRender = const SplashScreen();

  Future checkFirstScreen() async {
    Box settings = Hive.box('settings');

    bool seen = settings.get("seen") ?? false;

    if (seen) {
      setState(() {
        pageToRender = const SendOTP();
      });
    } else {
      setState(() {
        pageToRender = const OnboardingScreen();
      });
    }

    if (seen == false) {
      await settings.put('seen', true);
    }
  }

  @override
  void initState() {
    super.initState();

    checkFirstScreen();

    // // Verify Token here
    // AuthService.verifyToken().then((valid) {
    //   if (valid) {
    //     Get.offAll(() => const MainScreen());
    //   } else if (!valid) {
    //     //
    //     Get.offAll(() => const LoginScreen());
    //     // Get.offAll(() => UserAbout());

    //     // Get.offAll(() => AlomostTherePage());

    //     // Get.offAll(() => MainScreen());

    //     // setState(() {
    //     // pageToRender = const LoginScreen();
    //     // pageToRender = UserAbout();
    //     // });
    //   }
    // });

    // isConnected().then((value) {
    //   if (!value) {
    //     Get.offAll(
    //       () => const NoInternet(),
    //     );
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Credigo',
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // Change back to pageToRender
      home: pageToRender,
    );
  }
}
