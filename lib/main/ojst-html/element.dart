import 'styleattribute.dart';

class OJSTElement {
  final String tag;
  List<OJSTElement> children = [];
  bool hasChildren = false;
  StyleAttribute? style;

  OJSTElement(this.tag);

  String convertToString() {
    if (hasChildren) {
      String inside = convertChildrenToString();
      return "<$tag>$inside</$tag>";
    } else {
      return "<$tag>";
    }
  }

  String convertChildrenToString() {
    String output = '';

    if (children.length == 0) {
      return '';
    }

    for (OJSTElement child in children) {
      output += child.convertToString();
    }

    return output;
  }
}

class LinkElement extends OJSTElement {
  LinkElement() : super('a');
}
