import 'package:flutter/material.dart';

class ImageVisualization extends StatelessWidget {
  final List<String> images;

  const ImageVisualization({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Visualizacao",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green.withOpacity(0),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: PageView(
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              physics: const BouncingScrollPhysics(),
              children: [
                for (var image in images)
                  Image.asset(image, fit: BoxFit.contain)
              ],
            ),
          )
        ],
      ),
    );
  }
}
