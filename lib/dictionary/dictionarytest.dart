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
      home: Scaffold(body: Dictionarytile(dictionary: Dictionary, item: 0)),
    );
  }
}
