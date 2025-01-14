import 'dart:io';

import '../ojst-ffmpeg.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:path_provider/path_provider.dart';
import 'randomstring.dart';

/*
This function gets a path to a video file, extracts the subtitle tracks in the video file as SRT files into a temporary directory, and then returns that directories path.
*/

Future<String> ExtractVideoSubs(String videoDir) async{
  final tempDir = await getTemporaryDirectory();
  final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();
  final extractingDir = "${tempDir.path}/${randomString(8)}";

  final dir = Directory(extractingDir);
  if(!await dir.exists()){
    await dir.create(recursive: true);
  }

  _flutterFFmpeg.execute("ffmpeg -i $videoDir -map 0:s -c:s srt $extractingDir/subtitle_%d.srt");
  return extractingDir;
  
}