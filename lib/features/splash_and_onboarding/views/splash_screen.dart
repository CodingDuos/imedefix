// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks, prefer_const_constructors, avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:idaawee/features/doctor/doctor_main_menu/views/doctor_menu_screen.dart';
import 'package:idaawee/features/doctor/home%20copy/view/user_home_screen.dart';
import 'package:idaawee/pushnotificationservice.dart';
import 'package:idaawee/utils/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import '../../../commons/common_imports/common_libs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // FirebaseMessaging.onBackgroundMessage(BackgroundHandler);
    // PushNotificationService pushNotificationService = PushNotificationService();
    // pushNotificationService.initialize(context);
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    String? userId = await Global().getUserId();
    String? userindex = await Global().getUserindex();
    if (userId == null || userId.isEmpty) {
      Navigator.pushReplacementNamed(context, AppRoutes.onBoardingScreens);
    } else {
      if (userindex == '1') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorMainMenuScreenMain(),
          ),
        );
        print(" indexsss1 ====>>>> ${userindex.toString()}");
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.userMainMenuScreen);
        print(" indexsss2 ${Global.index1.toString()}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: MyColors.appColor,
            image: DecorationImage(
                image: AssetImage(AppAssets.bgImage), fit: BoxFit.cover)),
      ),
    );
  }
}
