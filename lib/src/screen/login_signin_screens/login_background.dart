import 'package:flutter/material.dart';

import './login_screen.dart';

class LoginBackground extends StatelessWidget {
  final VoidCallback logIntoApp;
  const LoginBackground({super.key, required this.logIntoApp});
  

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
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.60,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 240, 240, 240),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 1, 20, 1),
              child: MaterialApp(
                home: LoginScreen(onTapped: logIntoApp),
                debugShowCheckedModeBanner: false
              )
            )
          )
        ),
      ));
  }
}
