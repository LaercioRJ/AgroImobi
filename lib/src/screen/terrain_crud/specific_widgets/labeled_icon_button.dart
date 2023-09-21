import 'package:flutter/material.dart';

class LabeledIconButton extends StatelessWidget {
  Color color;
  final String label;
  final Widget icon;
  bool disabled;
  final VoidCallback pressedFunction;
  LabeledIconButton(
      {Key? key,
      required this.label,
      required this.icon,
      required this.pressedFunction,
      required this.color,
      this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: IconButton(
            onPressed: () {
              if (!disabled) {
                pressedFunction();
              }
            },
            color: color,
            icon: icon,
            style: IconButton.styleFrom(backgroundColor: Colors.white),
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: color)),
        ),
        Text(
          label,
          style: TextStyle(color: color),
        )
      ],
    );
  }
}
