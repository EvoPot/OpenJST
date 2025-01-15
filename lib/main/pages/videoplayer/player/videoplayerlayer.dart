import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:media_kit_video/media_kit_video_controls/src/controls/methods/video_state.dart';

class VideoPlayerLayer extends StatefulWidget {
  final VlcPlayerController? controller;
  const VideoPlayerLayer({super.key, required this.controller});

  @override
  State<VideoPlayerLayer> createState() => _VideoPlayerLayerState();
}

class _VideoPlayerLayerState extends State<VideoPlayerLayer> {

  @override
  Widget build(BuildContext context) {
    if(widget.controller != null){
      return Center(
        child: VlcPlayer(controller: widget.controller!, aspectRatio: 16 / 9),
      );
    } else{
      return CircularProgressIndicator();
    }
  }
}
