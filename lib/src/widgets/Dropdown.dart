import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['SP', 'RJ', 'AM', 'PR'];

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down),
      elevation: 16,
      style: const TextStyle(
          color: Color.fromARGB(255, 163, 162, 162), fontSize: 18),
      underline: Container(
        height: 2,
        color: Color.fromARGB(255, 188, 187, 187),
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
