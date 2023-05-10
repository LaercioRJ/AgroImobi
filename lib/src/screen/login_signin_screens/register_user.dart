import 'package:flutter/material.dart';

import 'package:helloworld/src/classes/user.dart';
import 'package:helloworld/src/widgets/go_back_link_button.dart';
import 'package:helloworld/src/widgets/submit_button.dart';

import 'package:helloworld/src/server_connection/server_interface.dart';

class RegisterUserScreen extends StatelessWidget {
  RegisterUserScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final RegExp emailValidator =
      RegExp("([A-Z | a-z | 0-9]+)@([A-Z | a-z | 0-9]+).com");
  late final String name;
  late final String email;
  late final String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 1, 0, 5),
                child: Text(
                  'Seja bem-vindo! Cadastre-se aqui para usar o app.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 19, 122, 25),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Nome Completo', border: UnderlineInputBorder()),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Por favor, preencha este campo";
                }
                name = value;
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Email', border: UnderlineInputBorder()),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, preencha este campo';
                } else {
                  if (!emailValidator.hasMatch(value)) {
                    return "Este é um formato inválido de e-mail.";
                  }
                }
                email = value;
                return null;
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: 'Criar Senha', border: UnderlineInputBorder()),
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Por favor, preencha este campo";
                }
                password = value;
                return null;
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: 'Confirme a Senha',
                  border: UnderlineInputBorder()),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Por favor, preencha este campo";
                } else {
                  if (value != passwordController.text) {
                    return "Os campos de senha não são equivalentes.";
                  }
                }
                return null;
              },
            ),
            SubmitButton(
              title: 'Cadastrar',
              pressedFunction: () {
                var user = User(name, email, password);
                ServerInterface()
                    .sendingInformation(
                        'http://localhost:3000/login', user.toJson())
                    .then((result) {});
              },
              formKey: _formKey,
            ),
            const GoBackLinkButton(linkText: 'Já possuo cadastro')
          ]),
        ));
  }
}
