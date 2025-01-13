import 'package:flutter/material.dart';
import 'videoplayerlayer.dart';
import 'package:file_picker/file_picker.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {


  late String videoPath = '';
  bool controlVisibility = false;

  @override
  void initState(){
    super.initState();
    getVideoPath();

  }

  Future<void> getVideoPath() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowedExtensions: ["mp4", "mkv", "webm", "avi", "mov", "flv"],
        type: FileType.custom);
    
    if (result != null) {
      //Open the video player in a new page
    
      if (result.files.single.path != null) {
        setState(() {

          videoPath = result.files.single.path!;
          
        });
      } else {

        //TODO : Prompt the user for files again!!
        print('fix this');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return videoPath != '' ? Stack(
      children: [
        VideoPlayerLayer(file: videoPath)
      ],
    ) : Text('the player is waiting for a video...');
    //TODO: design a page instead of returning a text
  }
}
