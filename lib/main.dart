import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noteapp/product/Utility/app_utility.dart';
import 'package:noteapp/product/Utility/dbHelper.dart';
import 'package:noteapp/product/navigator/navigator.dart';
import 'package:noteapp/viewmodel/add_notes_provider.dart';
import 'package:noteapp/viewmodel/home_screen_provider.dart';
import 'package:noteapp/viewmodel/recently_deleted.dart';
import 'package:noteapp/viewmodel/theme_provider.dart';
import 'package:provider/provider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  SystemChrome.setPreferredOrientations( 
     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
     await DbHelper.initialize.initializeDb();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Addnote>(create: (_) => Addnote()),
      ChangeNotifierProvider<Recentlydeleted>(create: (_) => Recentlydeleted()),
      ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
      ChangeNotifierProvider<homeScreenProvider>(create: (_) => homeScreenProvider()),
  ],
    child: const MyHomePage()));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppUtility.AppHomePagetitle,
      theme: context.watch<ThemeProvider>().themeMode,
      debugShowCheckedModeBanner: false,
      routes: navigatorRoutes().data,
    );
  }
}