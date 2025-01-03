import 'dart:io';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_string/random_string.dart';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddDictionaryButton extends StatelessWidget {
  const AddDictionaryButton({super.key});

  void getZipFile() async {
    final tempDir = await getTemporaryDirectory(); // get temporary directory
    String tempDirPath =
        "${tempDir.path}/hhh/"; // some random named folder to save the zip ig

    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['zip']);

    if (result != null) {
      try {
        print("Temp Directory Path: ${tempDirPath}");
        print("ZIP File Path: ${result.files.single.path}");

        await ZipFile.extractToDirectory(
          zipFile: File(result.files.single.path!),
          destinationDir: Directory(tempDirPath),
        );
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
