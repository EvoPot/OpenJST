import 'package:flutter/material.dart';
import '../../appstyle/colors.dart';
import 'openvideoplayerbutton.dart';

class Videoplayerpage extends StatelessWidget {
  const Videoplayerpage({super.key});

  static final appColors colors =
      appColors(); //why do  i have to init this lmao

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.darkGrey,
      body: OpenVideoPlayerButton(text: 'Open a video file'),
    );
  }
}
