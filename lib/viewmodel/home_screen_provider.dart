import 'package:flutter/material.dart';

class homeScreenProvider extends ChangeNotifier {
  bool _isList = false;

  void changeView() {
    _isList = !_isList;
    notifyListeners();
  }
  
bool get isList => _isList;
}