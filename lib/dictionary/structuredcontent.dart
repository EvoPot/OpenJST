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
  //i have no idea how this code even works anymore but im going with it
  String varToHtml(dynamic input) {
    String output = "";
    String additions = "";

    if (input is Map) {
      String styles =
          """font-style: ${input["style"]?["fontStyle"] ?? "normal"};

                    font-weight: ${input["style"]?["fontWeight"] ?? "normal"};

                    font-size: ${input["style"]?["fontSize"] ?? "16px"};

                    text-decoration-line: ${input["style"]?["textDecorationLine"] is List ? (input["style"]["textDecorationLine"] as List).join(" ") : input["style"]?["textDecorationLine"] ?? "none"};

                    vertical-align: ${input["style"]?["verticalAlign"] ?? "baseline"};

                    text-align: ${input["style"]?["textAlign"] ?? "left"};""";

      if (["ruby", "rp", "rt"].contains(input["tag"])) {
        return """<${input["tag"]}>${varToHtml(input["content"]).replaceAll("\n", "<br>")}</${input["tag"]}>"""; // this code is sponsored by black magic
      }

      if (input["tag"] == "img" || input["type"] == "image") {
        return """<${input["tag"] ?? "img"} src="asset:assets/images/favicon.png" 
                alt=${input["description"]}
                width = ${input["width"]?.toString() ?? ""}${input["sizeUnits"] is String ? input["sizeUnits"] : ""}
                height = ${input["height"]?.toString() ?? ""}${input["sizeUnits"] is String ? input["sizeUnits"] : ""}
                ${input["pixelated"] == true ? "image-rendering:pixelated" : ""}>""";
      } else {
        String colSpanAttr =
            input["colSpan"] != null ? 'colspan="${input["colSpan"]}"' : '';
        String rowSpanAttr =
            input["rowSpan"] != null ? 'rowspan="${input["rowSpan"]}"' : '';

        return ("""
            <${input["tag"]}
            style="$styles"
            $colSpanAttr $rowSpanAttr>
              ${varToHtml(input["content"]).replaceAll("\n", "<br>")}</${input["tag"]}>

          """
            .replaceAll(RegExp(r'\s+'), ' ')
            .trim());

        // This is NOT readable
      }
    } else if (input is List) {
      for (var i in input) {
        output += varToHtml(i);
      }
      return output;
    } else {
      return input.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    //cant read the code? me too!

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
                "content"]); //if the inputted map has a 'type', it is likely a 'structured-content'
      } else if (widget.structure["type"] == "text") {
        return HtmlWidget(varToHtml(widget.structure["content"]));
      } else {
        return HtmlWidget(varToHtml(widget.structure));
      }
    }
    return Text(widget.structure.toString());
  }
}
