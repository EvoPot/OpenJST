import 'package:flutter/material.dart';
import 'package:openjst/main/dictionary/isar/word.dart';
import 'package:provider/provider.dart';
import '../../operations.dart';


class DictionaryOperationButton extends StatelessWidget {

  final Dict dictionaryManaged;
  final Function(int) onButtonPress;
  DictionaryOperationButton({super.key, required this.dictionaryManaged, required this.onButtonPress});

  DictionaryOperations operations = DictionaryOperations();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 40,
        color: Colors.grey,
        child: Row(
          children: [
            Text("Dictionary!!"),
            IconButton(onPressed: onButtonPress(dictionaryManaged.id), icon: Icon(Icons.delete))
          ],
        )
      ),
      );
  }
}