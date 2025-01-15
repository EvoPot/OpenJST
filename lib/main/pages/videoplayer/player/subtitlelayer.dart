import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:openjst/subtitletest.dart';
import 'package:subtitle/subtitle.dart';
import '../../../text/selectablesubtitle.dart';


class SubtitleLayer extends StatefulWidget {
  final VlcPlayerController? controller;
  const SubtitleLayer({super.key, required this.controller});

  @override
  State<SubtitleLayer> createState() => SubtitleLayerState();
}

class SubtitleLayerState extends State<SubtitleLayer> {
  Timer? _timer;
  File? subtitles;
  SubtitleController? subControl;
  String subtitleText = "snake owo";

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
          subtitleText = subControl!.durationSearch(widget.controller!.value.duration).toString();
        }catch (e){
          print("sorry man therres an error $e");
        }
        
      });
    });

  }

  Future<void> updateSubtitles(String newSubs) async {
    print("today were cooking $newSubs");
    if(await File(newSubs).exists()){
      print('they really did exist');
      setState(() {

        subtitles = File(newSubs);
        subControl = SubtitleController(
          provider: SubtitleProvider.fromFile(subtitles!)
          );
        
      });
    } else {
      print('subtitles didnt exist');
    }
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