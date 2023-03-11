import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  final String title;
  VoidCallback pressedFunction;
  GlobalKey<FormState> formKey;

  SubmitButton(
      {Key? key,
      required this.title,
      required this.pressedFunction,
      required this.formKey})
      : super(key: key);

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.fromLTRB(70, 18, 70, 18),
                textStyle: const TextStyle(fontSize: 22)),
            onPressed: () {
              if (widget.formKey.currentState!.validate()) {
                widget.pressedFunction();
              }
            },
            child: Text(widget.title)),
      ),
    );
  }
}
