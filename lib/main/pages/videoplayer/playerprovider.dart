
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:flutter_subtitle/flutter_subtitle.dart';

import 'player/subtitlelayer.dart';

class PlayerProvider extends ChangeNotifier{

  SubtitleController? subControl;

  void updateSubtitles(String newSubs) async{
    if(await File(newSubs).exists()){
      String subsToString = await File(newSubs).readAsString();

      subControl = SubtitleController.string(subsToString, format: SubtitleFormat.srt);
      print(newSubs + "ninini");
      notifyListeners();

    }

  }



}