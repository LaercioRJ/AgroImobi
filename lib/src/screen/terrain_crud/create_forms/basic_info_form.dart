import 'package:flutter/material.dart';

import '../specific_widgets/tutorial_card.dart';

class BasicInfoForm extends StatefulWidget {
  final VoidCallback onSubmit;
  const BasicInfoForm({super.key, required this.onSubmit});

  @override
  State<BasicInfoForm> createState() => BasicInfoFormState();
}

class BasicInfoFormState extends State<BasicInfoForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(2, 15, 2, 0),
        child: Column(
          children: [
            const Center(
              child: TutorialCard(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: 250,
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
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Título',
                            icon: const Icon(Icons.title),
                            iconColor: Colors.green[600],
                            fillColor: Colors.green,
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green
                              )
                            ),
                            focusColor: Colors.green
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Título',
                              icon: const Icon(Icons.title),
                              iconColor: Colors.green[600],
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green
                                )
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green
                                )
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green
                                )
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ),
              )
            )
            /*const Center(
              child: Text(
                'Primeiro Passo: Preencha as Informações Gerais do seu Anúncio',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20
                ),
              ) 
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 2),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: TextFormField(
                  decoration: const InputDecoration(
                    focusColor: Colors.green,
                    iconColor: Colors.green,
                    icon: Icon(Icons.title),
                    labelText: 'Título',
                    border: UnderlineInputBorder()
                  ),
                ),
              ) 
            )*/
          ],
        ),
      ),
    );
  }
}


 /*Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
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
                        widget.onSubmit();
                      },
                      child: const Text('Enviar')),
                  ),
                ),
              ),
            )*/