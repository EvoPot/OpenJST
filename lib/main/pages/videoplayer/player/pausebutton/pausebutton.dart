import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PauseButton extends StatefulWidget {
  final VoidCallback onPressedFunction;
  final bool isPlaying;
  final bool isVisible;
  const PauseButton({super.key, required this.onPressedFunction, required this.isPlaying, required this.isVisible});

  @override
  State<PauseButton> createState() => _PauseButtonState();
}

class _PauseButtonState extends State<PauseButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
    opacity: widget.isVisible ? 1.0 : 0.0,
    duration: Duration(milliseconds: 300),
    child: Center(
      child: IconButton(onPressed: (){
        print("i dont know man");
        widget.onPressedFunction();
      },
      icon: !widget.isPlaying ? Icon(Icons.play_arrow_rounded) : Icon(Icons.pause),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.black),
        foregroundColor: WidgetStateProperty.all(Colors.white)
        
      ),
    )
    ),);
    
  }
}