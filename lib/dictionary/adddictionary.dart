import 'dart:io';
import 'dart:math';
import 'package:archive/archive.dart';
import 'package:openjst/dictionary/progressprovider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:path/path.dart' as p;

class AddDictionaryButton extends StatelessWidget {
  const AddDictionaryButton({super.key});

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
    final tempDir = await getTemporaryDirectory(); // get temporary directory
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Importing dictionary..."),
            content: Consumer<ProgressProvider>(
              builder: (context, value, child) => Column(
                children: [
                  LinearProgressIndicator(
                    value: (value.progress / value.max) ?? 1,
                  ),
                  Text("${value.progress}/${value.max}"),
                  Text(value.message)
                ],
              ),
            ),
          );
        });
    String tempDirPath =
        "${tempDir.path}/${randomString(10)}"; // Ensure the path ends with '/'

    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['zip']);

    progressProvider.changeMessage("Extracting zip file...");

    if (result != null) {
      try {
        final newDir = Directory(tempDirPath);

        if (!await newDir.exists()) {
          await newDir.create(recursive: true); //Ensure the path gets generated
        }

        final bytes = File(result.files.single.path!).readAsBytesSync();
        final archive = ZipDecoder().decodeBytes(bytes);
        progressProvider.changeMax(archive.length);

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

                if (jsonObject is List) {
                  for (var i in jsonObject) {
                    print(
                        i); // temporary solution just like every other solution lmao
                  }
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
    return MaterialButton(
      onPressed: () => getZipFile(context),
      child: Text('Add a dictionary...'),
    );
  }
}
