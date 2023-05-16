import 'package:flutter/material.dart';
import 'package:helloworld/src/classes/login.dart';

import 'package:helloworld/src/widgets/submit_button.dart';
import 'package:helloworld/src/widgets/link_button.dart';

import 'register_user.dart';
import 'register_broker.dart';

import 'package:helloworld/src/classes/message_deliver.dart';
import 'package:helloworld/src/server_connection/server_interface.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onTapped;

  const LoginScreen({super.key, required this.onTapped});

  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  RegExp emailValidator =
      RegExp("([A-Z | a-z | 0-9]+)@([A-Z | a-z | 0-9]+).com");

  Login? loginModel;
  late String email;
  late String senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(1, 0, 1, 8),
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.width * 0.35,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.lightBlue,
                            image: DecorationImage(
                                image:
                                    AssetImage("lib/src/assets/pom-pom.png"))),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: TextFormField(
                      /* validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, preencha este campo';
                        } else {
                          if (!emailValidator.hasMatch(value)) {
                            return "Este é um formato inválido de e-mail.";
                          }
                        }
                        email = value;
                        return null;
                      },*/
                      decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'Usuário',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))))),
                ),
                TextFormField(
                    /*validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, preencha este campo';
                      }
                      senha = value;
                      return null;
                    },*/
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.password),
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    )),
                SubmitButton(
                  title: 'Entrar',
                  pressedFunction: () async {
                    widget.onTapped();
                    /* var login = Login(email, senha, '');
                    ServerInterface()
                        .verifyInformation(
                            'http://localhost:3000/login/' + email,
                            login.toJson())
                        .then((result) {
                      if (result) {
                        widget.onTapped();
                      } else {
                        MessageDeliver().showSimpleMessage(
                            'Senha ou email incorretos.', context);
                      }
                    });*/
                  },
                  formKey: _formKey,
                ),
                LinkButton(
                    linkText: 'Primeiro Acesso',
                    linkedPage: RegisterUserScreen()),
                const LinkButton(
                    linkText: 'Primeiro Acesso CORRETOR',
                    linkedPage: RegisterBrokerScreen())
              ],
            )));
  }
}
