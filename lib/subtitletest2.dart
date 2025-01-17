import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter_subtitle/flutter_subtitle.dart';
import 'package:file_picker/file_picker.dart';

void main() async{
  late SubtitleController _subControl;
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if(result != null){
    String subsToString = await File(result.files.single.path!).readAsString();
    _subControl = SubtitleController.string(
      subsToString,
      format: SubtitleFormat.srt
      );
    print(_subControl.subtitles);
    print(_subControl.textFromMilliseconds(1067, _subControl.subtitles));
    
  }
  


}



