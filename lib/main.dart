import 'package:ahadith_app/screens/SplashScreen.dart';
import 'package:ahadith_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: colorApp.primary));
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
