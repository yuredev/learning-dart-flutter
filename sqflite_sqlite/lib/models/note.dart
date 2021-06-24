final noteTableName = 'notes';

class NoteTableColumns {
  static final id = '_id';
  static final isImportant = 'isImportant';
  static final number = 'number';
  static final title = 'title';
  static final description = 'description';
  static final createdTime = 'createdTime';
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
}
