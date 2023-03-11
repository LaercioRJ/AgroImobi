import 'package:flutter/material.dart';

import '../../widgets/submit_button.dart';
import '../../widgets/link_button.dart';
import 'register_user.dart';
import 'register_broker.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback onTapped;

  LoginScreen({
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.green),
      child: Center(
          child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.8,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 1, 20, 1),
          child: Column(
            children: [
              const TextField(
                  decoration: InputDecoration(
                      labelText: 'Usuário', border: UnderlineInputBorder())),
              const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: UnderlineInputBorder(),
                  )),
              SubmitButton(title: 'Entrar', pressedFunction: onTapped),
              /*const LinkButton(linkText: 'Esqueceu a Senha'),*/
              LinkButton(
                  linkText: 'Primeiro Acesso',
                  linkedPage: RegisterUserScreen()),
              LinkButton(
                  linkText: 'Primeiro Acesso CORRETOR',
                  linkedPage:
                      RegisterBrokerScreen()) //const LinkButton(linkText: 'Primeiro Acesso CORRETOR')
            ],
          ),
        ),
      )),
    ));
  }
}
