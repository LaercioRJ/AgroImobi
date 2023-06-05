import 'package:flutter/material.dart';

import '../widgets/text_divider.dart';

import '../classes/terrain.dart';

class TerrainCard extends StatefulWidget {
  final Function selectTerrain;
  final Terrain terrain;
  const TerrainCard({
    super.key,
    required this.selectTerrain,
    required this.terrain
  });

  @override
  State<TerrainCard> createState() => _TerrainCardState();
}

class _TerrainCardState extends State<TerrainCard> {

  var imageIndex = 0;
  List<Widget> featuresList = [];

  getFeatureIcon(String feature) {
    switch (feature) {
      case 'agua':
        return Icons.water;
      case 'eletricidade':
        return Icons.bolt_sharp;
      case 'casa':
        return Icons.home;
    }
  }

  @override
  void initState() {
    Widget featureIcon;

    for (var i = 0; i < widget.terrain.features.length; i++) {
      featureIcon = Padding(
        padding: const EdgeInsets.only(left: 4, right: 4),
        child: Icon(
          getFeatureIcon(widget.terrain.features[i]),
          size: 28,
        ), 
      );
      featuresList.add(featureIcon);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      child: InkWell(
        onTap: () {
          widget.selectTerrain(1);
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.terrain.photos[imageIndex]),
                    fit: BoxFit.cover
                  ),
                  boxShadow: const [
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
                          padding: const EdgeInsets.only(left: 5),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (imageIndex == 0) {
                                  imageIndex = (widget.terrain.photos.length - 1);
                                } else {
                                  imageIndex = imageIndex - 1;
                                }
                              });
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.07,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(85, 182, 182, 182)
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black
                                ),
                              )
                            ),
                          )
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (imageIndex == (widget.terrain.photos.length - 1)) {
                                  imageIndex = 0;
                                } else {
                                  imageIndex = imageIndex + 1;
                                }
                              });
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.07,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(85, 182, 182, 182)
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
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
                        child: Text(
                          widget.terrain.title,
                          style: const TextStyle(
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
                        children: [
                          Text(
                            'R\$ ' + widget.terrain.sellPrice.toString(),
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 23
                            ),
                          ),
                          const Padding(
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
                        children: [
                          Text(
                            'R\$ ' + widget.terrain.rentPrice.toString(),
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 23
                            ),
                          ),
                          const Padding(
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
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: featuresList
                  ),
                )
              ),
            ]
          )
        ),
      )
    );
  }
}
