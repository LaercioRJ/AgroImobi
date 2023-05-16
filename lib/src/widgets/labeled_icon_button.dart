import 'package:flutter/material.dart';

class LabeledIconButton extends StatefulWidget {
  final String label;
  final Widget icon;
  final VoidCallback pressedFunction;
  const LabeledIconButton({
      Key? key,
      required this.label,
      required this.icon,
      required this.pressedFunction
    }) : super(key: key);

  @override
  State<LabeledIconButton> createState() => _LabeledIconButtonState();
}

class _LabeledIconButtonState extends State<LabeledIconButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: IconButton(
            onPressed: ()  {widget.pressedFunction();},
            color: Colors.black,
            icon: widget.icon,
            style: IconButton.styleFrom(
              backgroundColor: Colors.white
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Colors.black)
          ),
        ),
        Text(widget.label)
      ],
    );
  }
}
