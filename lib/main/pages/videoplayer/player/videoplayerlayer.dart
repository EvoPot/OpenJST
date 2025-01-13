import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart'; 

class VideoPlayerLayer extends StatefulWidget {
  final String file;
  const VideoPlayerLayer({super.key, required this.file});

  @override
  State<VideoPlayerLayer> createState() => _VideoPlayerLayerState();
}

class _VideoPlayerLayerState extends State<VideoPlayerLayer> {
  late final player = Player();
  late final controller = VideoController(player);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player.open(Media('file://${widget.file}'));
  }

  @override
  void dispose(){
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Video(controller: controller);
  }
}