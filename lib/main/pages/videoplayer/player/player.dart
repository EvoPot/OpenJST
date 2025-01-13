import 'package:flutter/material.dart';
import 'videoplayerlayer.dart';
import 'package:file_picker/file_picker.dart';
import 'playercontrollayer.dart';
import 'pausebutton/pausebutton.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {


  late String videoPath = '';
  bool controlVisibility = false;
  bool isPlaying = true;

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

  void changeControlVisibility(){
    setState(() {
      controlVisibility = !controlVisibility;   
    });
  }

  void pausePlayVideo(){
    setState(() {
      isPlaying != isPlaying;
    });

  }

  @override
  Widget build(BuildContext context) {
    return videoPath != '' ? Stack(
      children: [
        VideoPlayerLayer(file: videoPath),
        PauseButton(onPressedFunction: pausePlayVideo, isPlaying: isPlaying),
        PlayerControlLayer(onTapFunction: changeControlVisibility)
      ],
    ) : Text('the player is waiting for a video...');
    //TODO: design a page instead of returning a text
  }
}
