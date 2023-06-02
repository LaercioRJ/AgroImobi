import 'package:flutter/material.dart';

import '../widgets/text_divider.dart';

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
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 124, 124, 124),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 1)
                  )
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3,
                          right: MediaQuery.of(context).size.width * 0.77
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
                padding: const EdgeInsets.fromLTRB(0, 3, 0, 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Text(
                        'Fazenda com reserva natural',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'arial',
                          fontWeight: FontWeight.w500
                        ),
                      )
                    )
                  ],
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Column(
                      children: const [
                        Text(
                          'R\$ 300.000',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 23
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3),
                          child: Text(
                            '(COMPRA)',
                            style: TextStyle(
                              fontSize: 13
                            ),
                          ),
                        )
                      ]
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, bottom: 5),
                    child: Text(
                      '/',
                      style: TextStyle(
                        fontSize: 29,
                        color: Color.fromARGB(255, 0, 80, 0)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Column(
                      children: const [
                        Text(
                          'R\$ 300.000',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 23
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3),
                          child: Text(
                            '(arrendamento)',
                            style: TextStyle(
                              fontSize: 13
                            ),
                          ),
                        )
                      ]
                    ),
                  ),
                ],
              ) 
            ),
            const Expanded(
              child: SizedBox()
            ),
            const TextDivider(label: 'PROPRIEDADES'),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 3, right: 3),
                    child: Icon(
                      Icons.water,
                      size: 28,
                    ),  
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3, right: 3),
                    child: Icon(
                      Icons.pets,
                      size: 28,
                    ),  
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3, right: 3),
                    child: Icon(
                      Icons.bolt,
                      size: 28,
                    ),  
                  )
                ]
              ),
            ),
          ]
        )
      ),
    )
    );
  }
}
