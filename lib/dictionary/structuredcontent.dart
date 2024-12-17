import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

//im actually about to lose it

class Structuredcontent extends StatefulWidget {
  final Map structure;
  const Structuredcontent({super.key, required this.structure});

  @override
  State<Structuredcontent> createState() => _StructuredcontentState();
}

class _StructuredcontentState extends State<Structuredcontent> {
  @override
  Widget build(BuildContext context) {
    dynamic content = widget.structure["content"];

    //cant read the code? me too!

    if (content.runtimeType == String) {
      return Text(content);
    } else if (content.runtimeType == List) {
      return ListView.builder(
          itemCount: content.length,
          itemBuilder: (context, index) {
            return Structuredcontent(structure: content[index]);
          });
    } else if (content.runtimeType == Map) {
      String tag = content["tag"];

      if (tag == "img") {
        return HtmlWidget("""

<img src="${content["path"]}" width="${content["width"]}" height="${content["height"]}" style="${content["pixelated"] ? "image-rendering: pixelated;" : ""}">

""");
      }
    }
    return Text('h');
  }
}
