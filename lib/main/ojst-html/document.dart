import 'package:flutter/material.dart';

import 'element.dart';

class OJSTDocument {
  List<OJSTElement> children = [];

  String ExtractDocument() {
    String output = '';

    for (OJSTElement child in children) {
      output += child.convertToString();
    }

    return output;
  }
}
