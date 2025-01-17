import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../subtitlelayer.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../playerprovider.dart';



class ChangeVideoSubtitle extends StatelessWidget {
  final PlayerProvider provider;
  ChangeVideoSubtitle({super.key, required this.provider});

  void ChangeSubtitlesByFile(BuildContext context) async{

    final result = await FilePicker.platform.pickFiles(); //Prompt the user for a directory of the new subtitles

    if(result != null){

      provider.updateSubtitles(result.files.single.path!); //Update the provider to include the new subtitles

    }

    Navigator.pop(context); //Close the video options menu


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