final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    // Add all fields
    id, nik, fullName, subDivisi, location, dateVisit, description, target, stkNumbers
  ];

  static final String id = '_id';
  static final String nik = 'nik';
  static final String fullName = 'fullName';
  static final String subDivisi = 'subDivisi';
  static final String location = 'location';
  static final String dateVisit = 'dateVisit';
  static final String description = 'description';
  static final String target = 'target';
  static final String stkNumbers = 'stkNumbers';
}

class Note {
  final int? id;
  final int nik;
  final String fullName;
  final String subDivisi;
  final String location;
  final String dateVisit;
  final String description;
  final String target;
  final int stkNumbers;

  const Note({
    this.id,
    required this.nik,
    required this.fullName,
    required this.subDivisi,
    required this.location,
    required this.dateVisit,
    required this.description,
    required this.target,
    required this.stkNumbers,
  });

  Note copy({
    int? id,
    int? nik,
    String? fullName,
    String? subDivisi,
    String? location,
    String? dateVisit,
    String? description,
    String? target,
    int? stkNumbers,
}) =>
    Note(
      id: id ?? this.id,
      nik: nik ?? this.nik,
      fullName: fullName ?? this.fullName,
      subDivisi: subDivisi ?? this.subDivisi,
      location: location ?? this.location,
      dateVisit: dateVisit ?? this.dateVisit,
      description: description ?? this.description,
      target: target ?? this.target,
      stkNumbers: stkNumbers ?? this.stkNumbers,
  );

  static Note fromJson(Map<String, Object?> json) => Note(
    id: json[NoteFields.id] as int?,
          nik: json[NoteFields.nik] as int,
    fullName: json[NoteFields.fullName] as String,
    subDivisi: json[NoteFields.subDivisi] as String,
    location: json[NoteFields.location] as String,
    dateVisit: json[NoteFields.dateVisit] as String,
    description: json[NoteFields.description] as String,
    target: json[NoteFields.target] as String,
    stkNumbers: json[NoteFields.stkNumbers] as int,
  );


  Map<String, Object?> toJson() => {
    NoteFields.id: id,
    NoteFields.nik: nik,
    NoteFields.fullName: fullName,
    NoteFields.subDivisi: subDivisi,
    NoteFields.location: location,
    NoteFields.dateVisit: dateVisit,
    NoteFields.description: description,
    NoteFields.target: target,
    NoteFields.stkNumbers: stkNumbers,
  };
}