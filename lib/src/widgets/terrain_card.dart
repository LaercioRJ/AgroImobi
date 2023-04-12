import 'package:flutter/material.dart';

class TerrainCard extends StatelessWidget {
  final Function selectTerrain;
  const TerrainCard({
    super.key,
    required this.selectTerrain
  });

  final double price = 300000.90;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
      child: InkWell(
        onTap: () {
          selectTerrain(1);
        },
        child: Container(
        width: MediaQuery.of(context).size.width * 0.445,
        height: MediaQuery.of(context).size.height * 0.4,
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
              width: MediaQuery.of(context).size.width * 0.4425,
              height: MediaQuery.of(context).size.height * 0.22,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/src/assets/terrain.jpg"),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(17),
                  topRight: Radius.circular(17)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.1),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: const Text(
                        'Fazenda com reserva natural',
                        style: TextStyle(fontSize: 16),  
                      )
                    )
                  ],
                ),
              )
            )
          ])
        ),
      )
    );
  }
}
