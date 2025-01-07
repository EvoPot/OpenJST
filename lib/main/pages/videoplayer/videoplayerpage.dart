import 'package:flutter/material.dart';
import '../../appstyle/colors.dart';
import 'player/player.dart';

class Videoplayerpage extends StatelessWidget {
  const Videoplayerpage({super.key});

  static final appColors colors =
      appColors(); //why do  i have to init this lmao

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.darkGrey,
      body: TextButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Player())),
          child: Text('go to video player ehehe')),
    );
  }
}
