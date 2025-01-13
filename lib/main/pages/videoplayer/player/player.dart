import 'dart:io';

import 'package:flutter/material.dart';
import 'videoplayerlayer.dart';
import 'package:file_picker/file_picker.dart';
import 'playercontrollayer.dart';
import 'pausebutton/pausebutton.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {


  late String videoPath = '';
  bool controlVisibility = false;
  bool isPlaying = true;
  late VlcPlayerController _videoPlayerController;

  @override
  void initState(){
    super.initState();
    getVideoPath();

  }

   @override
  void dispose() {
    super.dispose();
    _videoPlayerController.stopRendererScanning();
    _videoPlayerController.dispose();
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
          _videoPlayerController = VlcPlayerController.file(File(videoPath));
          
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
      if(isPlaying){
        _videoPlayerController.play();
      }else{
        _videoPlayerController.pause();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return videoPath != '' ? Stack(
      children: [
        VideoPlayerLayer(controller: _videoPlayerController,),
        PauseButton(onPressedFunction: pausePlayVideo, isPlaying: isPlaying),
        PlayerControlLayer(onTapFunction: changeControlVisibility)
      ],
    ) : Text('the player is waiting for a video...');
    //TODO: design a page instead of returning a text
  }
}
