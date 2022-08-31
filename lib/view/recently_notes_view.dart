import 'package:flutter/material.dart';
import 'package:noteapp/product/Utility/app_utility.dart';
import 'package:noteapp/product/widget/draver.dart';
import 'package:noteapp/viewmodel/recently_deleted.dart';
import 'package:provider/provider.dart';

import '../product/widget/container_widget.dart';

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
      actions: [
        const Center(child: Text(AppUtility.delete_all_note)),
        IconButton(onPressed: (){
          context.read<Recentlydeleted>().deleteAll();
        }, icon: const Icon(Icons.delete_forever))
      ],
      ),
      body: Consumer<Recentlydeleted>(
      builder: ((context, value, child) {
      return  GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width / ((MediaQuery.of(context).size.height*0.9))
        ),
      itemCount: value.item.length,
      itemBuilder: ((context, index) {
      final data = value.item;
      return (index == 4 || index % 2 == 0) ? Padding(
        padding: const EdgeInsets.all(5.0),
        child: noteViewWidget(noteModel: data[index],),
      ) : Padding(padding: EdgeInsets.only(top: 35, right: 10,left: 5), child: noteViewWidget(noteModel: data[index],),);
    }));
    }))
    );
  }
}