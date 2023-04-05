import 'package:flutter/material.dart';

import '../../classes/user.dart';
import '../../widgets/go_back_link_button.dart';
import '../../widgets/submit_button.dart';

import '../../server_connection/server_interface.dart';

class RegisterUserScreen extends StatelessWidget {
  RegisterUserScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final RegExp emailValidator =
      RegExp("([A-Z | a-z | 0-9]+)@([A-Z | a-z | 0-9]+).com");

  User? userModel;
  late String name;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/src/assets/planoFundo.jpg"),
              fit: BoxFit.fill),
        ),
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 1.2,
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
                        labelText: 'Criar Senha',
                        border: UnderlineInputBorder()),
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
                      ServerInterface().registerInformation('okdeokd', user.toJson()).then((result) {
                        print(result);
                      });
                    },
                    formKey: _formKey,
                  ),
                  const GoBackLinkButton(linkText: 'Já possuo cadastro')
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
