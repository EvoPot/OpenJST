import 'package:flutter/material.dart';

class AddDictionaryButton extends StatelessWidget {
  const AddDictionaryButton({super.key});

  void uselessFunc() {
    print("h"); //placeholder
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: uselessFunc,
      child: Text('Add a dictionary...'),
    );
  }
}
