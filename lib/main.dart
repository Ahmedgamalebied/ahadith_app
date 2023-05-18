import 'package:ahadith_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'views/ahadithView.dart';
import 'views/widget/splash_view_body.dart';

void main() {
  runApp(const AhadithApp());
}

class AhadithApp extends StatelessWidget {
  const AhadithApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ConstColorApp.green1,
    ));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AhadithView(),
    );
  }
}
