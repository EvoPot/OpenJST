import 'package:flutter/material.dart';
import 'player/player.dart';
import '../../appstyle/colors.dart';
import 'package:file_picker/file_picker.dart';

class OpenVideoPlayerButton extends StatelessWidget {
  final String text;
  const OpenVideoPlayerButton({super.key, required this.text});

  static final appColors colors =
      appColors(); // i really dont think this is necessary

  void openPlayer(BuildContext context) async {

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Player()));
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(colors.slightlyDarkerGrey),
            foregroundColor: WidgetStateProperty.all(colors.mainAccentColor)),
        onPressed: () => openPlayer(context),
        child: Text(text));
  }
}
