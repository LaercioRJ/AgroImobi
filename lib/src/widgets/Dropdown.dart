import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final List<String> list;
  final String label;
  final void Function(String) onSelect;
  const Dropdown({
    Key? key,
    required this.list,
    required this.label,
    required this.onSelect
  }): super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  late String dropdownValue = widget.list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down),
      elevation: 16,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18
      ),
      decoration: InputDecoration(
        labelText: widget.label
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
