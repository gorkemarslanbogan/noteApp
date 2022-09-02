import 'package:flutter/material.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/product/Utility/padding_utility.dart';
import 'package:noteapp/product/widget/container_widget.dart';
import 'package:noteapp/product/widget/no_note_text.dart';
import 'package:noteapp/viewmodel/add_notes_provider.dart';
import 'package:noteapp/viewmodel/recently_deleted.dart';
import 'package:provider/provider.dart';

class note_gridview_builder_trash extends StatefulWidget {
  const note_gridview_builder_trash({ Key? key }) : super(key: key);

  @override
  State<note_gridview_builder_trash> createState() => _note_gridview_builder_trashState();
}
const double kZero = 0;
class _note_gridview_builder_trashState extends State<note_gridview_builder_trash> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Recentlydeleted>(
      builder: ((context, value, child) {
      return (value.item.length == kZero) ? centerTextWidget() : GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width / ((MediaQuery.of(context).size.height*0.9))
        ),
      itemCount: value.item.length,
      itemBuilder: ((context, index) {
      final data = value.item;
      return (index == 4 || index % 2 == 0) 
      ? Padding(
        padding: const EdgeInsets.all(5.0),
        child: noteViewWidget(noteModel: data[index],
        callback: (){context.read<Recentlydeleted>().delete(index);}),) : 
        Padding(padding: paddingUtilty.gridViewCustomAllPadding, child: noteViewWidget(noteModel: data[index], callback: (){
        context.read<Recentlydeleted>().delete(index);
      }));
    }));
    }));
  }
}

class note_gridview_builder_home extends StatefulWidget {
  const note_gridview_builder_home({ Key? key, required this.value,}) : super(key: key);
final List<NoteModel> value;
  @override
  State<note_gridview_builder_home> createState() => _note_gridview_builder_homeState(value);
}

class _note_gridview_builder_homeState extends State<note_gridview_builder_home> {
  _note_gridview_builder_homeState(this.value);
  List<NoteModel> value;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width / ((MediaQuery.of(context).size.height*0.9))
        ),
      itemCount: value.length,
      itemBuilder: ((context, index) {
      final data = value;
      return (index == 4 || index % 2 == 0) 
      ? Padding(
        padding: const EdgeInsets.all(5.0),
        child: noteViewWidget(noteModel: data[index],
        callback: (){context.read<Addnote>().deleteModel(index, data[index],context);}),) : 
        Padding(padding: paddingUtilty.gridViewCustomAllPadding, child: noteViewWidget(noteModel: data[index], callback: (){
        context.read<Addnote>().deleteModel(index, data[index],context);
      }));
    }));
  }
}