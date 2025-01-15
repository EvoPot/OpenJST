import 'package:flutter/material.dart';
import '../../../subtitlelayer.dart';
import 'package:file_picker/file_picker.dart';


class ChangeVideoSubtitle extends StatelessWidget {
  ChangeVideoSubtitle({super.key});


  GlobalKey<SubtitleLayerState> subtitleKey = GlobalKey<SubtitleLayerState>(); // Global key to control the subtitles widget

  void ChangeSubtitlesByFile(BuildContext context) async{

    final result = await FilePicker.platform.pickFiles();

    if(result != null){

      subtitleKey.currentState?.updateSubtitles(result.files.single.path!);

    }

    Navigator.pop(context);






  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ChangeSubtitlesByFile(context),
      child: Container(
        height: 70,
        child: Text("Change video subtitle..." , style: TextStyle(color: Colors.white),),
      ),
    );

  }
}