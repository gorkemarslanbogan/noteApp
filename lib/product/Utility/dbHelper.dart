import 'package:noteapp/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
DbHelper._();
  Database? _db;
  static DbHelper? _instance;
  final String _dbPath = "Notemodeldb";
  final int _version = 1;
  final String _tableName = "NoteModelTable";
  final String _columnId = "id";
  final String _columnNote = "note";
  final String _columnTime = "time";

static DbHelper get initialize {
  if(_instance == null) {_instance = DbHelper._();}
  return _instance!;
}
  Future<Database> initializeDb() async {
    _db = await openDatabase(_dbPath, version: _version, onCreate: _createDb);
    return _db!;
  }
   void _createDb(Database db, int version) async {
    db.execute('''
  CREATE TABLE $_tableName 
  ($_columnId integer PRIMARY KEY AUTOINCREMENT, 
  $_columnNote  varchar, 
  $_columnTime varchar)''');
  }

 Future<List<NoteModel>> getListItem() async {
  if(_db != null) initializeDb();
  final data =  await _db?.query(_tableName);
  print(data);
  return data?.map((e) => NoteModel.fromJson(e)).toList() ?? [];
}
Future<void> insert(NoteModel model) async {
  if(_db != null) initializeDb();
  await _db?.insert(_tableName,model.toJson());
}

Future<bool> delete(int id) async {
  if(_db != null) initializeDb();
  final noteData = await _db?.delete(
  _tableName, 
  where: '$_columnId  = ?',
  whereArgs: [id]);
  return noteData != null;
}
Future<bool> update(int id,NoteModel model) async {
  if(_db != null) initializeDb();
  final noteData = await _db?.update(
  _tableName,model.toJson(),
  where: '$_columnId  = ?',
  whereArgs: [id]);
  return noteData != null;
}

Future<void> databaseClose() async {
  await _db?.close();
}
}
