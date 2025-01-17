/*
The button that shows the video options menu
 */

import 'package:flutter/material.dart';
import 'changevideosubtitle.dart';
import '../../../../../../appstyle/colors.dart';
import 'package:provider/provider.dart';
import '../../../../playerprovider.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({super.key});

  

  void showVideoOptions(BuildContext context){

    final playerProvider = Provider.of<PlayerProvider>(context,listen: false);

    List<Widget> optionsList = 
    [
      ChangeVideoSubtitle(provider: playerProvider,),
    ];
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: appColors().slightlyDarkerGrey,
          title: Text("Video Options", style: TextStyle(color: Colors.white),),
          content: Scaffold(
            backgroundColor: appColors().darkGrey,
            body: ListView(
              children: optionsList
            ),
          ),
          
        
        );
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () => showVideoOptions(context), icon: Icon(Icons.settings));
  }
}
