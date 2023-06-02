import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String label;
  const TextDivider({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1, right: 1),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 0, 68, 4),
                    width: 2.0
                  )
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2, right: 2),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 0, 68, 4),
                    width: 2.0
                  )
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
