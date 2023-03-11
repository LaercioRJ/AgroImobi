import 'package:flutter/material.dart';

class GoBackLinkButton extends StatefulWidget {
  final String linkText;
  const GoBackLinkButton({Key? key, required this.linkText}) : super(key: key);

  @override
  State<GoBackLinkButton> createState() => _GoBackLinkButtonState();
}

class _GoBackLinkButtonState extends State<GoBackLinkButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all(const Color(0xff222121))),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(widget.linkText));
  }
}
