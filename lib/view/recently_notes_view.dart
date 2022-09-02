import 'package:flutter/material.dart';
import 'package:noteapp/product/Utility/app_utility.dart';
import 'package:noteapp/product/widget/draver.dart';
import 'package:noteapp/product/widget/list_view_not_builder.dart';
import 'package:noteapp/product/widget/note_gridview_builder.dart';
import 'package:noteapp/viewmodel/home_screen_provider.dart';
import 'package:noteapp/viewmodel/recently_deleted.dart';
import 'package:provider/provider.dart';

class recentlyDeletedNote extends StatefulWidget {
  const recentlyDeletedNote({ Key? key }) : super(key: key);

  @override
  State<recentlyDeletedNote> createState() => _recentlyDeletedNoteState();
}

class _recentlyDeletedNoteState extends State<recentlyDeletedNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const customDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Trash"),
      actions: [
        const Center(child: Text(AppUtility.delete_all_note)),
        IconButton(onPressed: (){
          context.read<Recentlydeleted>().deleteAll();
        }, icon: const Icon(Icons.delete_forever))
      ],
      ),
      body: Consumer<Recentlydeleted>(
      builder: ((context, value, child) {
      return context.watch<homeScreenProvider>().isList ? listViewNot(listModel: value.item,) : note_gridview_builder_trash();
    }))
    );
  }
}


