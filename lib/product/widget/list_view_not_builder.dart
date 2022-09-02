import 'package:flutter/material.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/product/navigator/navigator.dart';
import 'package:noteapp/viewmodel/add_notes_provider.dart';
import 'package:provider/provider.dart';

class listViewNot extends StatelessWidget {
  const listViewNot({ Key? key, required this.listModel }) : super(key: key);
  final List<NoteModel> listModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listModel.length,
      itemBuilder: (context,index){
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Card(
            child: ListTile(
              onTap: (){Navigator.pushNamed(context, navigatorPagename.detailsNote.withParaf, arguments: listModel[index]);},
            leading: const Icon(Icons.note_alt),
            title: _listViewTextTittle(noteModel: listModel[index]),
            subtitle: _listViewNoteTextWidget(listModel: listModel[index]),
            trailing: IconButton(onPressed: (){
              context.read<Addnote>().deleteModel(index, listModel[index], context);
            }, icon: const Icon(Icons.delete)),
            ),
          ),
        );
      },
    );
  }
}

class _listViewNoteTextWidget extends StatelessWidget {
  const _listViewNoteTextWidget({
    Key? key,
    required this.listModel,
  }) : super(key: key);

  final NoteModel listModel;

  @override
  Widget build(BuildContext context) {
    return Text(listModel.note ?? "", maxLines: 3, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.subtitle2?.copyWith(
      color: Colors.grey.shade800,
      fontWeight: FontWeight.w400,
    ));
  }
}

class _listViewTextTittle extends StatelessWidget {
  const _listViewTextTittle({
    Key? key,
    required this.noteModel,
  }) : super(key: key);

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Text(noteModel.note ?? "", style: Theme.of(context).textTheme.headline6?.copyWith(
      fontWeight: FontWeight.w400,
      color: Theme.of(context).primaryColorDark.withOpacity(0.9),
    ),maxLines: 1, overflow: TextOverflow.ellipsis,);
  }
}