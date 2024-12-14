import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class SelectableTextTile extends StatelessWidget {
  final String tileText;
  final int expectedValue;
  final Function(int) onTapFunction;
  const SelectableTextTile(
      {super.key,
      required this.expectedValue,
      required this.onTapFunction,
      required this.tileText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTapFunction(expectedValue),
        child: StrokeText(
          text: tileText,
          textStyle: TextStyle(fontSize: 20, color: Colors.white),
          strokeColor: Colors.black,
          strokeWidth: 5,
        ));
  }
}
