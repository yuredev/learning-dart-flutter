import 'package:sqfite_database/database/sql_types.dart';
import 'package:sqfite_database/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {

    // getDatabasesPath() retorna o caminho para o banco, no caso do Android é data/data/databases algo assim
    final dbPath = await getDatabasesPath();
    final completePath = path.join(dbPath, fileName);

    return openDatabase(completePath, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $noteTableName (
        ${NoteTableColumns.id} ${SQLTypes.id},
        ${NoteTableColumns.isImportant} ${SQLTypes.boolean},
        ${NoteTableColumns.number} ${SQLTypes.integer},
        ${NoteTableColumns.title} ${SQLTypes.text},
        ${NoteTableColumns.description} ${SQLTypes.text},
        ${NoteTableColumns.createdTime} ${SQLTypes.text},
      );
    ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
