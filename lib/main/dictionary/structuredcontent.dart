import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../htmlprocessing/vartohtml.dart';

//im actually about to lose it
//if its functional, it doesnt need a fix! \(^v^)/

/*

This widget is supposed to get the "content" of the "structured-content" elements in the dictionary.
Because the content is mostly HTML represented in variables the code here is mostly for HTML conversion.

*/

class Structuredcontent extends StatefulWidget {
  final dynamic structure;
  const Structuredcontent({super.key, required this.structure});

  @override
  State<Structuredcontent> createState() => _StructuredcontentState();
}

class _StructuredcontentState extends State<Structuredcontent> {
  //i have no idea how this code even works anymore but im going with it

  @override
  Widget build(BuildContext context) {
    if (widget.structure is String) {
      return HtmlWidget(widget
          .structure); //return the text itself if what we have is raw text
    } else if (widget.structure is List) {
      return ListView.builder(
          //if its a list build a list of the same widgets owo
          shrinkWrap: true,
          itemCount: widget.structure.length,
          itemBuilder: (context, index) {
            return Structuredcontent(structure: widget.structure[index]);
          });
    } else if (widget.structure is Map) {
      if (widget.structure["type"] == "structured-content") {
        return Structuredcontent(
            structure: widget.structure[
                "content"]); //Maps that have a "type" are likely structured contents.
      } else if (widget.structure["type"] == "text") {
        return HtmlWidget(varToHtml(
            widget.structure["content"], true)); //Return the content for the text
      } else {
        return HtmlWidget(varToHtml(widget.structure, true)); //Fallback
      }
    }
    return Text(widget.structure.toString()); //Fallback
  }
}
