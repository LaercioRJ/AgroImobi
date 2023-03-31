import 'package:flutter/material.dart';

class TerrainCard extends StatelessWidget {
  const TerrainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.19,
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(17)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 1
            )
          ]
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.11,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(17),
                  topRight: Radius.circular(17)
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(0.1),
              child: Text(
                'Titulo do terreno.',
                style: TextStyle(
                  fontSize: 15
                ),
              ),
            )
          ])
      ),
    );
  }
}
