import 'package:flutter/material.dart';

class PhotoForm extends StatefulWidget {
  final VoidCallback onSubmit;
  const PhotoForm({super.key, required this.onSubmit});

  @override
  State<PhotoForm> createState() => PhotoFormState();
}

class PhotoFormState extends State<PhotoForm> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.15,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.fromLTRB(70, 18, 70, 18),
                textStyle: const TextStyle(fontSize: 22)),
              onPressed: () {
                widget.onSubmit();
              },
              child: const Text('Enviar')),
          ),
        ),
      ),
    );
  }
}