/* import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:pmsn20232/models/task_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class TareaDB {
  static final nameDB = 'TAREADB';
  static final versionDB = 1;

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database!;
    return _database = await _initDatabase();
  }

  Future<Database?> _initDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB = join(folder.path, nameDB);
    return openDatabase(pathDB, version: versionDB, onCreate: _createTables);
  }

  FutureOr<void> _createTables(Database db, int version) {
    String query = '''
      CREATE TABLE profesor (
        idProfe INTEGER PRIMARY KEY,
        nomProfe TEXT,
        idCarrera INTEGER,
        email TEXT
      )
    ''';
    db.execute(query);

    query = '''
      CREATE TABLE carrera (
        idCarrera INTEGER PRIMARY KEY,
        nomCarrera TEXT
      )
    ''';
    db.execute(query);

    query = '''CREATE TABLE tarea (
        idTarea INTEGER PRIMARY KEY,
        nomTarea TEXT,
        fecExpiracion TEXT,
        fecRecordatorio TEXT,
        desTarea TEXT,
        realizada INTEGER,
        idProfe INTEGER,
        FOREIGN KEY (idProfe) REFERENCES profesor (idProfe)
      )
    ''';
    db.execute(query);
  }

  Future<int> INSERT(String tblName, Map<String, dynamic> data) async {
    var conexion = await database;
    return conexion!.insert(tblName, data);
  }

  Future<int> UPDATE(String tblName, Map<String, dynamic> data) async {
    var conexion = await database;
    return conexion!.update(tblName, data,
        where: 'idTask = ?', whereArgs: [data['idTask']]);
  }

  Future<int> DELETE(String tblName, int idTask) async {
    var conexion = await database;
    return conexion!.delete(tblName, where: 'idTask = ?', whereArgs: [idTask]);
  }

  Future<List<TaskModel>> GETALLTASK() async {
    var conexion = await database;
    var result = await conexion!.query('tblTareas');
    return result.map((task) => TaskModel.fromMap(task)).toList();
  }
}
 */