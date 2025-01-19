import 'package:mecab_dart/mecab_dart.dart';
import 'package:flutter/material.dart';
import 'package:openjst/main/text/selectabletext.dart';

class SelectableSubtitle extends StatelessWidget {
  final Function(String) onTapFunction;
  final List<TokenNode> mecabTokens;
  const SelectableSubtitle({super.key, required this.onTapFunction, required this.mecabTokens});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        mecabTokens.length,
        (int item){
          return SelectableTextTile(expectedValue: item, onTapFunction: onTapFunction(mecabTokens[item].surface), tileText: mecabTokens[item]);
        }
        )
      
      );
  }
}