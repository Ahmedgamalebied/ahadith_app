import 'dart:async';

import 'package:ahadith_app/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> sildingAnimation;
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomeView()));
    });
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    sildingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset('assets/images/splash.svg'),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/islamic.svg'),
            AnimatedBuilder(
              builder: (context, _) {
                return SlideTransition(
                    position: sildingAnimation, child: TextApp.splashScreen);
              },
              animation: sildingAnimation,
            ),
          ],
        ),
      ],
    );
  }
}
