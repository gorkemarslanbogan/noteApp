// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../Utility/app_utility.dart';

class snackBarWidget {
static final SnackBar snackBar = SnackBar(
            content:  Text(AppUtility.transaction_succesful),
            action: SnackBarAction(
              label: AppUtility.close,
              onPressed: () {},
            ),
          );
}
