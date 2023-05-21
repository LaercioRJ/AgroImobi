import 'package:flutter/material.dart';

class MessageDeliver {

  showSimpleMessage(message, context) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showMessageDismiss(message, context) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Fechar',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}