import 'package:flutter/material.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/product/navigator/navigator.dart';

class noteViewWidget extends StatelessWidget {
   const noteViewWidget({ Key? key, required this.noteModel, required this.callback }) : super(key: key);
 final NoteModel noteModel;
 final VoidCallback callback;
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
          offset: const Offset(3, 3),
         )]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: _notTittleText(noteModel: noteModel)),
              Expanded(
                flex: 7,
                child: _noteTextWidget(noteModel: noteModel)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _removeButton(callback: callback),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}

class _removeButton extends StatelessWidget {
  const _removeButton({
    Key? key,
    required this.callback,
  }) : super(key: key);

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: callback, icon: const Icon(Icons.delete));
  }
}

class _noteTextWidget extends StatelessWidget {
  const _noteTextWidget({
    Key? key,
    required this.noteModel,
  }) : super(key: key);

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Text(noteModel.note ?? "", maxLines: 9, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.subtitle2?.copyWith(
      color: Colors.grey.shade800,
      fontWeight: FontWeight.w400,
    ));
  }
}

class _notTittleText extends StatelessWidget {
  const _notTittleText({
    Key? key,
    required this.noteModel,
  }) : super(key: key);

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Text(noteModel.note ?? "" ,style: Theme.of(context).textTheme.headline6?.copyWith(
      fontWeight: FontWeight.w400,
      color: Theme.of(context).primaryColorDark.withOpacity(0.9),
    ),maxLines: 2, overflow: TextOverflow.ellipsis,);
  }
}