import 'package:flutter/material.dart';

class VisualizeTerrain extends StatelessWidget {
  final Function setTerrainId;
  const VisualizeTerrain({
    super.key,
    required this.setTerrainId
  });

  Future<bool> _onBackPressed() {
    setTerrainId(-1);
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
           title: const Text('Novo Anúncio')
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.33,
          child: PageView(
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            physics: const BouncingScrollPhysics(),
            children: [
              Image.asset("lib/src/assets/diablo0.jpg", fit: BoxFit.cover),
              Image.asset("lib/src/assets/diablo1.jpg", fit: BoxFit.cover),
              Image.asset("lib/src/assets/diablo2.jpg", fit: BoxFit.cover),
              Image.asset("lib/src/assets/diablo3.jpg", fit: BoxFit.cover),
              Image.asset("lib/src/assets/diablo4.jpg", fit: BoxFit.cover)
            ],
          )
        )
      )
    );
  }
}
