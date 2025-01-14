import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:subtitle/subtitle.dart';


class SubtitleLayer extends StatefulWidget {
  final String subsDir;
  final VlcPlayerController controller;
  const SubtitleLayer({super.key, required this.controller, required this.subsDir});

  @override
  State<SubtitleLayer> createState() => _SubtitleLayerState();
}

class _SubtitleLayerState extends State<SubtitleLayer> {
  dynamic subtitles;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subtitles = widget.controller.value.duration;
    print('micheal $widget.subsDir');
    

  }

  @override
  Widget build(BuildContext context) {
    print('mike $subtitles');
    return const Placeholder();
  }
}