import 'package:ahadith_app/screens/localAudio.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'model/hadithe.dart';
import 'networking/networking_page.dart';
import 'utils/colors.dart';

class HomeHadith extends StatefulWidget {
  const HomeHadith({super.key, required this.hadith, this.loadPath});
  final String? loadPath;
  final Hadith hadith;
  @override
  State<StatefulWidget> createState() {
    return HomeHadithState();
  }
}

class HomeHadithState extends State<HomeHadith> {
  bool isPlayer1Turn = true;
  bool bol = true;
  bool clickedCentreFAB =
      false; //boolean used to handle container animation which expands from the FAB
  int selectedIndex =
      0; //to handle which item is currently selected in the bottom app bar
  String text = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text = widget.hadith.textHadith!;
  }

  //call this method on click of each bottom app bar item to update the screen
  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText + ' \n';
    });
  }

  Widget getWedjet(bool bol) {
    if (bol) {
      return NetworkingPage(
        hadith: widget.hadith,
        data: text,
      );
    } else {
      return LocalAudio(
          hadith: widget.hadith,
          localAudioPath: 'audio/${widget.hadith.audioHadith}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            getWedjet(bol),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black38,
          onPressed: () {
            setState(() {
              clickedCentreFAB =
                  !clickedCentreFAB; //to update the animated container
            });
            //          Share text
            Share.share(text, subject: widget.hadith.nameHadith);
          },
          tooltip: "Centre FAB",
          elevation: 4.0,
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: Icon(Icons.share),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          //color of the BottomAppBar
          color: colorApp.green1,
          child: Container(
            height: 60,
            margin: EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  //update the bottom app bar view each time an item is clicked
                  onPressed: () {
                    bol = true;
                    updateTabSelection(0, widget.hadith.textHadith!);
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.book,
                    //darken the icon if it is selected or else give it a different color
                    color: selectedIndex == 0 ? colorApp.yellow1 : Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    bol = true;
                    updateTabSelection(1, widget.hadith.explanationHadith!);
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.library_books,
                    color: selectedIndex == 1 ? colorApp.yellow1 : Colors.white,
                  ),
                ),
                //to leave space in between the bottom app bar items and below the FAB
                const SizedBox(
                  width: 50.0,
                ),
                IconButton(
                  onPressed: () {
                    bol = true;
                    updateTabSelection(2, widget.hadith.translateNarrator!);
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.collections_bookmark,
                    color: selectedIndex == 2 ? colorApp.yellow1 : Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    if (isPlayer1Turn) {
                      if (selectedIndex == 3) {
                        final player = AudioPlayer();
                        await player.stop();
                        player.dispose();
                        updateTabSelection(0, widget.hadith.textHadith!);
                      } else if (isPlayer1Turn) {
                        final player = AudioPlayer();
                        player.onPlayerComplete.listen((event) {
                          player.dispose();
                          updateTabSelection(0, widget.hadith.textHadith!);
                        });
                        await player.setSource(AssetSource(
                          'audio/${widget.loadPath}',
                        ));
                        updateTabSelection(3, widget.loadPath!);
                        await player.resume();
                      }
                      setState(() {
                        isPlayer1Turn = false;
                      });
                    } else {
                      final player = AudioPlayer();
                      player.stop();
                      setState(() {
                        isPlayer1Turn = true;
                      });
                    }
                  },
                  icon: Icon(
                    isPlayer1Turn ? Icons.play_arrow : Icons.pause,
                    color: selectedIndex == 3 ? colorApp.yellow1 : Colors.white,
                    size: 28,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
