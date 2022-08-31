class NoteModel {
    String _note;
    final DateTime _time;
  NoteModel(
    this._note,
    this._time,
  );

String get note => _note;
set setNote(String note) => _note = note;

DateTime get time => _time;
  
}
