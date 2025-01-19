import 'package:flutter/material.dart';
import '../../../dictionary/operationbuttons/adddictionary.dart'; //damn nice import bro!!
import '../../../dictionary/operationbuttons/managedictionaries/managedictionaries.dart';

class DictionaryPage extends StatelessWidget {
  const DictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Dictionary Settings',
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        AddDictionaryButton(text: 'Add a dictionary...'),
        ManageDictionariesButton(text: 'Manage dictionaries...',)

      ],
    );
  }
}
