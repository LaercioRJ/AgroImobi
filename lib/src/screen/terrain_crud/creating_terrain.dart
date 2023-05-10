import 'package:flutter/material.dart';

class CreatingTerrain extends StatefulWidget {
  final Function changeAction;
  const CreatingTerrain({super.key, required this.changeAction});

  @override
  State<CreatingTerrain> createState() => _CreatingTerrainState();
}

class _CreatingTerrainState extends State<CreatingTerrain> {
  Future<bool> _onBackPressed() {
    widget.changeAction("Visualizar");
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Anúncio'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 4, 2, 2),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      child: IconButton(
                        onPressed: () => print(''),
                        color: Colors.black,
                        icon: const Icon(Icons.add_business),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white
                        ),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.black)
                      ),
                    ),
                    const Text('Info Geral')
                  ],
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 2.0
                        )
                      )
                    ),
                  )
                ),
                Column(
                  children: [
                    Container(
                      child: IconButton(
                        onPressed: () => print(''),
                        color: Colors.black,
                        icon: const Icon(Icons.add_business),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white
                        ),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.black)
                      ),
                    ),
                    const Text('Info Geral')
                  ],
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 2.0
                        )
                      )
                    ),
                  )
                ),
                Column(
                  children: [
                    Container(
                      child: IconButton(
                        onPressed: () => print(''),
                        color: Colors.black,
                        icon: const Icon(Icons.add_business),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white
                        ),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.black)
                      ),
                    ),
                    const Text('Info Geral')
                  ],
                ),
              ],
            )
          )
        ],
      )
    );
  }
}
