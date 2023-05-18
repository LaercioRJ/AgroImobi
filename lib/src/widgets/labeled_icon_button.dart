import 'package:flutter/material.dart';

class LabeledIconButton extends StatefulWidget {
  final String label;
  final Widget icon;
  Color color;
  final VoidCallback pressedFunction;
  LabeledIconButton({
      Key? key,
      required this.label,
      required this.icon,
      required this.pressedFunction,
      required this.color
    }) : super(key: key);

  @override
  State<LabeledIconButton> createState() => _LabeledIconButtonState();
}

class _LabeledIconButtonState extends State<LabeledIconButton> {

  changeColor(Color color) {
    setState(() {
      widget.color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: IconButton(
            onPressed: ()  {
              widget.pressedFunction();
              changeColor(Colors.green);
            },
            color: widget.color,
            icon: widget.icon,
            style: IconButton.styleFrom(
              backgroundColor: Colors.white
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: widget.color)
          ),
        ),
        Text(
          widget.label,
          style: TextStyle(
            color: widget.color
          ),
        )
      ],
    );
  }
}
