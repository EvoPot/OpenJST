import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddDictionaryButton extends StatelessWidget {
  const AddDictionaryButton({super.key});

  void getZipFile() async {
    final tempDir = await getTemporaryDirectory();
    print(tempDir);
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['zip']);

    if (result != null) {
      print(result.files.single.path);
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
