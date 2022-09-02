import 'package:flutter/material.dart';
import 'package:noteapp/product/Utility/app_utility.dart';


class centerTextWidget extends StatelessWidget {
   centerTextWidget({
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