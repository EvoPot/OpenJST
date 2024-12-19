import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

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
  String varToHtml(dynamic input) {
    //The function for processing variables to HTML.

    if (input is Map) {
      //Processing for maps. waow
      //The following are the values from the json dictionaries:

      String tag = input["tag"] ?? "";
      String description = input["description"] ?? "";
      String width = input["width"].toString();
      String height = input["height"].toString();
      String sizeUnits = input["sizeUnits"] ?? "";
      String imageRendering = input["imageRendering"] ?? "";

      String styles =
          """font-style: ${input["style"]?["fontStyle"] ?? "normal"};

                    font-weight: ${input["style"]?["fontWeight"] ?? "normal"};

                    font-size: ${input["style"]?["fontSize"] ?? "16px"};

                    text-decoration-line: ${input["style"]?["textDecorationLine"] is List ? (input["style"]["textDecorationLine"] as List).join(" ") : input["style"]?["textDecorationLine"] ?? "none"};

                    vertical-align: ${input["style"]?["verticalAlign"] ?? "baseline"};

                    text-align: ${input["style"]?["textAlign"]?.toString() ?? "left"};"""; //Initialize CSS styles.

      String innerValue = varToHtml(input["content"]).replaceAll(
          "\n", "<br>"); // The inner value. <example>(its this one)</example>

      if (["ruby", "rp", "rt"].contains(input["tag"])) {
        return """<$tag>$innerValue</$tag>"""; // Output a styleless html element for rubies (the hiragana stuff) - Is likely temporary!
      }

      if (input["tag"] == "img" || input["type"] == "image") {
        return """<${input["tag"] ?? "img"} src="asset:assets/images/favicon.png" 
                alt=$description
                width = $width$sizeUnits
                height = $height$sizeUnits
                image-rendering:$imageRendering
                ${input["pixelated"] == true ? "image-rendering:pixelated" : ""}>"""; //The dictionary format has "pixelated" and "imageRendering" attributes seperately, this is for fallback
      } else {
        String colSpanAttr = input["colSpan"] != null
            ? 'colspan="${input["colSpan"]}"'
            : ''; //For the tables
        String rowSpanAttr = input["rowSpan"] != null
            ? 'rowspan="${input["rowSpan"]}"'
            : ''; //Also for the tables

        return ("""
            <$tag
                style="$styles"
                  $colSpanAttr $rowSpanAttr>
                    $innerValue</$tag>

                """
            .replaceAll(RegExp(r'\s+'), ' ')
            .trim()); //Return the final result
      }
    } else if (input is List) {
      String output = "";

      for (dynamic i in input) {
        output += varToHtml(i);
      } //Process every element of a List

      return output;
    } else {
      return input
          .toString(); //If the input is not a map or a list, just return the input as a string.
    }
  }

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
            widget.structure["content"])); //Return the content for the text
      } else {
        return HtmlWidget(varToHtml(widget.structure)); //Fallback
      }
    }
    return Text(widget.structure.toString()); //Fallback
  }
}
