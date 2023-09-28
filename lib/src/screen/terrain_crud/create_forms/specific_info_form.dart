import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../widgets/tutorial_card.dart';
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
  final List<String> characteristics = ['Lago', 'Energia', 'Casa'];
  final List<String> reliefs = [
    'Planice',
    'Montanhoso',
    'Pequenas Irregulariedades'
  ];
  final List<String> soils = ['Arenoso', 'Argiloso', 'Indiferente'];
  final List<String> applications = [
    'Cultivo',
    'Lazer',
    'Criação de Animais',
    'Outro'
  ];
  late var selectedChar = characteristics[0];

  List<String> selectedChars = [];
  late var selectedRelief = reliefs[0];
  late var selectedSoil = soils[0];
  late var selectedApplication = applications[0];
  var detailedApplicationVisible = false;
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Por favor, preencha este campo";
                                  }
                                  return null;
                                },
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
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: Icon(
                                          Icons.area_chart_rounded,
                                          color: Colors.green[600],
                                        ),
                                      ),
                                      Expanded(
                                          child: Dropdown(
                                        label: 'Relevo Predominante',
                                        list: reliefs,
                                        onSelect: (selected) =>
                                            {selectedRelief = selected},
                                      ))
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Icon(
                                        Icons.grass_sharp,
                                        color: Colors.green[600],
                                      ),
                                    ),
                                    Expanded(
                                        child: Dropdown(
                                      label: 'Tipo de Solo',
                                      list: soils,
                                      onSelect: (selected) =>
                                          {selectedSoil = selected},
                                    ))
                                  ],
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: TextDivider(label: 'Aplicação')),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.green[600],
                                      ),
                                    ),
                                    Expanded(
                                        child: Dropdown(
                                      label: 'Uso atual ou Melhor Aplicação',
                                      list: applications,
                                      onSelect: (selected) => {
                                        if (selected == 'Outro')
                                          {
                                            setState(() {
                                              detailedApplicationVisible = true;
                                            })
                                          }
                                        else if (selectedApplication != 'Outro')
                                          {
                                            setState(() {
                                              detailedApplicationVisible =
                                                  false;
                                            })
                                          },
                                        selectedApplication = selected,
                                      },
                                    ))
                                  ],
                                ),
                              ),
                              Visibility(
                                  visible: detailedApplicationVisible,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (detailedApplicationVisible &&
                                          (value == null || value.isEmpty)) {
                                        return "Por favor, preencha este cammpo";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        label: Text('Detalhamento'),
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.green))),
                                  )),
                              const Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: TextDivider(label: 'CARACTERÍSTICAS')),
                              if (selectedChars.isEmpty)
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Center(
                                    child: Text(
                                      'Por fravor, selecione pelo menos uma caracteristica',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 17),
                                    ),
                                  ),
                                ),
                              Row(children: [
                                Expanded(
                                    child: Dropdown(
                                        list: characteristics,
                                        label: 'Detalhes',
                                        onSelect: (value) => setState(() {
                                              selectedChar = value;
                                            }))),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    width: double.infinity,
                                    height: 60,
                                    child: ElevatedButton.icon(
                                      onPressed: () => {
                                        if (selectedChar != '' &&
                                            (selectedChars.lastIndexOf(
                                                    selectedChar) ==
                                                -1))
                                          {
                                            setState(() {
                                              selectedChars.add(selectedChar);
                                              selectedChar = '';
                                            }),
                                          }
                                      },
                                      label: const Text('Adicionar'),
                                      icon: const Icon(Icons.add_box),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green[400]),
                                    ),
                                  ),
                                )
                              ]),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Wrap(
                                  children: [
                                    for (var selected in selectedChars)
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: Chip(
                                            backgroundColor: Colors.green[200],
                                            label: Text(
                                              selected,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            onDeleted: () => {
                                              setState(() {
                                                selectedChars.remove(selected);
                                              })
                                            },
                                            deleteIcon: const Icon(
                                                Icons.delete_forever),
                                            deleteIconColor: Colors.red[500],
                                          ))
                                  ],
                                ),
                              ),
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
