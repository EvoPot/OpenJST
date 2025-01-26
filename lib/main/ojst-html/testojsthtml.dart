import 'package:openjst/main/ojst-html/document.dart';
import 'package:openjst/main/ojst-html/element.dart';
import 'package:openjst/main/ojst-html/styleattribute.dart';

import 'ojst-html.dart';

void main() {
  StyleAttribute style = StyleAttribute()..textAlign = 'left';
  OJSTDocument doc = OJSTDocument()
    ..children = [
      LinkElement(href: 'https://www.youtube.com', lang: 'ja')..style = style
      
    ];

  print(doc.ExtractDocument());
}
