import 'package:flutter/material.dart';

import 'views/widget/splash_view_body.dart';

void main() {
  runApp(const AhadithApp());
}

class AhadithApp extends StatelessWidget {
  const AhadithApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashViewBody(),
    );
  }
}
