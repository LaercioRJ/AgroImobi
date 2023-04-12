import 'package:flutter/material.dart';

class MyTerrainsScreen extends StatelessWidget {
  final Function changeAction;
  const MyTerrainsScreen({
    super.key, 
    required this.changeAction
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('My Terrains Screen'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeAction("Criar Anúncio");
        },
        child: const Icon(Icons.add, size: 30,),
        backgroundColor: Colors.green,
      ),
    );
  }
}
