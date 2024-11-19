import 'package:aas/Constants/const%20images.dart';
import 'package:aas/Screens/Authscreen/login_screen.dart';
import 'package:aas/Screens/BottomNavScreens/bottomnav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMainScreen();
  }

  Future<void> _navigateToMainScreen() async {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      await Future.delayed(Duration(seconds: 3));
      Get.to(() => LoginScreen(),
          transition: Transition.upToDown, duration: Duration(seconds: 2));
    } else {
      await Future.delayed(Duration(seconds: 3));
      Get.to(() => LoginScreen(),
          transition: Transition.upToDown, duration: Duration(seconds: 2));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(splash),
              fit: BoxFit.cover, // Fit the image to the screen
            ),
          ),
        ),
      ),
    );
  }
}
