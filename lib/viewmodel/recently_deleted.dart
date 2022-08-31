
import 'package:flutter/material.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/viewmodel/add_notes_provider.dart';
import 'package:provider/provider.dart';

class Recentlydeleted extends ChangeNotifier{
  List<NoteModel> item = [];

  void delete(int index) {
    item.removeAt(index);
    notifyListeners();
  }
  void deleteAll() {
    item.clear();
    notifyListeners();
  }
  void saveNote(NoteModel model, BuildContext context) {
    context.read<Addnote>().item.add(model);
    item.remove(model); 
    notifyListeners();
    }
}