import 'package:flutter/material.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/product/TexteditingController/controller.dart';
import 'package:noteapp/product/Utility/app_utility.dart';
import 'package:noteapp/product/Utility/padding_utility.dart';
import 'package:noteapp/product/widget/custom_elevationButton.dart';
import 'package:noteapp/product/widget/snackBar.dart';
import 'package:noteapp/product/widget/text_field.dart';
import 'package:provider/provider.dart';
import '../viewmodel/add_notes_provider.dart';


class detailsNote extends StatefulWidget {
   const detailsNote({ Key? key,}) : super(key: key);

  @override
  State<detailsNote> createState() => _detailsNoteState();
}

class _detailsNoteState extends State<detailsNote> {
  @override
  void initState() {
    super.initState();
     Future.microtask(() {
      final data =  ModalRoute.of(context)?.settings.arguments;
    if (data is NoteModel){  
      noteModel = data;
      textController.noteController.text = noteModel?.note ?? "";
      setState(() {});
     }});
  }
  @override
  void dispose() {
    super.dispose();
    textController.clearControllerText();
  }
  NoteModel? noteModel;
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Your Not"),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: paddingUtilty.symectricPadding,
                child: scrollTextField(),
              ),
              customElevationButton(buttonText: AppUtility.change_note, callback: (){
                  final data =  context.read<Addnote>().changeNote(noteModel!, textController.noteController.text);
                   textController.clearControllerText();
                  (data == true) ? ScaffoldMessenger.of(context).showSnackBar(snackBarWidget.snackBar) : null;
              })
            ],
          ),
        ),
      ),
    );
  }
}