import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../specific_widgets/tutorial_card.dart';
import '../../../widgets/dropdown.dart';
import '../../../widgets/text_divider.dart';

import '../../../classes/terrain.dart';

class SpecificInfoForm extends StatefulWidget {
  final Function onSubmit;
  Terrain terrainReference;
  SpecificInfoForm(
      {super.key, required this.onSubmit, required this.terrainReference});

  @override
  State<SpecificInfoForm> createState() => SpecificInfoFormState();
}

class SpecificInfoFormState extends State<SpecificInfoForm> {
  final List<String> tutorialMessages = ['Olha aqui', 'Vem aqui'];
  final List<String> topographys = [
    'Planice',
    'Montanhoso',
    'Pequenas Irregulariedades'
  ];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Center(
              child: TutorialCard(
                  messages: tutorialMessages,
                  sPreferenceVariable: 'createTerrain2')),
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
                              offset: Offset(-2, 2))
                        ]),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 7),
                                child: Text(
                                  'Informações Específicas',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 9, 77, 0),
                                      fontSize: 22,
                                      fontFamily: 'arial'),
                                ),
                              ),
                              TextFormField(
                                maxLines: 5,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(50)
                                ],
                                decoration: InputDecoration(
                                    labelText: 'Descrição',
                                    fillColor: Colors.green,
                                    icon:
                                        const Icon(Icons.description_outlined),
                                    iconColor: Colors.green[600],
                                    focusColor: Colors.green,
                                    border: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Aptidão',
                                    fillColor: Colors.green,
                                    icon: const Icon(Icons.done_outline),
                                    iconColor: Colors.green[600],
                                    focusColor: Colors.green,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Dropdown(
                                  label: 'Tipo Predominante de Relevo',
                                  list: topographys,
                                  onSelect: (name) => {},
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: TextDivider(label: 'PROPRIEDADES')),
                              Center(
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 15, 0, 15),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: TextButton(
                                          style: TextButton.styleFrom(
                                              backgroundColor: Colors.green,
                                              foregroundColor: Colors.white,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      70, 18, 70, 18),
                                              textStyle: const TextStyle(
                                                  fontSize: 22)),
                                          onPressed: () {
                                            widget.onSubmit(
                                                2, widget.terrainReference);
                                          },
                                          child: const Text('Definir')),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))),
              ))
        ],
      ),
    );
  }
}
