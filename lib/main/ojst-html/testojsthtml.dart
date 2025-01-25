import 'package:openjst/main/ojst-html/document.dart';
import 'package:openjst/main/ojst-html/element.dart';

import 'ojst-html.dart';

void main() {
  OJSTDocument doc = OJSTDocument()
    ..children = [
      OJSTElement('strong')
        ..hasChildren = true
        ..children = [OJSTElement('img'), LinkElement()],
      LinkElement()
    ];

  print(doc.ExtractDocument());
}
