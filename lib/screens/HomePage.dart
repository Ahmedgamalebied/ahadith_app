import 'package:ahadith_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/Strings.dart';
import 'AhadithScreen.dart';
import 'AudioAhadith.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SvgPicture.asset(
          "assets/svg/background.svg",
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            SvgPicture.asset("assets/svg/logo.svg"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextApp.topHomeScreen,
                  TextApp.headerHomeScreen,
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => AhadithScreen()));
                      },
                      child: myCard(
                          colorApp.green1,
                          colorApp.green2,
                          TextApp.bookOneScreen,
                          "assets/quran.png",
                          'assets/svg/one.svg')),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => AudioAhadithScreen()));
                      },
                      child: myCard(
                          colorApp.yellow1,
                          colorApp.red2,
                          TextApp.bookTwoScreen,
                          "assets/play.png",
                          'assets/svg/twoo.svg')),
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}

Widget myCard(
  Color color1,
  color2,
  Text text,
  path1,
  path2,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 48),
    child: Container(
        height: 117,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, offset: Offset(10, 10), blurRadius: 40)
            ],
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                colors: [
                  color1,
                  color2,
                ],
                begin: AlignmentDirectional.topEnd,
                end: AlignmentDirectional.bottomStart)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Image.asset(path1), text, SvgPicture.asset(path2)],
        )),
  );
}
