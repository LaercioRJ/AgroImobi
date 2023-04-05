import 'package:flutter/material.dart';
import 'package:helloworld/src/classes/login.dart';

import '../../widgets/submit_button.dart';
import '../../widgets/link_button.dart';

import 'register_user.dart';
import 'register_broker.dart';

import '../../classes/message_deliver.dart';

import '../../server_connection/server_interface.dart';

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

  final Color _mainColor = const Color(0xFF1C9F23);

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
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        width: MediaQuery.of(context).size.width * 0.55,
        height: MediaQuery.of(context).size.height * 0.55,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 1, 20, 1),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                        color: _mainColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
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
                      decoration: const InputDecoration(
                          labelText: 'Usuário',
                          border: UnderlineInputBorder())),
                  TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, preencha este campo';
                        }
                        senha = value;
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        border: UnderlineInputBorder(),
                      )),
                  SubmitButton(
                    title: 'Entrar',
                    pressedFunction: () async {
                      var login = Login(email, senha);
                      ServerInterface().verifyInformation('dcdc', login.toJson()).then((result) {
                        if (result) {
                          widget.onTapped();
                        } else {
                          MessageDeliver().showSimpleMessage('Senha ou email incorretos.', context);
                        }
                      });
                    },
                    formKey: _formKey,
                  ),
                  LinkButton(
                      linkText: 'Primeiro Acesso',
                      linkedPage: RegisterUserScreen()),
                  LinkButton(
                      linkText: 'Primeiro Acesso CORRETOR',
                      linkedPage: RegisterBrokerScreen())
                ],
              )),
        ),
      )),
    ));
  }
}
