import 'dart:convert';
import 'package:flutter/material.dart';
import '../server_connection/server_interface.dart';
import '../classes/user.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  bool _isEditing = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _setDataFromJson();
    super.initState();
  }

  void _setDataFromJson() async {
    var user = User('', '1@1.com', '');
    var getDados = await ServerInterface()
        .getUserInformation('http://localhost:3000/login/1@1.com', user);

    print('aqui voltou');

    var data = jsonDecode(getDados);
    var userData = data['response'][0];

    setState(() {
      _nameController.text = userData['Nome'];
      _emailController.text = userData['email'];
      _passwordController.text = userData['senha'];
    });
  }

  void _editar() {
    setState(() {
      _isEditing = true;
    });
  }

  void _saveData() {
    setState(() {
      _isEditing = false;
      var user = User(_nameController.text, _emailController.text,
          _passwordController.text);

      //erverInterface().sendingInformation('http://localhost:3000/login/', user.toJson());
    });
  }

  void _cancelar() {
    setState(() {
      _isEditing = false;
      _setDataFromJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Nome"),
              enabled: _isEditing,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
              enabled: _isEditing,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text(_isEditing ? "Salvar" : "Editar"),
                  onPressed: _isEditing ? _saveData : _editar,
                ),
                if (_isEditing)
                  ElevatedButton(
                    child: const Text("Cancelar"),
                    onPressed: _cancelar,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
