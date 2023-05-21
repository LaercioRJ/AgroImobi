import 'package:flutter/material.dart';

class BasicInfoForm extends StatefulWidget {
  final VoidCallback onSubmit;
  const BasicInfoForm({super.key, required this.onSubmit});

  @override
  State<BasicInfoForm> createState() => BasicInfoFormState();
}

class BasicInfoFormState extends State<BasicInfoForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(2, 5, 2, 0),
        child: Column(
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.80,
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [ 
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 5,
                      blurRadius: 7
                    )
                  ]
                ),
              ),
            )

            /*const Center(
              child: Text(
                'Primeiro Passo: Preencha as Informações Gerais do seu Anúncio',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20
                ),
              ) 
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 2),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: TextFormField(
                  decoration: const InputDecoration(
                    focusColor: Colors.green,
                    iconColor: Colors.green,
                    icon: Icon(Icons.title),
                    labelText: 'Título',
                    border: UnderlineInputBorder()
                  ),
                ),
              ) 
            )*/
          ],
        ),
      ),
    );
  }
}


 /*Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.fromLTRB(70, 18, 70, 18),
                        textStyle: const TextStyle(fontSize: 22)),
                      onPressed: () {
                        widget.onSubmit();
                      },
                      child: const Text('Enviar')),
                  ),
                ),
              ),
            )*/