import 'package:flutter/material.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/product/TexteditingController/controller.dart';
import 'package:noteapp/product/Utility/app_utility.dart';
import 'package:noteapp/product/Utility/padding_utility.dart';
import 'package:noteapp/product/widget/custom_elevationButton.dart';
import 'package:noteapp/product/widget/sneakBar.dart';
import 'package:noteapp/product/widget/text_field.dart';
import 'package:noteapp/viewmodel/add_notes_provider.dart';
import 'package:provider/provider.dart';


class addNote extends StatelessWidget {
   const addNote({ Key? key }) : super(key: key);
   static late NoteModel _model;
  @override
  Widget build(BuildContext context) {
    List<Widget> _columnItem = [
          Padding(
            padding: paddingUtilty.symectricPadding,
            child: scrollTextField(),
          ),
           customElevationButton(
                callback: (){
               _model = NoteModel(textController.noteController.text, DateTime.now());
               final data =  context.read<Addnote>().addNote(_model);
               textController.clearControllerText();
              (data == true) ? ScaffoldMessenger.of(context).showSnackBar(snackBarWidget.snackBar) : null;},
               buttonText: AppUtility.add_note),
        ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppUtility.add_note),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: _columnItem,
          ),
        ),
      ),
    );
  }
}
