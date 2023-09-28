import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseConnection {
  static const  DB_Name = 'main.db';
   copyDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var newPath = join(directory.path, DB_Name);
    File file = File(newPath);
    ByteData data = await rootBundle.load('assets/$DB_Name');
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
    return await file.writeAsBytes(bytes,flush: true);
  }

  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, DB_Name);
    var database = await openDatabase(path);
    return database;
  }

  initDB() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, DB_Name);
    if(!File(path).existsSync()) {
      await copyDatabase();
      print('copied success...................');
    }
    var database = await openDatabase(path, version: 1);
    return database;
  }

}