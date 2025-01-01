import 'package:flutter/material.dart';

showDialogText({required BuildContext context, required String msg}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(

          title: Center(child: Text(msg)));
    },
  );
}
