import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class VideoPlayerLayer extends StatefulWidget {
  final String file;
  const VideoPlayerLayer({super.key, required this.file});

  @override
  State<VideoPlayerLayer> createState() => _VideoPlayerLayerState();
}

class _VideoPlayerLayerState extends State<VideoPlayerLayer> {
  late VlcPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    try {
      _videoPlayerController = VlcPlayerController.file(File(widget.file));
    } catch (e) {
      print("uh error $e");
    }
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.stopRendererScanning();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: VlcPlayer(controller: _videoPlayerController, aspectRatio: 16 / 9),
    );
  }
}
