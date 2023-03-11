import 'package:flutter/material.dart';

import '../../widgets/go_back_link_button.dart';

class RegisterUserScreen extends StatelessWidget {
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
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 1.2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 1, 20, 1),
              child: Column(children: [
                const TextField(
                    decoration: InputDecoration(
                        labelText: 'Nome Completo',
                        border: UnderlineInputBorder())),
                const TextField(
                    decoration: InputDecoration(
                  labelText: 'Email',
                  border: UnderlineInputBorder(),
                )),
                const TextField(
                    decoration: InputDecoration(
                  labelText: 'Nome de Usuário',
                  border: UnderlineInputBorder(),
                )),
                const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Criar Senha',
                      border: UnderlineInputBorder(),
                    )),
                const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirme a Senha',
                      border: UnderlineInputBorder(),
                    )),
                const TextField(
                    decoration: InputDecoration(
                  labelText: 'Telefone Celular',
                  border: UnderlineInputBorder(),
                )),
                const GoBackLinkButton(linkText: 'Já possuo cadastro')
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
