import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../specific_widgets/tutorial_card.dart';

import '../../../widgets/dropdown.dart';
import '../../../widgets/text_divider.dart';

import '../../../classes/terrain.dart';

class BasicInfoForm extends StatefulWidget {
  final Function onSubmit;
  Terrain terrainReference;
  BasicInfoForm({
    super.key,
    required this.onSubmit,
    required this.terrainReference
  });

  @override
  State<BasicInfoForm> createState() => BasicInfoFormState();
}

class BasicInfoFormState extends State<BasicInfoForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> metricUnits = ['Hectar', 'Metros Qd.', 'Km Qd.'];
  final List<String> states = ['SP', 'SC', 'RS', 'MG'];
  final List<String> cities = ['Sorocaba', 'Bauru', 'Ribeirão Pt.'];
  final List<String> tutorialMessages = ['Seja bem-vindo', 'Olhe o que tem de bom!'];
  bool sellOption = false;
  bool rentOption = false;
  late String title;
  late double sellPrice;
  late double rentPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
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
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(25)
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Por favor, preencha este campo";
                            } 
                            title = value;
                            return null;
                          },
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
                        Row(
                          children:[
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  labelText: 'Area Total',
                                  icon: const Icon(Icons.crop),
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
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Dropdown(
                                  label: 'Uni. Medida',
                                  list: metricUnits,
                                  onSelect: (name) => {}
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 13, top: 5),
                                child: Icon(
                                  Icons.map,
                                  color: Colors.green[600],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.20,
                                child: Dropdown(
                                  label: 'Estado',
                                  list: states,
                                  onSelect: (name) => {},
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Dropdown(
                                    label: 'Cidade',
                                    list: cities,
                                    onSelect: (name) => {},
                                  ),
                                )
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 10),
                          child: TextDivider(label: 'TIPO TRANSAÇÃO'),
                        ),
                        if (!(sellOption || rentOption))
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Center(
                              child: Text(
                                'Por fravor, selecione uma transação',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 17
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                activeColor: Colors.green,
                                checkColor: Colors.white,
                                value: sellOption,
                                onChanged: (bool? value) {
                                  setState(() {
                                    sellOption = value!;
                                  });
                                }
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 5, right: 20),
                                child: Text('Vender'),
                              ),
                              Checkbox(
                                activeColor: Colors.green,
                                checkColor: Colors.white,
                                value: rentOption,
                                onChanged: (bool? value) {
                                  setState(() {
                                    rentOption = value!;
                                  });
                                }
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text('Arrendar'),
                              )
                            ] 
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (value) {
                              if (sellOption) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, preencha este campo';
                                }
                                sellPrice = double.parse(value);
                              }
                              return null;
                            },
                            enabled: sellOption,
                            decoration: InputDecoration(
                              labelText: 'Valor Venda',
                              icon: const Icon(Icons.attach_money),
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (value) {
                              if (rentOption) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, preencha este campo';
                                }
                                rentPrice = double.parse(value);
                              }
                              return null;
                            },
                            enabled: rentOption,
                            decoration: InputDecoration(
                              labelText: 'Valor Arrendamento',
                              icon: const Icon(Icons.paid),
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
                                    if (_formKey.currentState!.validate() && (sellOption || rentOption)) {
                                      widget.onSubmit(1, widget.terrainReference);
                                    }
                                  },
                                  child: const Text('Definir')),
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
      )
    );
  }
}
