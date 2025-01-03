import 'dart:io';
import 'package:archive/archive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_string/random_string.dart';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddDictionaryButton extends StatelessWidget {
  const AddDictionaryButton({super.key});

  void getZipFile() async {
    final tempDir = await getTemporaryDirectory(); // Get temporary directory
    String tempDirPath =
        "${tempDir.path}/${randomString(10)}/"; // Ensure the path ends with '/'

    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['zip']);

    if (result != null) {
      try {
        print("Temp Directory Path: ${tempDirPath}");
        print("ZIP File Path: ${result.files.single.path}");
        print("Extraction complete");
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
