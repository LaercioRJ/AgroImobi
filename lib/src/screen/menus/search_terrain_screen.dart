import 'package:flutter/material.dart';

import '../../widgets/terrain_card.dart';
import '../../widgets/twin_buttons.dart';

class SearchTerrainsScreen extends StatelessWidget {
  SearchTerrainsScreen({super.key});
  List<int> text = [1,2,3,4];
  bool rightActivated = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: const Color.fromARGB(255, 235, 235, 235),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              child: TwinButtons(
                titleLeft: 'Venda',
                titleRight: 'Arrendamento'
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              constraints: BoxConstraints(
               minHeight: MediaQuery.of(context).size.height * 0.90,
              ),
              color: const Color.fromARGB(255, 235, 235, 235),
              child: Wrap(
                children: [
                  for (var i in text)
                    const TerrainCard()
                ],
              ),
            ),
          ]
        )
      )
    );
  }
}
