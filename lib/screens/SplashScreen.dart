import 'dart:async';

import 'package:ahadith_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'HomePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomePage())); //TODO ADD HOME SCREEN
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorApp.primary,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            "assets/svg/splash.svg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/svg/Group 1 (1).svg",
                  fit: BoxFit.fitHeight,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
