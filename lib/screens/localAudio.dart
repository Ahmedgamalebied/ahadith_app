import 'package:ahadith_app/model/hadithe.dart';
import 'package:ahadith_app/utils/colors.dart';

import 'package:flutter/material.dart';

import 'package:assets_audio_player/assets_audio_player.dart';

class LocalAudio extends StatefulWidget {
  const LocalAudio(
      {super.key, required this.hadith, required this.localAudioPath});
  final Hadith hadith;
  final String localAudioPath;
  @override
  _LocalAudioState createState() => _LocalAudioState();
}

class _LocalAudioState extends State<LocalAudio>
    with SingleTickerProviderStateMixin {
  late AnimationController iconController;
  bool isAnimated = false;
  bool showPlay = true;
  bool shopPause = false;

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  @override
  void initState() {
    super.initState();
    iconController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    audioPlayer.open(Audio('assets/${widget.localAudioPath}'),
        autoStart: false, showNotification: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorApp.offWhite,
        appBar:
            AppBar(elevation: 0, backgroundColor: colorApp.offWhite, actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage('assets/svg/صلي علي محمد.jpg'),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      animateIcon();
                    },
                    child: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: iconController,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  void animateIcon() {
    setState(() {
      isAnimated = !isAnimated;
      if (isAnimated) {
        iconController.forward();
        audioPlayer.play();
      } else {
        iconController.reverse();
        audioPlayer.pause();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    iconController.dispose();
    audioPlayer.dispose();
    super.dispose();
  }
}
