import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final List<String> list;
  final void Function(String) onSelect;
  const Dropdown({Key? key, required this.list, required this.onSelect}): super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  late String dropdownValue = widget.list.first;

  changeDropDown() {

  }

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
        color: const Color.fromARGB(255, 188, 187, 187),
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
        widget.onSelect(value!);
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
