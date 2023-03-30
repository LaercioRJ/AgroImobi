import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../widgets/go_back_link_button.dart';
import '../../widgets/submit_button.dart';

class RegisterBrokerScreen extends StatelessWidget {
  RegisterBrokerScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final cellphoneMask = MaskTextInputFormatter(
    mask: '(##) #####-####', 
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy
  );

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
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 1.3,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 1, 20, 1),
                        child:
                          Form(
                            key: _formKey,
                            child: Column(children: [
                              TextFormField(
                                decoration: const  InputDecoration(
                                  labelText: 'Nome Completo',
                                  border: UnderlineInputBorder())),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  border: UnderlineInputBorder(),
                                )),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Nome de Usuário',
                                  border: UnderlineInputBorder(),
                                )),
                              TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: 'Criar Senha',
                                  border: UnderlineInputBorder(),
                                )),
                              TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: 'Confirme a Senha',
                                  border: UnderlineInputBorder(),
                                )),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Telefone Celular',
                                  border: UnderlineInputBorder(),
                                ),
                                inputFormatters: [cellphoneMask],),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'CRECI',
                                  border: UnderlineInputBorder(),
                                )),
                              SubmitButton(
                                title: "Cadastrar",
                                pressedFunction: () => print('teste'),
                                formKey: _formKey),
                              const GoBackLinkButton(linkText: 'Já possuo cadastro')
                        ])
                          ) )))));
  }
}
