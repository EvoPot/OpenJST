import 'structuredcontent.dart';
import 'package:flutter/material.dart';


class ResultList extends StatelessWidget {
  final List<List<dynamic>> input;
  const ResultList({super.key, required this.input});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index){
      return Structuredcontent(structure: input[index]);
    }
    );
  }
}