import 'package:flutter/material.dart';

import '../image_visualization.dart';

import '../../classes/terrain.dart';

class VisualizeTerrain extends StatefulWidget {
  final Function setTerrainId;
  const VisualizeTerrain({super.key, required this.setTerrainId});

  @override
  State<StatefulWidget> createState() => _VisualizeTerrainState();
}

class _VisualizeTerrainState extends State<VisualizeTerrain>
    with SingleTickerProviderStateMixin {
  final pageController = PageController(initialPage: 0, viewportFraction: 1);
  late AnimationController controller;
  late Animation<int> descriptionAnimationWrite;
  late Animation<double> descriptionAnimationFade;

  final Terrain terrain = Terrain(
      1,
      'Fazenda com reserva natural',
      true,
      true,
      200000,
      5000,
      5000,
      'Hectare',
      '',
      'Bauru',
      'SP',
      'Planice',
      1,
      '',
      [
        "lib/src/assets/diablo0.jpg",
        "lib/src/assets/diablo1.jpg",
        "lib/src/assets/diablo2.jpg",
        "lib/src/assets/diablo3.jpg",
        "lib/src/assets/diablo0.jpg"
      ],
      ['eletricidade', 'casa', 'agua'],
      '',
      "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      '',
      '');

  Future<bool> _onBackPressed() {
    widget.setTerrainId(-1);
    return Future.value(true);
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    descriptionAnimationWrite =
        IntTween(begin: 119, end: 160).animate(controller);

    descriptionAnimationFade =
        Tween<double>(begin: 1.0, end: 0).animate(controller);

    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          appBar: AppBar(title: const Text('Novo Anúncio')),
          body: Column(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.33,
                  child: GestureDetector(
                      onTap: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ImageVisualization(
                                      images: terrain.photos,
                                    )))
                          },
                      child: Stack(
                        children: [
                          PageView(
                            controller: pageController,
                            scrollDirection: Axis.horizontal,
                            pageSnapping: true,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              for (var image in terrain.photos)
                                Image.asset(image, fit: BoxFit.cover),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.29),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.04,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                    Colors.white.withOpacity(0),
                                    Colors.white
                                  ])),
                            ),
                          )
                        ],
                      ))),
              SizedBox(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10),
                    child: Text(
                      terrain.title,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15),
                  child: InkWell(
                    onTap: () => {controller.forward()},
                    child: RichText(
                        text: TextSpan(
                            text: " " +
                                (terrain.descricao.length > 120
                                    ? terrain.descricao.substring(
                                        0, descriptionAnimationWrite.value)
                                    : terrain.descricao),
                            style: const TextStyle(fontSize: 14),
                            children: <TextSpan>[
                          TextSpan(
                              text: "... ",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(
                                      descriptionAnimationFade.value))),
                          TextSpan(
                              text: "expandir>>",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  color: Colors.green.shade500.withOpacity(
                                      descriptionAnimationFade.value)))
                        ])),
                  ))
            ],
          ),
        ));
  }
}
