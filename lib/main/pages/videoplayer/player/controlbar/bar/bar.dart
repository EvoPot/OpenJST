/*
Uh, whats the difference between the widget in controlbar.dart and bar.dart?
Well, it is quite simple actually:
ControlBar is the widget that the Player widget is calling. It's an abstraction of the entire thing.
The Bar is what the ControlBar widget is calling. It's more of a thing to represent the actual "bar"
Well I don't know if this will help anyone but there you go buddy
 */


import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class Bar extends StatelessWidget {
  final String durationText;
  final VlcPlayerValue value;
  final Function(int) onSliderChange;
  const Bar({super.key, required this.durationText, required this.value, required this.onSliderChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Material(
                color: Colors.black,
                
                child: Center(
                  child: Text(
                    durationText,
                    style: TextStyle(color: Colors.white,fontSize: 10),
                    ),
                ),
              )
              ),
            Expanded(
              flex:10,
              child: Material(
                color: Colors.black,
                child: Container(
                  color: Colors.black,
                  height: 6,
                  child: Slider(
                    min: 0.0,
                    max: value.duration.inMilliseconds.toDouble(),
                    value: value.position.inMilliseconds.toDouble(),
                    onChanged: (double newValue){
                      onSliderChange(newValue.toInt());
                      
                    }
                    ),
                  ),
              )
                )
          ],
        ),
      ),
    );
  }
}