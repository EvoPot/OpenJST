import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

//im actually about to lose it

class Structuredcontent extends StatefulWidget {
  final dynamic structure;
  const Structuredcontent({super.key, required this.structure});

  @override
  State<Structuredcontent> createState() => _StructuredcontentState();
}

class _StructuredcontentState extends State<Structuredcontent> {
  @override
  Widget build(BuildContext context) {
    //cant read the code? me too!

    if (widget.structure is String) {
      return Text(widget.structure);
    } else if (widget.structure is List) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: widget.structure.length,
          itemBuilder: (context, index) {
            return Structuredcontent(structure: widget.structure[index]);
          });
    } else if (widget.structure is Map) {
      if (widget.structure["type"] == "structured-content") {
        return Structuredcontent(
            structure: widget.structure[
                "content"]); //if the inputted map has a 'type', it is likely a 'structured-content'
      }
    }
    return Text(widget.structure.toString());
  }
}
