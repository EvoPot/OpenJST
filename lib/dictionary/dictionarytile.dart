import 'package:flutter/material.dart';
import 'package:ruby_text/ruby_text.dart';

class Dictionarytile extends StatefulWidget {
  final List dictionary;
  final int item;
  const Dictionarytile(
      {super.key, required this.dictionary, required this.item});

  @override
  State<Dictionarytile> createState() => _DictionarytileState();
}

class _DictionarytileState extends State<Dictionarytile> {
  late String word;
  late String hiragana;

  @override
  void initState() {
    super.initState();
    word = widget.dictionary[widget.item][0];
    hiragana = widget.dictionary[widget.item][1];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [Text(hiragana), Text(word)],
        )
      ],
    );
  }
}
