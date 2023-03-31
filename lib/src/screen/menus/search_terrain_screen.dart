import 'package:flutter/material.dart';

import '../../widgets/twin_buttons.dart';

class SearchTerrainsScreen extends StatelessWidget {
  SearchTerrainsScreen({super.key});
  bool rightActivated = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          )
        ],
      )
    );
  }
}
