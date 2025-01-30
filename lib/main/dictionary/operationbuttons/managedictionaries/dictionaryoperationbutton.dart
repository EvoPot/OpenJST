import 'package:flutter/material.dart';
import 'package:openjst/main/dictionary/isar/word.dart';
import '../../operations.dart';
import 'managedictionariesprovider.dart';


class DictionaryOperationButton extends StatelessWidget {
  final Dict dictionaryManaged;
  DictionaryOperationButton({super.key, required this.dictionaryManaged});

  DictionaryOperations operations = DictionaryOperations();

  void deleteDictionary() async{
    await operations.deleteDictionary(dictionaryManaged.id);
    await DictionaryProvider().updateButtonList;


  }

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
            IconButton(onPressed: deleteDictionary, icon: Icon(Icons.delete))
          ],
        )
      ),
      );
  }
}