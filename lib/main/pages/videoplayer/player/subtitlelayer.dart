import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:openjst/subtitletest.dart';
import 'package:flutter_subtitle/flutter_subtitle.dart';
import '../../../text/selectablesubtitle.dart';
import '../../../dictionary/operations.dart';
import '../../../dictionary/resultlist.dart';
import 'package:mecab_dart/mecab_dart.dart';


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
  Mecab tagger = new Mecab();

  @override
  void initState() {

    
    // TODO: implement initState
    super.initState();
    startTimer();
    initializeMecab();
  }

  @override
  void dispose(){
    
    super.dispose();
    _timer?.cancel();
  }

  void initializeMecab() async{
    await tagger.init("assets/mecab-dictionary/ipadic", false);
  }

  void startTimer(){
    //Update the subtitles every 100 milliseconds
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

  Future<void> ShowMeanings(String search, BuildContext context) async {
    print("searching for $search");

    List<List<dynamic>> searchResult = await DictionaryOperations().searchWords(search);

    if(searchResult.isEmpty){
      showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('No results found'),
          content: Text('No results have been found for $search. Try installing a dictionary, or searching for a new word.')

        );
      }
      );

    } else {

      showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('search results for $search'),
          content: Container(height:500, child: ResultList(input: searchResult)),

        );
      }
      );

    }

    

  }


  @override
  Widget build(BuildContext context) {
    if(widget.controller != null){

      return Column(
        children: [
          Expanded(child: SizedBox.expand(),flex: 3,),
          Expanded(
            child: SelectableSubtitle(
              onTapFunction: (h) async{
                await ShowMeanings(h, context);
              },
              mecabTokens: tagger.parse(subtitleText)
              ),
          ),
        ],
      );

    } else {
      return SizedBox.shrink();
    }
  }
}