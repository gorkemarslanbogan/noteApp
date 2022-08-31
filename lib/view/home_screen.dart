import 'package:flutter/material.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/product/Utility/app_utility.dart';
import 'package:noteapp/product/navigator/navigator.dart';
import 'package:noteapp/product/widget/container_widget.dart';
import 'package:noteapp/product/widget/draver.dart';
import 'package:noteapp/viewmodel/add_notes_provider.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
const double kZero = 0; 
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const customDrawer(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).pushNamed(navigatorPagename.addNote.withParaf);
      }, child: const Icon(Icons.add),),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppUtility.AppHomePagetitle),
      ),
      body:  Consumer<Addnote>(
      builder: ((context, value, child) {
      return (value.item.length == kZero) ?  _centerTextWidget() : Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
        child: _gridViewBuilder(noteModelList: value.item,),
      );
    })),
    );
  }
}


class _gridViewBuilder extends StatelessWidget {
  const _gridViewBuilder({
    Key? key, required this.noteModelList,
  }) : super(key: key);
final List<NoteModel> noteModelList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width / ((MediaQuery.of(context).size.height*0.9))
        ),
      itemCount: noteModelList.length,
      itemBuilder: ((context, index) {
      final data = noteModelList;
      return (index == 4 || index % 2 == 0) ? Padding(
        padding: const EdgeInsets.all(5.0),
        child: noteViewWidget(noteModel: data[index],callback: (){
           context.read<Addnote>().deleteModel(index, data[index], context);
        },),
      ) : Padding(padding: EdgeInsets.only(top: 35, right: 10,left: 5), child: noteViewWidget(noteModel: data[index],callback: (){
         context.read<Addnote>().deleteModel(index, data[index], context);
      },));
    }));
  }
}

class _centerTextWidget extends StatelessWidget {
   _centerTextWidget({
    Key? key,
  }) : super(key: key);
final Color _grey800 = Colors.grey.shade800;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(AppUtility.you_have_no_not, style: Theme.of(context).textTheme.headline6?.copyWith(
      fontWeight: FontWeight.w400,
      color: _grey800
    ),),);
  }
}