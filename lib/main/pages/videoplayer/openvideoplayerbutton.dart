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
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowedExtensions: ["mp4", "mkv", "webm", "avi", "mov", "flv"],
        type: FileType.video);

    if (result != null) {
      //Open the video player in a new page

      if (result.files.single.path != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Player(path: result.files.single.path!)));
      } else {
        print('fix this');
      }
    }
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
