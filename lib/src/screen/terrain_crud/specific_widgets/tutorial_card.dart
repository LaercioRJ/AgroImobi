import 'package:flutter/material.dart';

class TutorialCard extends StatefulWidget {
  List<String> tutorialMessages = [''];
  List<String> messages;
  TutorialCard({ super.key, required this.messages});

  @override
  State<TutorialCard> createState() => _TutorialCardState();
}

class _TutorialCardState extends State<TutorialCard> {
  var textIndex = 0;
  var visibleTutorial = true;

  @override
  initState() {
    widget.tutorialMessages = widget.messages;
    super.initState();
  }

  changeExhibitedText(int addIndex) {
    setState(() {
      textIndex = textIndex + addIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibleTutorial,
      child: Container(
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
          mainAxisAlignment: MainAxisAlignment.start,
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.tutorialMessages[textIndex],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 0, 0, 0)
                        ),
                      )
                    ],
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
                      backgroundColor: (textIndex != 0) ? Colors.green : Colors.grey,
                      child: IconButton(
                        disabledColor: Colors.blue,
                        onPressed: (textIndex != 0) ? () {
                          changeExhibitedText(-1);
                        } : null,
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
                        onPressed: () {
                          setState(() {
                            visibleTutorial = false;
                          });
                        },
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
                      backgroundColor: (textIndex != (widget.tutorialMessages.length -1)) ?
                        Colors.green : Colors.grey,
                      child: IconButton(
                        onPressed: (textIndex != (widget.tutorialMessages.length -1)) ? () {
                          changeExhibitedText(1);
                        } : null,
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
      )
    );
  }
}
