
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:subtitle/subtitle.dart';

import 'player/subtitlelayer.dart';

class PlayerProvider extends ChangeNotifier{

  SubtitleController? subControl;

  void updateSubtitles(String newSubs) async{
    if(await File(newSubs).exists()){

      subControl = SubtitleController(provider: FileSubtitle(File(newSubs)));
      await subControl?.initial();
      print(newSubs + "ninini");
      notifyListeners();

    }

  }



}