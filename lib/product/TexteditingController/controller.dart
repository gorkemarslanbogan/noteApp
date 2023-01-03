import 'package:flutter/material.dart';

class textController {
 static final TextEditingController _noteController = TextEditingController();
static TextEditingController get noteController => _noteController;
 static void clearControllerText() {
   _noteController.clear();
 }
}