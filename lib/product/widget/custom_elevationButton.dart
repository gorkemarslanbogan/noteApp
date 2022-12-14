import 'package:flutter/material.dart';
import 'package:noteapp/product/Utility/padding_utility.dart';

class customElevationButton extends StatelessWidget {
   const customElevationButton({ Key? key, required this.buttonText, required this.callback }) : super(key: key);
   final String buttonText;
   final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: paddingUtilty.symectricPadding,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(onPressed: callback,
               child: Text(buttonText)),
            ),
          );
  }
}