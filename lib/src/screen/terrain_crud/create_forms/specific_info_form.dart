import 'package:flutter/material.dart';

import '../specific_widgets/tutorial_card.dart';

import '../../../classes/terrain.dart';

class SpecificInfoForm extends StatefulWidget {
  final Function onSubmit;
  Terrain terrainReference;
  SpecificInfoForm({super.key, required this.onSubmit, required this.terrainReference});

  @override
  State<SpecificInfoForm> createState() => SpecificInfoFormState();
}

class SpecificInfoFormState extends State<SpecificInfoForm> {
  final List<String> tutorialMessages = ['Olha aqui', 'Vem aqui'];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(2, 15, 2, 0),
        child: Column(
          children: [
            Center(
              child: TutorialCard(messages: tutorialMessages)
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 7),
                            child: Text(
                              'Informações Gerais',
                              style: TextStyle(
                                color: Color.fromARGB(255, 9, 77, 0),
                                fontSize: 22,
                                fontFamily: 'arial'
                              ),
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.fromLTRB(70, 18, 70, 18),
                                      textStyle: const TextStyle(fontSize: 22)),
                                    onPressed: () {
                                      widget.onSubmit(2, widget.terrainReference);
                                    },
                                    child: const Text('Definir')
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  )
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}

/*Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.15,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.fromLTRB(70, 18, 70, 18),
                textStyle: const TextStyle(fontSize: 22)),
              onPressed: () {
                widget.onSubmit(2, widget.terrainReference);
              },
              child: const Text('Enviar')),
          ),
        ),
      ),
    );*/