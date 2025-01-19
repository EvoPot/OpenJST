import 'structuredcontent.dart';
import 'package:flutter/material.dart';


class ResultList extends StatelessWidget {
  final List<List<dynamic>> input;
  ResultList({super.key, required this.input});


  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ListView(
        children: List.generate(input.length, (int index) => Structuredcontent(structure: input[index])),
      ),
    );
}}