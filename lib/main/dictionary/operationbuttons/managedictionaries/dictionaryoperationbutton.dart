import 'package:flutter/material.dart';
import '../../operations.dart';


class DictionaryOperationButton extends StatelessWidget {
  final int dictionaryManaged;
  DictionaryOperationButton({super.key, required this.dictionaryManaged});

  DictionaryOperations operations = DictionaryOperations();

  void deleteDictionary() async{
    await operations.deleteDictionary(dictionaryManaged);

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