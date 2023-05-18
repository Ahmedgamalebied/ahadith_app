import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../db/mydata.dart';
import '../model/hadithe_model.dart';
import '../utils/Text.dart';
import '../utils/colors.dart';
import 'HomeHadith.dart';

class AhadithView extends StatelessWidget {
  const AhadithView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AhadithViewBody(),
    );
  }
}

class AhadithViewBody extends StatelessWidget {
  const AhadithViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
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
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("assets/images/logo.svg"),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_forward)),
                      ],
                    ),
                  ),
                  const Column(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextApp.topHomeScreen,
                      TextApp.headerHomeScreen,
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/images/background.svg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              FutureBuilder(

                  //we call the method, which is in the folder db file database.dart
                  future: Mydata.getAlldata(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          Hadith item = snapshot.data[index];
                          //delete one register for id
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomeHadith(
                                          hadith: item,
                                        )));
                              },
                              child: ayah(item.key, item.nameHadith));
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 50,
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ],
          ),
        ),
      ],
    );
  }
}

Widget ayah(String key, name) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Image.asset("assets/img.png"),
      SvgPicture.asset("assets/images/grey.svg"),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            key,
            style: const TextStyle(fontSize: 16, color: ConstColorApp.yellow1),
          ),
          Text(
            name,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ConstColorApp.yellow1),
            textScaleFactor: .5,
          ),
        ],
      )
    ],
  );
}
