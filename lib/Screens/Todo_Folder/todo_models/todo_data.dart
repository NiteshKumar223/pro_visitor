

final String tableNotes = 'visitloglocal';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, title, description, datetime,
  ];

  static final String id = '_id';
  static final String title = 'title';
  static final String datetime = 'datetime';
  static final String description = 'description';
}

class Note {
  final int? id;
  final String title;
  final String datetime;
  final String description;

  const Note({
    this.id,
    required this.title,
    required this.datetime,
    required this.description,
  });

  Note copy({
    int? id,
    String? title,
    String? datetime,
    String? description,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        datetime: datetime ?? this.datetime,
        description: description ?? this.description,
      );

  static Note fromMap(Map<String, Object?> map) => Note(
        id: map[NoteFields.id] as int?,
        title: map[NoteFields.title] as String,
        datetime: map[NoteFields.datetime] as String,
        description: map[NoteFields.description] as String,
      );

  Map<String, Object?> toMap() => {
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.datetime: datetime,
        NoteFields.description: description,
      };
}
