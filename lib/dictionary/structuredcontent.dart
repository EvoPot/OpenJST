import 'dart:convert';

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
  String varToHtml(dynamic input) {
    String output = "";
    String additions = "";
    if (input is Map) {
      return ("""<${input["tag"]} 
                 style="text-decoration-line: ${input["style"] != null && input["style"]["textDecorationLine"] is List ? (input["style"]["textDecorationLine"] ?? []).join(" ") : (input["style"]?["textDecorationLine"] ?? "none")};
                 font-size: ${input["style"]?["fontSize"] ?? "none"};
                 font-weight: ${input["style"]?["fontWeight"] ?? "normal"};">
            ${varToHtml(input["content"])}
          </${input["tag"]}>"""); // This is NOT readable
    } else if (input is List) {
      for (var i in input) {
        output += varToHtml(i);
      }
      return output;
    } else {
      return input.toString();
    }
    return "null";
  }

  @override
  Widget build(BuildContext context) {
    //cant read the code? me too!

    if (widget.structure is String) {
      return Text(widget
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
                "content"]); //if the inputted map has a 'type', it is likely a 'structured-content'
      } else {
        switch (widget.structure["type"]) {
          case ("text"):
            return Text(widget
                .structure["text"]); //why did this need its seperate thing lol

          case ("image"):
          case ("img"):
            //favicon is a placeholder, work on a system to make users add their own files from dictionaries
            return HtmlWidget("""<img src="asset:assets/images/favicon.png" 
                alt=${widget.structure["description"]}
                width = ${widget.structure["width"]}
                height = ${widget.structure["height"]}
                ${widget.structure["pixelated"] ? "image-rendering:pixelated" : ""}>""");
        }
        switch (widget.structure["tag"]) {
          case ("img"):
            return HtmlWidget("""<img src="asset:assets/images/favicon.png" 
                alt=${widget.structure["description"]}
                width = ${widget.structure["width"].toString()}${widget.structure["sizeUnits"] is String ? widget.structure["sizeUnits"] : ""}
                height = ${widget.structure["height"].toString()}${widget.structure["sizeUnits"] is String ? widget.structure["sizeUnits"] : ""}
                ${widget.structure["pixelated"] == true ? "image-rendering:pixelated" : ""}>""");
          case ("ul"):
          case ("ol"):
          case ("table"):
          case ("div"):
          case ("ruby"):
          case ("a"):
            return HtmlWidget(varToHtml(widget
                .structure)); // theres probably a better way to write this but im way too stupid for that
        }
      }
    }
    return Text(widget.structure.toString());
  }
}
