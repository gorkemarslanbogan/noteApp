
import 'package:noteapp/view/add_notes.dart';
import 'package:noteapp/view/details.dart';
import 'package:noteapp/view/home_screen.dart';
import 'package:noteapp/view/recently_notes_view.dart';
import 'package:noteapp/view/splash_screen.dart';

class navigatorRoutes {
static const paraf = "/";
  final data = {
        paraf: (context) => const splashScreen(),
        navigatorPagename.Home.withParaf: (context) => const HomeScreen(),
        navigatorPagename.addNote.withParaf: (context) =>  const addNote(),
        navigatorPagename.recentlyDeletedNote.withParaf: (context) =>  const recentlyDeletedNote(),
        navigatorPagename.detailsNote.withParaf: (context) =>  const detailsNote(),
        
      };
}

enum navigatorPagename {Home,addNote,detailsNote,recentlyDeletedNote}

extension navigatorName on navigatorPagename {
  String get withParaf  => "/$name";
}