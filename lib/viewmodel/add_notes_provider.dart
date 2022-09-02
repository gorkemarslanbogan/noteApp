import 'package:flutter/material.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/product/Utility/dbHelper.dart';
import 'package:noteapp/viewmodel/recently_deleted.dart';
import 'package:provider/provider.dart';

class Addnote extends ChangeNotifier {
  Addnote(){fetchItem();}
  List<NoteModel> item = [];
  bool isLoading = false;
  
  void _changeLoading() {
    isLoading = !isLoading;
  }
 Future<void> fetchItem() async {
    _changeLoading();
    item = await DbHelper.initialize.getListItem();
    notifyListeners();
    _changeLoading();
}
  Future<bool> addNote(NoteModel model) async {
    try {
      item.add(model);
      await DbHelper.initialize.insert(model);
    notifyListeners();
    return true;
    } catch (e) {
      return false;
    }
  }

 Future<void> deleteModel(int index, NoteModel model, BuildContext context) async {
    if(model.id != null) {
      await DbHelper.initialize.delete(model.id!);
    }
    item.removeAt(index);
    context.read<Recentlydeleted>().item.add(model);
    notifyListeners();
  } 

   Future<bool> changeNote(NoteModel model, String newNote) async {
    try{
      model.setNote = newNote;
     if(model.id != null) {
      await DbHelper.initialize.update(model.id!, model);
    }
    notifyListeners();
    return true;
    }
    catch(e){
      Exception(e.hashCode.toString());
      return false;
    }
  }
}