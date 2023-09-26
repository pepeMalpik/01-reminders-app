import 'package:reminders_app/core/core.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  late Database _db;
  static const _databaseName = AppConstants.databaseName;
  static const _databaseVersion = 1;

  static final DbHelper _instance = DbHelper._();
  DbHelper._() {
    init();
  }
  factory DbHelper() {
    return _instance;
  }

  Future<void> init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE lists (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            hex_color TEXT,
            icon TEXT,
            created_at TEXT,
            updated_at TEXT
          )
    ''');
  }
  // Helper methods

  Batch getBatch() {
    return _db.batch();
  }

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert({
    required String table,
    required Map<String, dynamic> row,
  }) async {
    return await _db.insert(table, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows({
    required String table,
  }) async {
    return await _db.query(table);
  }

  Future<List<Map<String, dynamic>>> queryAllRowsWhere({
    required String table,
    required String whereString,
    required List<dynamic> args,
  }) async {
    return await _db.query(
      table,
      where: whereString,
      whereArgs: args,
    );
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount({
    required String table,
  }) async {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $table');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update({
    required String table,
    required Map<String, dynamic> row,
  }) async {
    int id = row['id'];
    return await _db.update(
      table,
      row,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete({
    required String table,
    required int id,
  }) async {
    return await _db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Deletes many rows specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> deleteMany({
    required String table,
    required List<int> ids,
  }) async {
    return await _db.delete(
      table,
      where: 'id IN (${List.filled(ids.length, '?').join(',')})',
      whereArgs: ids,
    );
  }

  Future<int> deleteAll({required String table}) async {
    return await _db.delete(table);
  }
}
