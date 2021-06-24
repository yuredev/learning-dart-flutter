final noteTableName = 'notes';

class NoteTableColumns {
  static final id = '_id';
  static final isImportant = 'isImportant';
  static final number = 'number';
  static final title = 'title';
  static final description = 'description';
  static final time = 'createdTime';

  static final List<String> values = [
    id,
    isImportant,
    number,
    title,
    description,
    time
  ];
}

class Note {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const Note({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  Map<String, Object?> toJSON() => {
        NoteTableColumns.id: id,
        NoteTableColumns.title: title,
        NoteTableColumns.description: description,
        // valores boleanos no SQL são 0 ou 1
        NoteTableColumns.isImportant: isImportant ? 1 : 0,
        NoteTableColumns.number: number,
        NoteTableColumns.time: createdTime.toIso8601String(),
      };

  static Note fromJSON(Map<String, Object?> jsonNote) {
    return Note(
      id: jsonNote[NoteTableColumns.id] as int?,
      title: jsonNote[NoteTableColumns.title] as String,
      createdTime: DateTime.parse([NoteTableColumns.time] as String),
      description: jsonNote[NoteTableColumns.description] as String,
      isImportant: (jsonNote[NoteTableColumns.isImportant] as int) == 0 ? false : true,
      number: jsonNote[NoteTableColumns.number] as int,
    );
  }

  Note copy({
    int? id,
    bool? isImportant = false,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );
}
