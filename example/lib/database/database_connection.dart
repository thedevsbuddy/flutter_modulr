import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  File? _file = null;

  File? get file => _file;
  List<Map<String, dynamic>>? data = null;
  String? _fileName = null;

  DatabaseConnection(String filename) {
    _fileName = filename;
    loadFile();
  }

  // Get the JSON file path
  Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/${_fileName!}.json');
  }

  // Load data from JSON file
  Future<void> loadFile() async {
    try {
      _file = await getFile();
      if (_file != null && await _file!.exists()) {
        final contents = await _file?.readAsString();
        if (contents != null) {
          data = List<Map<String, dynamic>>.from(jsonDecode(contents));
        }
      } else {
        await saveFile([]);
      }
    } catch (e) {
      print("Error loading JSON file: $e");
    }
  }

  // Save data to JSON file
  Future<void> saveFile(List<Map<String, dynamic>> updatedData) async {
    try {
      final jsonString = jsonEncode(updatedData);
      await _file?.writeAsString(jsonString);
    } catch (e) {
      print("Error saving JSON file: $e");
    }
  }
}
