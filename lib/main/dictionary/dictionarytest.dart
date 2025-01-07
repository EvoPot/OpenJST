import 'package:flutter/material.dart';
import 'package:openjst/main/dictionary/dictionarytile.dart';
import 'package:openjst/main/dictionary/progressprovider.dart';
import 'package:provider/provider.dart';
import 'dictionary.dart';
import 'adddictionary.dart';
import 'isar/operations.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  print(await getApplicationDocumentsDirectory());
  WidgetsFlutterBinding.ensureInitialized();
  await DictionaryOperations.initialize();
  print(await DictionaryOperations().getAllSurfaces());
  runApp(ChangeNotifierProvider(
      create: (_) => ProgressProvider(), child: const HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          MaterialButton(
              child: Text("h"),
              onPressed: () async {
                print(await DictionaryOperations().searchWords("打"));
              }),
          AddDictionaryButton(
            text: 'add a dictionary',
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: Dictionary.length,
              itemBuilder: (context, index) {
                return Dictionarytile(dictionary: Dictionary, item: index);
              },
            ),
          ),
        ],
      )),
    );
  }
}
