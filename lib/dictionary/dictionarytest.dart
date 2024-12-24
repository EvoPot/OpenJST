import 'package:flutter/material.dart';
import 'package:openjst/dictionary/dictionarytile.dart';
import 'dictionary.dart';
import 'adddictionary.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          AddDictionaryButton(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: Dictionary.length,
              itemBuilder: (context, index) {
                return Dictionarytile(dictionary: Dictionary, item: index);
              },
            ),
          ),
        ],
      )),
    );
  }
}
