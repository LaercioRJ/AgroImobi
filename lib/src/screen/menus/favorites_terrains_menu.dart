import 'package:flutter/material.dart';

import '../../widgets/terrain_card.dart';

class FavoritesTerrainsScreen extends StatelessWidget {
  const FavoritesTerrainsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //List<int> text = [1,2,3,4];

    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      body: TerrainCard(),
    );
  }
}
