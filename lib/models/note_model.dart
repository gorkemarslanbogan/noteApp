
class NoteModel{
     int? _id;
     String? _note;
     String? _time;
  NoteModel(this._note,this._time,this._id);

 NoteModel.fromJson(Map<String, dynamic> json) {
      _id = json['id'];
    _note = json['note'];
    _time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = _id;
    data['note'] = _note;
    data['time'] = _time;
    return data;
  }


String? get note => _note;
int? get id => _id;
set setNote(String note) => _note = note;
String? get time => _time;



  
}
