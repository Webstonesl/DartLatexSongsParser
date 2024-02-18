import 'dart:io';

import 'package:latexsongparser/latexsongparser.dart';
import 'package:test/test.dart';

void main() async {
  for (FileSystemEntity entity in Directory('.').listSync()) {
    if (!entity.path.toLowerCase().endsWith('.tex')) continue;
    try {
      await parseChordsheets(entity.absolute.path);
    } on Exception catch (e) {
      print("${entity.path.split('/').last}: $e");
    }
  }
}
