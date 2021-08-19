//@dart=2.9
import 'package:movie_watch_list/modules/movie_detail.dart';
import 'package:sqflite/sqflite.dart';
import '../repositories/database_connection.dart';

class Repository {
  DatabaseConnection _databaseConnection;

  Repository() {
    _databaseConnection = DatabaseConnection();
  }

  static Database _database;

  //Check if database exist or not
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  insertData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }

  countEntries(table) async {
    var connection = await database;
    return await connection.rawQuery("SELECT COUNT(*) FROM $table");
  }

  readData(table) async {
    var connection = await database;
    return await connection.query(table);
  }

  deleteData(table, itemId) async {
    var connection = await database;
    return await connection
        .rawDelete("DELETE FROM $table where movieTitle='$itemId'");
  }

  updateData(table, data) async {
    var connection = await database;
    return await connection.update(table, data,
        where: 'movieTitle=?', whereArgs: [data['movieTitle']]);
  }

  findById(table, id) async {
    var connection = await database;
    return await connection
        .query(table, where: 'movieTitle=?', whereArgs: [id]);
  }
}
