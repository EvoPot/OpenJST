import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:subtitle/subtitle.dart';
import '../../../text/selectablesubtitle.dart';


class SubtitleLayer extends StatefulWidget {
  final VlcPlayerController controller;
  const SubtitleLayer({super.key, required this.controller});

  @override
  State<SubtitleLayer> createState() => SubtitleLayerState();
}

class SubtitleLayerState extends State<SubtitleLayer> {
  File? subtitles;
  late SubtitleController subControl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> updateSubtitles(String newSubs) async {
    if(await File(newSubs).exists()){
      subtitles = File(newSubs);
      subControl = SubtitleController(
        provider: SubtitleProvider.fromFile(subtitles)
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectableSubtitle(
      text: subControl.durationSearch(widget.controller.value.position).toString(), 
      textOutputFunction: (h) => print("lambda owo")
      );
  }
}