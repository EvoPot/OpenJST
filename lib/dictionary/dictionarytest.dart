import 'package:flutter/material.dart';
import 'package:openjst/dictionary/dictionarytile.dart';
import 'dictionary.dart';

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
          body: ListView.builder(
        itemCount: Dictionary.length,
        itemBuilder: (context, index) {
          return Container(
              height: 300,
              child: Dictionarytile(dictionary: Dictionary, item: index));
        },
      )),
    );
  }
}
