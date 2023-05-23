import 'package:flutter/material.dart';

class TutorialCard extends StatefulWidget {
  const TutorialCard({ super.key });

  @override
  State<TutorialCard> createState() => _TutorialCardState();
}

class _TutorialCardState extends State<TutorialCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: 220,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 245, 245, 245),
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 12, 5),
            child: Center(
              child: Text(
                'TUTORIAL',
                style: TextStyle(
                  color: Color.fromARGB(255, 9, 77, 0),
                  fontSize: 22,
                  fontFamily: 'arial'
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Center(
              child: Container(
                width: double.infinity,
                height: 120,
                child: const Text(
                  'Exemplo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    color: Color.fromARGB(255, 0, 0, 0)
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.pink[200]
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete_forever,
                        color: Colors.white,
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ),
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
