import 'package:flutter/material.dart';

class LinkButton extends StatefulWidget {
  final String linkText;
  final Widget linkedPage;
  const LinkButton({Key? key, required this.linkText, required this.linkedPage})
      : super(key: key);

  @override
  State<LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<LinkButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all(const Color(0xff222121))),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => widget.linkedPage,
          ));
        },
        child: Text(widget.linkText));
  }
}
