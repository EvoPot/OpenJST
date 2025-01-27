import 'package:openjst/main/ojst-structuredcontent/contentmanager.dart';

import 'structuredcontentgenerator.dart';
import '../ojst-html/document.dart';


void main(){
  dynamic content = {"type": "structured-content", "content": [
                {"tag": "div", "style": {"fontStyle": "normal"}, "content": "fontStyle:normal"},
                {"tag": "div", "style": {"fontStyle": "italic"}, "content": "fontStyle:italic"},
                {"tag": "div", "style": {"fontWeight": "normal"}, "content": "fontWeight:normal"},
                {"tag": "div", "style": {"fontWeight": "bold"}, "content": "fontWeight:bold"},
                {"tag": "div", "style": {"fontSize": "xx-small"}, "content": "fontSize:xx-small"},
                {"tag": "div", "style": {"fontSize": "x-small"}, "content": "fontSize:x-small"},
                {"tag": "div", "style": {"fontSize": "70%"}, "content": "fontSize:70%"},
                {"tag": "div", "style": {"fontSize": "smaller"}, "content": "fontSize:smaller"},
                {"tag": "div", "style": {"fontSize": "small"}, "content": "fontSize:small"},
                {"tag": "div", "style": {"fontSize": "medium"}, "content": "fontSize:medium"},
                {"tag": "div", "style": {"fontSize": "large"}, "content": "fontSize:large"},
                {"tag": "div", "style": {"fontSize": "larger"}, "content": "fontSize:larger"},
                {"tag": "div", "style": {"fontSize": "130%"}, "content": "fontSize:130%"},
                {"tag": "div", "style": {"fontSize": "x-large"}, "content": "fontSize:x-large"},
                {"tag": "div", "style": {"fontSize": "xx-large"}, "content": "fontSize:xx-large"},
                {"tag": "div", "style": {"fontSize": "xxx-large"}, "content": "fontSize:xxx-large"},
                {"tag": "div", "style": {"textDecorationLine": "none"}, "content": "textDecorationLine:none "},
                {"tag": "div", "style": {"textDecorationLine": "underline"}, "content": "textDecorationLine:underline "},
                {"tag": "div", "style": {"textDecorationLine": "overline"}, "content": "textDecorationLine:overline "},
                {"tag": "div", "style": {"textDecorationLine": "line-through"}, "content": "textDecorationLine:line-through "},
                {"tag": "div", "style": {"textDecorationLine": ["underline", "overline", "line-through"]}, "content": "textDecorationLine:[underline,overline,line-through] "},
                {"tag": "div", "content": ["baseline ", {"tag": "span", "style": {"verticalAlign": "baseline"}, "content": "verticalAlign:baseline "}]},
                {"tag": "div", "content": ["baseline ", {"tag": "span", "style": {"verticalAlign": "sub"}, "content": "verticalAlign:sub "}]},
                {"tag": "div", "content": ["baseline ", {"tag": "span", "style": {"verticalAlign": "super"}, "content": "verticalAlign:super "}]},
                {"tag": "div", "content": ["baseline ", {"tag": "span", "style": {"verticalAlign": "text-top"}, "content": "verticalAlign:text-top "}]},
                {"tag": "div", "content": ["baseline ", {"tag": "span", "style": {"verticalAlign": "text-bottom"}, "content": "verticalAlign:text-bottom "}]},
                {"tag": "div", "content": ["baseline ", {"tag": "span", "style": {"verticalAlign": "middle"}, "content": "verticalAlign:middle "}]},
                {"tag": "div", "content": ["baseline ", {"tag": "span", "style": {"verticalAlign": "top"}, "content": "verticalAlign:top "}]},
                {"tag": "div", "content": ["baseline ", {"tag": "span", "style": {"verticalAlign": "bottom"}, "content": "verticalAlign:bottom "}]}
            ]};
  OJSTDocument document = OJSTDocument();
  ContentManager manager = ContentManager();

  StructuredContentGenerator generator = StructuredContentGenerator(document: document, manager: manager);

  document.children = generator.generateStructuredContent(content);

  String out = document.ExtractDocument();

  print(out);
}