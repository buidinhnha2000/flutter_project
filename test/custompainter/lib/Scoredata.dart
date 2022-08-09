import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/material.dart';
class ScoreData{
  static Future<String> get getFilePath async{
    final Directory directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }
  static Future<File> get getFile async{
    final path = await getFilePath;
    return File('$path/score.txt');
  }
  static Future<String> readScore() async{
    try {
      final file = await getFile;
      String fileContents = await file.readAsString();
      return fileContents;
    } catch (e) {
      print('Error $e');
      return 'Error';
    }
  }
  static Future<File> saveScore(String score) async{
    final file = await getFile;
    return file.writeAsString(score);
  }
}