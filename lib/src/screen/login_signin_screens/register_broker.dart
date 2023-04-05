import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../classes/broker.dart';
import '../../widgets/Dropdown.dart';
import '../../widgets/go_back_link_button.dart';
import '../../widgets/submit_button.dart';

import '../../server_connection/server_interface.dart';

import '../../server_connection/server_interface.dart';

class RegisterBrokerScreen extends StatefulWidget {
  RegisterBrokerScreen({super.key});

  @override
  State<RegisterBrokerScreen> createState() => _RegisterBrokerScreenState();
}

class _RegisterBrokerScreenState extends State<RegisterBrokerScreen> {
  final _formKey = GlobalKey<FormState>();

  final cellphoneMask = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final TextEditingController passwordController = TextEditingController();

  final RegExp emailValidator =
      RegExp("([A-Z | a-z | 0-9]+)@([A-Z | a-z | 0-9]+).com");

  Broker? userModel;

  late String nome;

  late String email;
  late String senha;
  TextEditingController telefone = TextEditingController();
  late String CRECI = "123456";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/src/assets/planoFundo.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 1, 20, 1),
                        child: Form(
                            key: _formKey,
                            child: Column(children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'Nome Completo',
                                    border: UnderlineInputBorder()),
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
                                    if (!emailValidator.hasMatch(value)) {
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
                                inputFormatters: [cellphoneMask],
                                controller: cellphone,
                              ),
                              TextFormField(
                                  decoration: const InputDecoration(
                                labelText: 'CRECI',
                                border: UnderlineInputBorder(),
                              )),
                              Container(
                                width: 10,
                                height: 10,
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Dropdown(),
                              ),
                              SubmitButton(
                                  title: "Cadastrar",
                                  pressedFunction: () {
                                    var broker = Broker(name, email, password, cellphone.text, creci);
                                    ServerInterface().registerInformation('jijij', broker.toJson()).then((result) {
                                      print(result);
                                    });
                                  },
                                  formKey: _formKey),
                              const GoBackLinkButton(
                                  linkText: 'Já possuo cadastro')
                            ])))))));
  }
}
