import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:openjst/subtitletest.dart';
import 'package:flutter_subtitle/flutter_subtitle.dart';
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
          subtitleText = widget.subControl!.textFromMilliseconds(widget.controller!.value.position.inMilliseconds, widget.subControl!.subtitles);
          print('subtext $subtitleText');
        }catch (e){
          print("sorry man therres an error $e ninini");
        }
        
      });
    });

  }


  @override
  Widget build(BuildContext context) {
    if(widget.controller != null){

      return Column(
        children: [
          Expanded(child: SizedBox.expand(),flex: 3,),
          Expanded(
            child: SelectableSubtitle(
              text: subtitleText,
              textOutputFunction: (h) => print("lambda owo")
              ),
          ),
        ],
      );

    } else {
      return SizedBox.shrink();
    }
  }
}