import 'package:flutter/material.dart';
import 'player/player.dart';
import '../../appstyle/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'playerprovider.dart';
import 'package:provider/provider.dart';

class OpenVideoPlayerButton extends StatelessWidget {
  final String text;
  const OpenVideoPlayerButton({super.key, required this.text});

  static final appColors colors =
      appColors(); // i really dont think this is necessary

  void openPlayer(BuildContext context) async {

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProvidingPlayer()));
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

class ProvidingPlayer extends StatelessWidget {
  const ProvidingPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => PlayerProvider(), child: Player(),);
  }
}
