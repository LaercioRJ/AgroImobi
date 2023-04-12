import 'package:flutter/material.dart';

class CreatingTerrain extends StatelessWidget {
  final Function changeAction;
  const CreatingTerrain({
    super.key,
    required this.changeAction
  });

  Future<bool> _onBackPressed() {
    changeAction("Visualizar");
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
           title: const Text('Novo Anúncio')
        ),
        body: const Center(
          child: Text('Criar Terrenos')
        ),
      )
    );
  }
}
