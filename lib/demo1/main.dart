import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:openjst/main/dictionary/dictionarytile.dart';
import 'package:openjst/main/progressprovider.dart';
import 'package:provider/provider.dart';
import '../main/dictionary/dictionary.dart';
import '../main/dictionary/adddictionary.dart';
import '../main/dictionary/operations.dart';
import 'package:path_provider/path_provider.dart';
import '../main/text/selectablesubtitle.dart';

void main() async {
  print(await getApplicationDocumentsDirectory());
  WidgetsFlutterBinding.ensureInitialized();
  await DictionaryOperations.initialize();
  print(await DictionaryOperations().getAllSurfaces());
  runApp(ChangeNotifierProvider(
      create: (_) => ProgressProvider(), child: const HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  String selectableText = "";
  String selectedText = "";
  List<List<dynamic>> queryList = [];

  void updateText() {
    setState(() {
      selectableText = _controller.text;
    });
  }

  Future<void> updateSearchQuery(String input) async {
    setState(() {
      queryList.clear();
    });
    List<List<dynamic>> queryResult =
        await DictionaryOperations().searchWords(input);

    setState(() {
      selectedText = input;
      queryList = queryResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.deepPurple[200],
          body: ListView(
            children: [
              Text(
                "Welcome to OpenJST Demo #1!",
                style: TextStyle(fontSize: 40),
              ),
              Text(
                "Try adding a dictionary using the button below!",
                style: TextStyle(fontSize: 30),
              ),
              AddDictionaryButton(
                text: 'add a dictionary',
              ),
              Text(
                "Well done! now write some text into the section below, and then click on update",
                style: TextStyle(fontSize: 30),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                    ),
                  ),
                  ElevatedButton(onPressed: updateText, child: Text("update"))
                ],
              ),
              SelectableSubtitle(
                  text: selectableText, textOutputFunction: updateSearchQuery),
              Text(
                "You have currently selected $selectedText!",
                style: TextStyle(fontSize: 30),
              ),
              ListOfResults(results: queryList),
              Text(
                  "Did things get a little messy? Try resetting the dictionary database using the button below:"),
              ElevatedButton(
                  onPressed: () => DictionaryOperations().resetAll(),
                  child: Text("spooky button"))
            ],
          )),
    );
  }
}

class ListOfResults extends StatefulWidget {
  final List<List<dynamic>> results;
  const ListOfResults({super.key, required this.results});

  @override
  State<ListOfResults> createState() => _ListOfResultsState();
}

class _ListOfResultsState extends State<ListOfResults> {
  @override
  Widget build(BuildContext context) {
    print(" results are ${widget.results}");
    return widget.results.length != 0
        ? ListView.builder(
            key: Key(widget.results.hashCode.toString()),
            shrinkWrap: true,
            itemCount: widget.results.length,
            itemBuilder: (context, index) {
              return Dictionarytile(dictionary: widget.results, item: index);
            })
        : Text("you havent searched for anything yet!");
  }
}
