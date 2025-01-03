import 'dart:io';
import 'dart:math';
import 'package:archive/archive.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddDictionaryButton extends StatelessWidget {
  const AddDictionaryButton({super.key});

  String randomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    return List.generate(length,
            (index) => chars[(chars.length * Random().nextDouble()).floor()])
        .join();
  }

  void getZipFile() async {
    final tempDir = await getTemporaryDirectory(); // Get temporary directory
    String tempDirPath =
        "${tempDir.path}/${randomString(10)}"; // Ensure the path ends with '/'

    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['zip']);

    if (result != null) {
      try {
        final newDir = Directory(tempDirPath);

        if (!await newDir.exists()) {
          await newDir.create(recursive: true); //Ensure the path gets generated
        }

        final bytes = File(result.files.single.path!).readAsBytesSync();
        final archive = ZipDecoder().decodeBytes(bytes);

        for (var file in archive) {
          final filePath = "${newDir.path}/${file.name}";
          if (file.isFile) {
            final filename = "${newDir.path}/${file.name}";
            await File(filename).writeAsBytes(file.content);
            print("extracted $filename");
          } else if (file.isDirectory) {
            await Directory(filePath).create(recursive: true);
          }
        }
      } catch (e) {
        print("Error extracting ZIP: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: getZipFile,
      child: Text('Add a dictionary...'),
    );
  }
}
