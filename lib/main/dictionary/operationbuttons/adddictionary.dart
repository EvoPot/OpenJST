import 'dart:io';
import 'dart:math';
import 'package:archive/archive.dart';
import 'package:openjst/main/progressprovider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:path/path.dart' as p;
import '../operations.dart';
import '../../appstyle/colors.dart';

//hello from the main pc

class AddDictionaryButton extends StatelessWidget {
  final String text;
  AddDictionaryButton({
    super.key,
    required this.text,
  });

  final appColors colors = appColors();

  String randomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    return List.generate(length,
            (index) => chars[(chars.length * Random().nextDouble()).floor()])
        .join();
  }

  void getZipFile(BuildContext context) async {
    final progressProvider =
        Provider.of<ProgressProvider>(context, listen: false); //get provider
    progressProvider.reset(); // reset the provider
    final docDir = await getApplicationDocumentsDirectory(); // get temporary directory
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            
            title: Text("Importing dictionary..."),
            content: Consumer<ProgressProvider>(
              builder: (context, value, child) => Column(
                children: [
                  LinearProgressIndicator(
                    value: (value.progress / value.max),
                  ),
                  Text("${value.progress}/${value.max}"),
                  Text(value.message)
                ],
              ),
            ),
          );
        });
    String dictionarySavePath =
        "${docDir.path}/dictionaries/dic${randomString(10)}"; // Ensure the path ends with '/'

    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['zip']);

    progressProvider.changeMessage("Extracting zip file...");

    if (result != null) {
      try {
        final newDir = Directory(dictionarySavePath);

        if (!await newDir.exists()) {
          await newDir.create(recursive: true); //Ensure the path gets generated
        }

        final bytes = File(result.files.single.path!).readAsBytesSync();
        final archive = ZipDecoder().decodeBytes(bytes);
        progressProvider.changeMax(archive.length);


        int newDictionaryId =
            await DictionaryOperations().addNewDictionary();

        for (var file in archive) {
          //extract the files in the zip
          final filePath = "${newDir.path}/${file.name}";
          if (file.isFile) {
            final filename = "${newDir.path}/${file.name}";
            await File(filename).writeAsBytes(file.content);

            switch (p.extension(filename).toLowerCase()) {
              //check for the file extension
              case ".json":
                print("saw a jason");
                String jsonString = await File(filePath).readAsString();

                var jsonObject = jsonDecode(jsonString);

                print(jsonObject);

                if (jsonObject is List && file.name.startsWith("term_bank")) {


                  int? prevId;
                  int? currentWordToEdit;

                  for(var i in jsonObject){

                    //i[0] is the term, i[1] is the terms reading, i[5] is the list of definitions i[6] is the term id

                    if(i[6] != prevId){

                      currentWordToEdit = await DictionaryOperations().addWord(i[0], newDictionaryId); // the addword function creates a new word thats blank and returns its id.
                      await DictionaryOperations().addSurfaceToWord(currentWordToEdit, jsonEncode(i)); // this function adds a string to the list of surfaces of a word with a specific id.

                    } else {

                      await DictionaryOperations().addSurfaceToWord(currentWordToEdit!, jsonEncode(i));

                    }

                    prevId = i[6];

                  }

                  

                }

                if (file.name.startsWith('index')){
                  await DictionaryOperations().updateDictionary(newDictionaryId, jsonEncode(jsonObject), filePath);
                }
            }

            print("extracted $filename");
          } else if (file.isDirectory) {
            await Directory(filePath).create(recursive: true);
          }
          progressProvider.changeProgress(); // update the progress
        }
      } catch (e) {
        print("Error extracting ZIP: $e");
      } finally {
        Navigator.of(context)
            .pop(); // Close the alert dialog after everything is complete
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => getZipFile(context),
        child: Text(text),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(colors.slightlyDarkerGrey),
          foregroundColor: WidgetStateProperty.all(colors.mainAccentColor),
        ));
  }
}
