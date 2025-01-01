import 'package:flutter/material.dart';

showDialogLoading(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) =>
    const AlertDialog(title: Center(child: CircularProgressIndicator())),
  );
}
