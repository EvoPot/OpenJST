import 'package:flutter/material.dart';

class ProgressProvider extends ChangeNotifier {
  int max = 1;
  int progress = 1;
  String message = "";

  void changeMessage(String input) {
    message = input;
    notifyListeners();
  }

  void changeProgress() {
    progress++;
    notifyListeners();
  }

  void changeMax(int input) {
    max = input;
    notifyListeners();
  }

  void reset() {
    max = 1;
    progress = 1;
    message = "";
  }
}
