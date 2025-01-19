import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:mecab_dart/mecab_dart.dart';

class SelectableTextTile extends StatelessWidget {
  final TokenNode tileText;
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
          text: tileText.surface,
          textStyle: const TextStyle(fontSize: 20, color: Colors.white),
          strokeColor: Colors.black,
          strokeWidth: 5,
        ));
  }
}
