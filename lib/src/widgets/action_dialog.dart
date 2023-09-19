import 'package:flutter/material.dart';

class ActionDialog extends StatelessWidget {
  final String title;
  final Widget message;
  const ActionDialog({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: message,
      actions: <Widget>[
        TextButton(
            onPressed: () => {Navigator.of(context).pop(false)},
            child: const Text('Rejeitar')),
        TextButton(
            onPressed: () => {Navigator.of(context).pop(true)},
            child: const Text('Aceitar'))
      ],
    );
  }
}
