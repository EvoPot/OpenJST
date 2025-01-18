import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:media_kit_video/media_kit_video_controls/src/controls/methods/video_state.dart';
import 'package:openjst/main/pages/videoplayer/player/controlbar/bar/bar.dart';

class ControlBar extends StatefulWidget {
  final VlcPlayerController? controller; // This is so that it can have the same values as the other widgets.
  final bool isVisible;
  final Function(int) onSliderChange;
  const ControlBar({super.key, required this.controller, required this.isVisible, required this.onSliderChange});

  @override
  State<ControlBar> createState() => _ControlBarState();
}

class _ControlBarState extends State<ControlBar> {
  Timer? _timer;
  late String positionText = '00:00:00';
  late String durationText = '00:00:00';

  String _formatDuration(Duration duration) {

    //This function transforms the duration values its given into HH:MM:SS format strings.
    //God bless stackoverflow
    String negativeSign = duration.isNegative ? '-' : '';
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
    return "$negativeSign${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();

  }

  @override
  void dispose(){
    _timer?.cancel();
  }

  void startTimer(){
    //Update the text on the control bar every 100 milliseconds
    _timer = Timer.periodic(Duration(milliseconds: 100), (Timer){
      //rebuild the widget every 100 ms
      setState(() {
        if(widget.controller != null){

          durationText = _formatDuration(widget.controller!.value.duration);
          positionText = _formatDuration(widget.controller!.value.position);

        }
        
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    if(widget.controller != null){
      return AnimatedOpacity(
        opacity: widget.isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 300),
        child: Column(
        children: [
          Expanded(child: SizedBox.expand()), // Makes sure the bar is at the bottom of the screen
          Bar(
            durationText: '${durationText}/${positionText}',

          value: widget.controller!.value,
          onSliderChange: (val) => widget.onSliderChange(val)),
      ],
    ),);

    } else return SizedBox.shrink();
    
    //return Text('${durationText}/${positionText}');
  }
}
