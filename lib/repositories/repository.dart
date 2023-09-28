import 'package:hafiz_akbari/repositories/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class Repository{
  DatabaseConnection? _databaseConnection;

  Repository(){
    _databaseConnection=DatabaseConnection();
  }

  Database? _database;

  Future<Database> get database async{
    if(_database!=null) return _database!;
    _database=await _databaseConnection!.setDatabase();
    return _database!;
  }

  insertData(table,data) async{
    var connection= await database;
    return await connection.insert(table, data);
  }

  readData(table) async{
    var connection= await database;
    return await connection.query(table);
  }

  readDataWithCondition(table,condition) async{
    var connection= await database;
    return await connection.query(table,where: condition);
  }

  deleteData(table,itemId)async {
    var connection= await database;
    return await connection.rawDelete('DELETE FROM $table WHERE id = $itemId');
  }

  updateData(table,data,id)async{
    var connection= await database;
    return await connection.update(table, data,where: 'id=?',whereArgs: [data[id]]);
  }

  updateDataRaw(table,data,id)async{
    var connection= await database;
    return await connection.rawUpdate('UPDATE $table SET $data WHERE id=$id');
  }

  searchForData(table, keyword)async{
    var connection= await database;
    return await connection.query(table, where: 'name LIKE ?', whereArgs: ['%$keyword%']);
  } 

}