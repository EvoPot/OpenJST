import 'package:flutter/material.dart';
import '../../../dictionary/structuredcontent.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../htmlprocessing/vartohtml.dart';

class ResultPage extends StatefulWidget {
  final String searchingFor;
  final List<dynamic> searchResult;
  ResultPage({super.key, required this.searchResult, required this.searchingFor});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  

  late WebViewController controller;

  @override
  void initState() {
    // TODO: implement initState
     super.initState();
     print('search: ${widget.searchResult[0][5]}');
     String htmlContent = varToHtml(widget.searchResult[0][5], true);
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
