import 'package:ahadith_app/screens/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "الاربعون النوويه (prod by Ahmed Sherif)",
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
