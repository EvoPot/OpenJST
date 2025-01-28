import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:openjst/main/dictionary/isar/word.dart';
import 'package:openjst/main/ojst-html/document.dart';
import 'package:openjst/main/ojst-structuredcontent/contentmanager.dart';
import '../../../dictionary/structuredcontent.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../htmlprocessing/vartohtml.dart';
import '../../../ojst-structuredcontent/structuredcontentgenerator.dart';

class ResultPage extends StatefulWidget {
  final String searchingFor;
  final List<Word> searchResult;
  ResultPage({super.key, required this.searchResult, required this.searchingFor});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  

  late WebViewController controller;

  String getImage(String search, String dictionary){
    return '';

  }

  String getAnchor(String search, String dictionary){
    return '';
    
  }

  String listAllResults(List input){
    
    String result = '';

    for (Word i in input) {

      OJSTDocument document = OJSTDocument();
      ContentManager manager = ContentManager(ImageRequestManager: getImage, AnchorRequestManager: getAnchor);
      StructuredContentGenerator generator = StructuredContentGenerator(document: document, manager: manager);

      for(String surface in i.surfaces){

        List<dynamic> decodedElement = jsonDecode(surface);

        document.children = generator.generateStructuredContent(decodedElement[5]);

        String decoded = document.ExtractDocument();

        result += "<div>$decoded</div>";

      }

    }

    print(result + 'is the result there you go');

    return result;

  }

  @override
  void initState() {
    // TODO: implement initState
     super.initState();
     String htmlContent = listAllResults(widget.searchResult);
     controller = WebViewController()

    ..loadHtmlString(htmlContent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Results for ${widget.searchingFor}'),),
      body: WebViewWidget(controller: controller),
    );
  }
}
