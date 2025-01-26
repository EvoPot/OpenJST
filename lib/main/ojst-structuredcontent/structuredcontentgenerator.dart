
import 'package:openjst/main/ojst-html/document.dart';
import 'package:openjst/main/ojst-html/element.dart';

import 'contentmanager.dart';

class StructuredContentGenerator{
  final OJSTDocument document;
  final ContentManager manager;

  StructuredContentGenerator(
    {
      required this.document,
      required this.manager
    }
  );

  OJSTDocument StructuredContentConvert(dynamic content){
    OJSTDocument result = OJSTDocument();
    if(content is Map){

      if(content.containsKey('type')){


      } else if (content.containsKey('tag')){

        
      }

    } else if (content is List){

    } else result.children.add(StyledElement(tag: 'span')..children = [TextElement(text: content.toString())]);
    



    return result;


  }

  OJSTElement createElement(String tag, String classname){

  }

  OJSTElement createStructuredContentElement(Map<String,dynamic> input, String dictionary, String? language){
    switch(input["tag"]){

      case "br":
        return LineBreak();
      case "ruby":
      case "rt":
      case "rp":
        return this._createStructuredContentElement(input["tag"], input, dictionary, language);

    }
  }

  OJSTElement _createStructuredContentElement(String tag, dynamic content, String dictionary, String? language, bool hasChildren, bool hasStyle){
    final container = 

  }

}