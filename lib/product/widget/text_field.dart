import 'package:flutter/material.dart';
import 'package:noteapp/product/TexteditingController/controller.dart';



class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    Key? key, required this.controller, required this.fieldTittle,
  }) : super(key: key);
final TextEditingController? controller;
final String fieldTittle;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      controller: textController.noteController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
      hintText: fieldTittle,
      border: _border(Colors.blueGrey.shade400, 1.5),
      enabledBorder: _border(Colors.amber, 2),
      ),
      );
  }

  OutlineInputBorder _border(Color borderColor,double width) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: borderColor, width: width));
  }
}


class scrollTextField extends StatelessWidget {
   scrollTextField({ Key? key }) : super(key: key);
final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
  controller: _scrollController,
  isAlwaysShown: true,
  child: TextField(
    controller: textController.noteController,
    scrollController: _scrollController,
    autofocus: true,
    keyboardType: TextInputType.text,
    maxLines: null,
    autocorrect: true,
    decoration: InputDecoration(
      border: _border(Colors.blueGrey.shade400, 1),
      isDense: true,
    ),
  ),
);
  }
   OutlineInputBorder _border(Color borderColor,double width) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: borderColor, width: width));
  }
  }