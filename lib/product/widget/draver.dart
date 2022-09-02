import 'package:flutter/material.dart';
import 'package:noteapp/product/Utility/app_utility.dart';
import 'package:noteapp/product/cache/shared_preferences.dart';
import 'package:noteapp/product/navigator/navigator.dart';
import 'package:noteapp/viewmodel/theme_provider.dart';
import 'package:provider/provider.dart';


class customDrawer extends StatefulWidget {
  const customDrawer({ Key? key }) : super(key: key);

  @override
  State<customDrawer> createState() => _customDrawerState();
}

class _customDrawerState extends State<customDrawer> {
  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: _drawerBody(),
    );
  }
}

class _drawerBody extends StatelessWidget {
  const _drawerBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return DrawerHeader(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const _drawerHeader(),
        _listtileMenu(title: AppUtility.myNotes, icons: Icons.note_alt_outlined, callback: (){
          Navigator.of(context).pushReplacementNamed(navigatorPagename.Home.withParaf);
        }),
       _listtileMenu(title: AppUtility.recentlydeleted, icons: Icons.delete_outlined,callback: (){
        Navigator.of(context).pushNamed(navigatorPagename.recentlyDeletedNote.withParaf);
       }),
         _listtileMenu(title: AppUtility.information, icons: Icons.info_sharp,callback: (){
          showDialog(context: context, builder:  (context) => const _alertDialog());
         }),

        
      ],
    ));
  }
}

class _listtileMenu extends StatelessWidget {
   _listtileMenu({
    Key? key, required this.title, required this.icons, required this.callback,
  }) : super(key: key);
final title;
final IconData icons;
final VoidCallback? callback;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: callback,
      leading: Icon(icons, color: Colors.black,),
      title: Text(title, style: Theme.of(context).textTheme.subtitle1,),
    );
  }
}

class _drawerHeader extends StatelessWidget {
  const _drawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(child: 
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
         const Icon(Icons.dark_mode, color: Colors.black,),
       const  _themeChanceSwicthButton(),
         const Icon(Icons.light_mode, color: Colors.amber,),
      ],
    ));
  }
}

class _themeChanceSwicthButton extends StatelessWidget {
  const _themeChanceSwicthButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: Colors.amber,
      activeTrackColor: Colors.amber.shade600,
      inactiveTrackColor: Colors.black87,
      inactiveThumbColor: Colors.black,
      value: context.watch<ThemeProvider>().isLight, onChanged: (bool) async {
        context.read<ThemeProvider>().changeTheme();
       final value = context.read<ThemeProvider>().isLight;
       await SharedManager.instance.saveBool(sharedKey.isLightTheme, value);
      });
  }
}

class _alertDialog extends StatelessWidget {
  const _alertDialog({ Key? key }) : super(key: key);
  final alertTitle = "This application was developed by Görkem Arslanboğan.";
  final close = "Close";
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text(alertTitle, style: Theme.of(context).textTheme.subtitle1?.copyWith(
        fontWeight: FontWeight.w400,
      ), textAlign: TextAlign.center,)),
      actions: [
        Center(
          child: TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text(close),),
        )
      ],
    );
  }
}