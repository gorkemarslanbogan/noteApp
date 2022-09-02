import 'package:flutter/material.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/product/Utility/app_utility.dart';
import 'package:noteapp/product/Utility/padding_utility.dart';
import 'package:noteapp/product/navigator/navigator.dart';
import 'package:noteapp/product/widget/center_circular.dart';
import 'package:noteapp/product/widget/container_widget.dart';
import 'package:noteapp/product/widget/draver.dart';
import 'package:noteapp/product/widget/list_view_not_builder.dart';
import 'package:noteapp/product/widget/no_note_text.dart';
import 'package:noteapp/product/widget/note_gridview_builder.dart';
import 'package:noteapp/viewmodel/add_notes_provider.dart';
import 'package:noteapp/viewmodel/home_screen_provider.dart';
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
        actions: const [_changeView()],
      ),
      body:  Consumer<Addnote>(
      builder: ((context, value, child) {
      return (value.isLoading) ? const centerCircularproges() : (value.item.length == kZero) ?  centerTextWidget() : Padding(
        padding: paddingUtilty.gridViewCustomPadding,
        child: context.watch<homeScreenProvider>().isList ? listViewNot(listModel: value.item,) : note_gridview_builder_home(value: value.item),
      ); 
    })),
    );
  }
}

class _changeView extends StatelessWidget {
  const _changeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      context.read<homeScreenProvider>().changeView();
    }, icon: Icon(context.watch<homeScreenProvider>().isList ? Icons.grid_view : Icons.list));
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
      ) : Padding(
         padding: paddingUtilty.gridViewCustomAllPadding, 
         child: noteViewWidget(noteModel: data[index],callback: (){
         context.read<Addnote>().deleteModel(index, data[index], context);
      },));
    }));
  }
}

