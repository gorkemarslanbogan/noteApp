import 'package:flutter/material.dart';
import 'package:noteapp/product/cache/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
bool _isLight = SharedManager.instance.readBool(sharedKey.isLightTheme);


void changeTheme() {
  _isLight = !_isLight;
  notifyListeners();
}

ThemeData get themeMode => _isLight ? ThemeData.light().copyWith(
  scaffoldBackgroundColor: Color(0xfff7f8fa),
  primaryColor: Color(0xfffbfbfb),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.w300,
    )
  )
) : ThemeData.dark();
bool get isLight => _isLight;

}