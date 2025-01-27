
import 'package:openjst/main/ojst-html/document.dart';
import 'package:openjst/main/ojst-html/element.dart';
import 'package:openjst/main/ojst-html/styleattribute.dart';

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

  List<OJSTElement> generateStructuredContent(dynamic content){

    List<OJSTElement> result = [];

    if(content is Map){
      if(content.containsKey("type")){
        String type = content["type"];
        switch (type){
          case 'structured-content':
            result.addAll(generateStructuredContent(content["content"]));
        }
      } else if (content.containsKey("tag")){

        String tag = content["tag"];

        switch(tag){
          case 'br': 
            result.add(LineBreak());
          case 'ruby':
          case 'rt':
          case 'rp':
            UnstyledElement out = UnstyledElement(tag: tag, hasChildren: true, lang: content["lang"]);
            out.classes.add('gloss-sc-$tag');
            out.children = generateStructuredContent(content["content"]);
            result.add(out);
          case 'table':
            OJSTElement div = OJSTElement('div');
            div.classes.add('gloss-sc-table-container');
            UnstyledElement table = UnstyledElement(tag: tag, hasChildren: true, lang: content["lang"]);
            table.children = generateStructuredContent(content["content"]);
            result.add(div);
          case 'thead':
          case 'tbody':
          case 'tfoot':
          case 'tr':
            UnstyledElement out = UnstyledElement(tag: tag, hasChildren: false, lang: content["lang"]);
            out.classes.add('gloss-sc-$tag');
            result.add(out);
          case 'th':
          case 'td':

            String? colSpan;
            String? rowSpan;
            String? lang;

            if(content.containsKey('colSpan')) colSpan = content["colSpan"].toString();
            if(content.containsKey('rowSpan')) rowSpan = content["rowSpan"].toString();
            if(content.containsKey('lang')) lang = content["lang"];


            TableElement out = TableElement(tag: tag, colSpan: colSpan, rowSpan: rowSpan, lang: lang);

            result.add(out);

          case 'div':
          case 'span':
          case 'ol':
          case 'ul':
          case 'li':
          case 'details':
          case 'summary':

            StyledElement out = StyledElement(tag: tag);
            
            if(content.containsKey('style')){
              out.style = generateStyles(content['style']);
            }

            if(content.containsKey('content')) out.children = generateStructuredContent(content['content']);

            result.add(out);



            



        }


      }

    } else if(content is List){
      for(dynamic i in content){
        result.addAll(generateStructuredContent(i));
      } 
    } else if (content is String){

      StyledElement out = StyledElement(tag: 'span');
      out.children.add(TextElement(text: content));
      result.add(out);
    } else {
      
      StyledElement out = StyledElement(tag: 'span');
      out.children.add(TextElement(text: content.toString()));
      result.add(out);
    }

    return result;

  }

  StyleAttribute generateStyles(Map<String,dynamic> input){
    StyleAttribute output = StyleAttribute();

    if(input['fontStyle'] is String) output.fontStyle = input['fontStyle'];
    if(input['fontWeight'] is String) output.fontWeight = input['fontWeight'];
    if(input['fontSize'] is String) output.fontSize = input['fontSize'];
    if(input['color'] is String) output.color = input['color'];
    if(input['background'] is String) output.background = input['background'];
    if(input['backgroundColor'] is String) output.backgroundColor = input['backgroundColor'];
    if(input['verticalAlign'] is String) output.verticalAlign = input['verticalAlign'];
    if(input['textAlign'] is String) output.textAlign = input['textAlign'];
    if(input['textEmphasis'] is String) output.textEmphasis = input['textEmphasis'];
    if(input['textShadow'] is String) output.textShadow = input['textShadow'];

    if(input['textDecorationLine'] is String) {
      output.textDecorationLine = input['textDecorationLine'];
    } else if(input['textDecorationLine'] is List){
      output.textDecorationLine = input['textDecorationLine'].join(' ');
    }

    if(input['textDecorationStyle'] is String) output.textDecorationStyle = input['textDecorationStyle'];
    if(input['textDecorationColor'] is String) output.textDecorationColor = input['textDecorationColor'];
    if(input['borderColor'] is String) output.borderColor= input['borderColor'];
    if(input['borderStyle'] is String) output.borderStyle = input['borderStyle'];
    if(input['borderRadius'] is String) output.borderRadius = input['borderRadius'];
    if(input['borderWidth'] is String) output.borderWidth = input['borderWidth'];
    if(input['clipPath'] is String) output.textDecorationStyle = input['clipPath'];
    if(input['margin'] is String) output.margin = input['margin'];
    if(input['marginTop'] is int) output.marginTop = '${input['marginTop']}em';
    if(input['marginTop'] is String) output.marginTop = input['marginTop'];
    if(input['marginLeft'] is int) output.marginLeft = '${input['marginLeft']}em';
    if(input['marginLeft'] is String) output.marginLeft = input['marginLeft'];
    if(input['marginRight'] is int) output.marginRight = '${input['marginRight']}em';
    if(input['marginRight'] is String) output.marginRight = input['marginRight'];
    if(input['marginBottom'] is int) output.marginBottom = '${input['marginBottom']}em';
    if(input['marginBottom'] is String) output.marginBottom = input['marginBottom'];
    if(input['padding'] is String) output.padding = input['padding'];
    if(input['paddingTop'] is String) output.paddingTop = input['paddingTop'];
    if(input['paddingLeft'] is String) output.paddingLeft = input['paddingLeft'];
    if(input['paddingRight'] is String) output.paddingRight = input['paddingRight'];
    if(input['paddingBottom'] is String) output.paddingBottom = input['paddingBottom'];
    if(input['wordBreak'] is String) output.wordBreak = input['wordBreak'];
    if(input['whiteSpace'] is String) output.whiteSpace = input['whiteSpace'];
    if(input['cursor'] is String) output.cursor = input['cursor'];
    if(input['listStyleType'] is String) output.listStyleType = input['listStyleType'];

    return output;
    

  }


}