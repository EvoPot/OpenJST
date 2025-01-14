import 'dart:io';

import 'package:flutter/material.dart';
import 'package:openjst/main/ojst-ffmpeg/functions/extractvideosubs.dart';
import 'videoplayerlayer.dart';
import 'package:file_picker/file_picker.dart';
import 'playercontrollayer.dart';
import 'pausebutton/pausebutton.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'controlbar/controlbar.dart';
import 'subtitlelayer.dart';
import '../../../ojst-ffmpeg/ojst-ffmpeg.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {


  late String videoPath = '';
  String playingSubsDir = '';
  bool controlVisibility = false;
  bool isPlaying = true;
  VlcPlayerController? _videoPlayerController;

  @override
  void initState(){
    super.initState();
    getVideoPath(); //Get the video path when the player starts

  }

   @override
  void dispose() {
    super.dispose();
    _videoPlayerController?.stopRendererScanning();
    _videoPlayerController?.dispose();
  }


  Future<void> getVideoPath() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowedExtensions: ["mp4", "mkv", "webm", "avi", "mov", "flv"],
        type: FileType.custom);
    
    if (result != null && result.files.isNotEmpty) {
      //Open the video player in a new page
      final filePath = result.files.single.path;
    
      if (filePath != null) {
        String subsDir = await ExtractVideoSubs(filePath);
        setState(() {
          playingSubsDir = subsDir;
          videoPath = filePath; //If it ain't broken dont fix it buddyy
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
      controlVisibility = !controlVisibility;   //self explanatory ig
    });
  }

  void pausePlayVideo(){
    if(controlVisibility){

      setState(() {
        isPlaying = !isPlaying;
        if(isPlaying){
          _videoPlayerController!.play();
        }else{
          _videoPlayerController!.pause();
        }
    });

    }
    print("something");

  }

  @override
  Widget build(BuildContext context) {
    return videoPath.isNotEmpty && _videoPlayerController != null ? Stack(
      children: [
        VideoPlayerLayer(controller: _videoPlayerController!,),
        SubtitleLayer(controller: _videoPlayerController!, subsDir: playingSubsDir,),
        PlayerControlLayer(onTapFunction: changeControlVisibility),
        PauseButton(onPressedFunction: pausePlayVideo, isPlaying: isPlaying, isVisible: controlVisibility,),
        ControlBar(
          controller: _videoPlayerController!,
          isVisible: controlVisibility,
          onSliderChange: (p0) {
            print('p0 $p0');
              _videoPlayerController!.seekTo(Duration(milliseconds: p0));

          } ,),
        if(!controlVisibility)PlayerControlLayer(onTapFunction: changeControlVisibility)

      ],
    ) : Text('the player is waiting for a video...');
    //TODO: design a page instead of returning a text
  }
}
