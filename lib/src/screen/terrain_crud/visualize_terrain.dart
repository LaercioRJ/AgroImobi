import 'package:flutter/material.dart';

class VisualizeTerrain extends StatelessWidget {
  final Function setTerrainId;
  const VisualizeTerrain({
    super.key,
    required this.setTerrainId
  });

  Future<bool> _onBackPressed() {
    setTerrainId(-1);
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('Visualizar Terrenos.'),
        ),
      ) 
    );
  }
}
