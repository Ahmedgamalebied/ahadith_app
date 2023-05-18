import 'package:ahadith_app/utils/colors.dart';
import 'package:ahadith_app/utils/text.dart';
import 'package:ahadith_app/views/widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../ahadith_Screen.dart';
import '../audio_ahadith_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        children: [
          SvgPicture.asset(
            "assets/images/background.svg",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              SvgPicture.asset("assets/images/logo.svg"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const Center(child: TextApp.topHomeScreen),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AhadithScreen()));
                      },
                      child: myCard(
                          ConstColorApp.green1,
                          ConstColorApp.green2,
                          TextApp.bookOneScreen,
                          "assets/quran.png",
                          'assets/images/one.svg')),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AudioAhadithScreen()));
                      },
                      child: myCard(
                          ConstColorApp.yellow1,
                          ConstColorApp.red2,
                          TextApp.bookTwoScreen,
                          "assets/play.png",
                          'assets/images/twoo.svg')),
                  myCard(
                      ConstColorApp.red1,
                      ConstColorApp.red2,
                      TextApp.bookThreeScreen,
                      "assets/save-instagram.png",
                      "assets/images/three.svg")
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
