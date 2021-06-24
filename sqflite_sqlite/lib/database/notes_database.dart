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
        ${NoteTableColumns.time} ${SQLTypes.text},
      );
    ''');
  }

  Future<Note> create(Note note) async {
    final db = await instance.database;
    // para inserir é preciso converter para json antes
    // o sqflite retorna o id do novo registro no banco
    // caso o id não seja passado ele gera um id novo e o retorna
    // caso seja passado ele retorna o id passado dentro do objeto a ser criado
    int id = await db.insert(noteTableName, note.toJSON());

    // rodar sql bruto no banco
    // await db.rawInsert('INSERT INTO...');

    return note.copy(id: id);
  }

  Future<Note?> read(int id) async {
    final db = await instance.database;

    final jsonNotes = await db.query(
      noteTableName,
      where: '${NoteTableColumns.id} = ?',
      columns: NoteTableColumns.values,
      // o valor colocado no whereArgs substitui o ? do where
      // obs: não é recomendado colocar direto no where pois
      // deixa vuneravel a SQL Injection
      whereArgs: [id],

      // usando mais de um whereArgs
      // where: '${NoteTableColumns.id} = ? AND ${NoteTableColumns.title} = ?',
      // whereArgs: [id, title],
    );

    if (jsonNotes.isNotEmpty) {
      return Note.fromJSON(jsonNotes.first);
    }

    return null;
  }

  Future<List<Note>> readAll() async {
    final db = await instance.database;
    final result = await db.query(
      noteTableName,
      columns: NoteTableColumns.values,
      orderBy: '${NoteTableColumns.time} ASC',
    );

    return result.map((jsonNote) => Note.fromJSON(jsonNote)).toList();
  }

  Future<int> update(Note note) async {
    final db = await instance.database;

    final result = await db.update(
      noteTableName,
      note.toJSON(),
      where: '${NoteTableColumns.id} = ?',
      whereArgs: [note.id],
    );

    return result;
  }

  Future<int> delete(Note note) async {
    final db = await instance.database;

    final result = await db.delete(
      noteTableName,
      where: '${NoteTableColumns.id} = ?',
      whereArgs: [note.id],
    );

    return result;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
