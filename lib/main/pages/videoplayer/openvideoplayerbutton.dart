import 'package:flutter/material.dart';
import 'player/player.dart';
import '../../appstyle/colors.dart';

class OpenVideoPlayerButton extends StatelessWidget {
  final String text;
  const OpenVideoPlayerButton({super.key, required this.text});

  static final appColors colors =
      appColors(); // i really dont think this is necessary

  void openPlayer(BuildContext context) {
    //Open a separate page for the video player
    Navigator.push(context, MaterialPageRoute(builder: (context) => Player()));
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(colors.slightlyDarkerGrey),
            foregroundColor: WidgetStateProperty.all(colors.mainAccentColor)),
        onPressed: () => openPlayer(context),
        child: Text('go to video player ehehe'));
  }
}
