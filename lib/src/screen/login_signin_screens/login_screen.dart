import 'package:flutter/material.dart';

import '../../widgets/submit_button.dart';
import '../../widgets/link_button.dart';

import 'register_user.dart';
import 'register_broker.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onTapped;

  LoginScreen({super.key, required this.onTapped});

  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.green,
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
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.9,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 1, 20, 1),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, preencha este campo';
                        }
                      },
                      decoration: const InputDecoration(
                          labelText: 'Usuário',
                          border: UnderlineInputBorder())),
                  TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, preencha este campo';
                        }
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        border: UnderlineInputBorder(),
                      )),
                  SubmitButton(
                    title: 'Entrar',
                    pressedFunction: widget.onTapped,
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
