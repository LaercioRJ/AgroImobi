import 'package:flutter/material.dart';

import 'package:helloworld/src/classes/broker.dart';
import 'package:helloworld/src/widgets/dropdown.dart';
import 'package:helloworld/src/widgets/go_back_link_button.dart';
import 'package:helloworld/src/widgets/submit_button.dart';

import 'package:helloworld/src/service_classes/mask_validators.dart';
import 'package:helloworld/src/service_classes/regexp_validators.dart';

import 'package:helloworld/src/server_connection/server_interface.dart';

class RegisterBrokerScreen extends StatefulWidget {
  const RegisterBrokerScreen({super.key});

  @override
  State<RegisterBrokerScreen> createState() => _RegisterBrokerScreenState();
}

class _RegisterBrokerScreenState extends State<RegisterBrokerScreen> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String email;
  late String password;
  TextEditingController cellphone = TextEditingController();
  late String creci = "123456";
  late String cpf;
  List<String> statesList = ['SP', 'RJ', 'RS', 'PR', 'MG', 'SC'];
  String selectedState = 'SP';

  changeSelectedState(String newState) {
    selectedState = newState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        body: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome Completo', border: UnderlineInputBorder()),
                validator: (value) {
                  if (value != null) {
                    name = value;
                  }
                  if (value == null || value.isEmpty) {
                    return "Por favor, preencha este campo";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: UnderlineInputBorder(),
                ),
                validator: (value) {
                  if (value != null) {
                    email = value;
                  }
                  if (value == null || value.isEmpty) {
                    return 'Por favor, preencha este campo';
                  } else {
                    if (!RegExpValidators.emailValidator.hasMatch(value)) {
                      return "Este é um formato inválido de e-mail.";
                    }
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Criar Senha',
                  border: UnderlineInputBorder(),
                ),
                validator: (value) {
                  if (value != null) {
                    password = value;
                  }
                  if (value == null || value.isEmpty) {
                    return "Por favor, preencha este campo";
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirme a Senha',
                  border: UnderlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, preencha este campo";
                  } else {
                    if (value != password) {
                      return "Os campos de senha não são equivalentes.";
                    }
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Telefone Celular',
                  border: UnderlineInputBorder(),
                ),
                inputFormatters: [MaskValidators.cellphoneMask],
                controller: cellphone,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'CPF',
                  border: UnderlineInputBorder(),
                ),
                inputFormatters: [MaskValidators.cpfMask],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, preencha este campo";
                  } else {
                    if (value != password) {
                      return "Os campos de senha não são equivalentes.";
                    }
                  }
                  cpf = value;
                  return null;
                },
              ),
              TextFormField(
                  decoration: const InputDecoration(
                labelText: 'CRECI',
                border: UnderlineInputBorder(),
              )),
              const SizedBox(
                width: 10,
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Dropdown(
                    label: 'Estado',
                    list: statesList,
                    onSelect: changeSelectedState,
                  ),
                ),
              ),
              SubmitButton(
                  title: "Cadastrar",
                  pressedFunction: () {
                    var broker = Broker(name, email, password, cellphone.text,
                        selectedState, cpf);
                    ServerInterface()
                        .sendingInformation(
                            'http://localhost:3000/Corretor', broker.toJson())
                        .then((result) {
                      // what to do after user is registered
                    });
                  },
                  formKey: _formKey),
              const GoBackLinkButton(linkText: 'Já possuo cadastro')
            ])));
  }
}
