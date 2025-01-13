import 'package:flutter/material.dart';

class PauseButton extends StatefulWidget {
  final VoidCallback onPressedFunction;
  final bool isPlaying;
  const PauseButton({super.key, required this.onPressedFunction, required this.isPlaying});

  @override
  State<PauseButton> createState() => _PauseButtonState();
}

class _PauseButtonState extends State<PauseButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(onPressed: (){
        setState(() {
          widget.onPressedFunction;   
        });
      },
      icon: widget.isPlaying ? Icon(Icons.play_arrow_rounded) : Icon(Icons.pause),
    )
    );
  }
}