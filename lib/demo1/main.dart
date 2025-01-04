import 'package:flutter/material.dart';
import 'package:openjst/dictionary/dictionarytile.dart';
import 'package:openjst/dictionary/progressprovider.dart';
import 'package:provider/provider.dart';
import '../dictionary/dictionary.dart';
import '../dictionary/adddictionary.dart';
import '../dictionary/isar/operations.dart';
import 'package:path_provider/path_provider.dart';
import '../text/selectablesubtitle.dart';

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
  List queryList = [];

  void updateText() {
    setState(() {
      selectableText = _controller.text;
    });
  }

  Future<void> updateSearchQuery(String input) async {
    setState(() async {
      selectableText = input;
      queryList = await DictionaryOperations().searchWords(input);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.lightBlue[200],
          body: ListView(
            children: [
              Text("Welcome to the OpenJST Demo #1!"),
              Text("Try adding a dictionary using the button below!"),
              AddDictionaryButton(),
              Text(
                  "Well done! now write some text into the section below, and then click on update"),
              Row(
                children: [
                  TextField(
                    controller: _controller,
                  ),
                  ElevatedButton(onPressed: updateText, child: Text("update"))
                ],
              ),
              SelectableSubtitle(
                  text: selectableText,
                  rowLength: 33,
                  textOutputFunction: updateSearchQuery),
              Text("You currently selected $selectedText!"),
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: queryList.length,
                      itemBuilder: (context, index) {
                        return Dictionarytile(
                            dictionary: queryList, item: index);
                      }))
            ],
          )),
    );
  }
}
