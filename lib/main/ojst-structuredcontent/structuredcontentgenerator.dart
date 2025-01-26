
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

  List<OJSTElement> generateStructuredContent(dynamic content){

    List<OJSTElement> result = [];

    if(content is Map){
      if(content.containsKey("type")){
        //TODO : implement structured-content && image
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
            div.children.add(table);
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



            



        }


      }

    }

  }

}