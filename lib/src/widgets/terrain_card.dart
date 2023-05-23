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
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      child: InkWell(
        onTap: () {
          selectTerrain(1);
        },
        child: Container(
        width: MediaQuery.of(context).size.width * 0.94,
        height: MediaQuery.of(context).size.height * 0.445,
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 90, 90, 90),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(-2, 2)
            )
          ]
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.94,
              height: MediaQuery.of(context).size.height * 0.22,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/src/assets/terrain.jpg"),
                  fit: BoxFit.cover
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3,
                          right: MediaQuery.of(context).size.width * 0.79
                        ),
                        child: InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.07,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(65, 219, 219, 219)
                            ),
                          ),
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.07,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(65, 219, 219, 219)
                            ),
                          ),
                        )
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.1),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const Text(
                        'Fazenda com reserva natural',
                        style: TextStyle(
                          fontSize: 120
                        ),
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
