

import 'package:flutter/cupertino.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/viewmodel/recently_deleted.dart';
import 'package:provider/provider.dart';

class Addnote extends ChangeNotifier {
  List<NoteModel> item = [NoteModel("Test", DateTime.now())];
    bool addNote(NoteModel model) {
    try {
      item.add(model);
    notifyListeners();
    return true;
    } catch (e) {
      return false;
    }
  }

 void deleteModel(int index, NoteModel model, BuildContext context) {
    item.removeAt(index);
    context.read<Recentlydeleted>().item.add(model);
    notifyListeners();
  } 

   bool changeNote(NoteModel model, String newNote) {
    try{
      model.setNote = newNote;
    notifyListeners();
    return true;
    }
    catch(e){
      Exception(e.hashCode.toString());
      return false;
    }
  }
}