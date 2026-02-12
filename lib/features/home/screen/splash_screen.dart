import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tasky/features/home/screen/Onboarding_scrren.dart';
import 'package:tasky/features/home/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBordingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5F33E1),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInLeft(child: Image.asset("assets/images/task.png")),
            BounceInDown(child: Image.asset("assets/images/y.png")),
          ],
        ),
      ),
    );
  }
}
