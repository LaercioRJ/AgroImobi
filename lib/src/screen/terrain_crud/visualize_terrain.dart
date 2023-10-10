import 'package:flutter/material.dart';

import '../image_visualization.dart';

class VisualizeTerrain extends StatelessWidget {
  final Function setTerrainId;
  final pageController = PageController(initialPage: 0, viewportFraction: 1);
  VisualizeTerrain({super.key, required this.setTerrainId});

  final images = [
    "lib/src/assets/diablo0.jpg",
    "lib/src/assets/diablo1.jpg",
    "lib/src/assets/diablo2.jpg",
    "lib/src/assets/diablo3.jpg",
    "lib/src/assets/diablo0.jpg"
  ];

  Future<bool> _onBackPressed() {
    setTerrainId(-1);
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
            appBar: AppBar(title: const Text('Novo Anúncio')),
            body: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.33,
                child: GestureDetector(
                  onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ImageVisualization(
                              images: images,
                            )))
                  },
                  child: PageView(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      for (var image in images)
                        Image.asset(image, fit: BoxFit.cover),
                    ],
                  ),
                ))));
  }
}
