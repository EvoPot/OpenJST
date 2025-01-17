import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:openjst/subtitletest.dart';
import 'package:subtitle/subtitle.dart';
import '../../../text/selectablesubtitle.dart';


class SubtitleLayer extends StatefulWidget {
  final VlcPlayerController? controller;
  final SubtitleController? subControl;
  const SubtitleLayer({super.key, required this.controller, required this.subControl});

  @override
  State<SubtitleLayer> createState() => SubtitleLayerState();
}

class SubtitleLayerState extends State<SubtitleLayer> {
  Timer? _timer;
  File? subtitles;
  SubtitleController? subControl;
  String subtitleText = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer(){
    //Update the text on the control bar every 100 milliseconds
    _timer = Timer.periodic(Duration(milliseconds: 100), (Timer){
      setState(() {
        try{
          subtitleText = widget.subControl!.durationSearch(widget.controller!.value.duration)!.data;
        }catch (e){
          if(widget.subControl != null){

            print(widget.subControl!.provider.toString() + "ninini");

          }
          print("sorry man therres an error $e ninini");
        }
        
      });
    });

  }


  @override
  Widget build(BuildContext context) {
    if(widget.controller != null){

      return SelectableSubtitle(
        text: subtitleText,
        textOutputFunction: (h) => print("lambda owo")
        );

    } else {
      return SizedBox.shrink();
    }
  }
}