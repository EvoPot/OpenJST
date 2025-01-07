import 'dart:convert';

import 'package:flutter/material.dart';
import 'structuredcontent.dart';

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
  late List definitions;

  @override
  void initState() {
    super.initState();
    print(widget.item);
    print(jsonEncode(widget.dictionary[widget.item]));
    print(widget.dictionary.runtimeType);
    word = widget.dictionary[widget.item][0];
    hiragana = widget.dictionary[widget.item][1];
    definitions = widget.dictionary[widget.item][5];
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        children: [Text(hiragana), Text(word)],
      ),
      Structuredcontent(structure: definitions)
    ]);
  }
}
