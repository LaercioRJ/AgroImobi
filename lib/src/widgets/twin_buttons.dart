import 'package:flutter/material.dart';

class TwinButtons extends StatefulWidget {
  final String titleLeft;
  final String titleRight;

  const TwinButtons(
      {Key? key, required this.titleLeft, required this.titleRight})
      : super(key: key);

  @override
  TwinButtonsState createState() {
    return TwinButtonsState();
  }
}

class TwinButtonsState extends State<TwinButtons> {
  bool rightActivated = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
            onPressed: () => {setState(() => rightActivated = false)},
            style: OutlinedButton.styleFrom(
                backgroundColor: rightActivated
                    ? Colors.grey.shade300
                    : Colors.grey.shade100,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(17),
                        bottomLeft: Radius.circular(17),
                        topRight: Radius.zero,
                        bottomRight: Radius.zero))),
            child: Text(widget.titleLeft)),
        OutlinedButton(
            onPressed: () => {setState(() => rightActivated = true)},
            style: OutlinedButton.styleFrom(
                backgroundColor: rightActivated
                    ? Colors.grey.shade100
                    : Colors.grey.shade300,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        bottomLeft: Radius.zero,
                        topRight: Radius.circular(17),
                        bottomRight: Radius.circular(17)))),
            child: Text(widget.titleRight))
      ],
    );
  }
}
