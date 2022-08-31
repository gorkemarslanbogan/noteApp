import 'package:flutter/material.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/product/navigator/navigator.dart';

// this widget only can use gridViewBuilder 


class noteViewWidget extends StatelessWidget {
   noteViewWidget({ Key? key, required this.noteModel }) : super(key: key);
 NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, navigatorPagename.detailsNote.withParaf, arguments: noteModel);
      },
      child: Container(
        decoration: BoxDecoration(
         color: Theme.of(context).primaryColor,
         borderRadius: BorderRadius.circular(15),
         boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 10,
          offset: Offset(3, 3),
         )]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Text(noteModel.note ,style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).primaryColorDark.withOpacity(0.9),
                ),maxLines: 2, overflow: TextOverflow.ellipsis,)),
              Expanded(
                flex: 7,
                child: Text(noteModel.note, maxLines: 9, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w400,
                ))),
            ],
          ),
        ),
      ),
    );
  }
}