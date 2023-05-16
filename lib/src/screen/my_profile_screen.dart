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
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _setDataFromJson();
  }

  void _setDataFromJson() async {
    var user = User('', '2@gmail.com', '');
    var getDados = await ServerInterface()
        .getUserInformation('http://localhost:3000/login/2@gmail.com', user);
    print('aqui voltou $getDados');

    var data = jsonDecode(getDados);
    var userData = data['response'][0];

    setState(() {
      _nameController.text = userData['Nome'];
      _emailController.text = userData['email'];
      _passwordController.text = userData['senha'];
    });
  }

  void _editData() {
    setState(() {
      _isEditing = true;
    });
  }

  void _saveData() {
    setState(() {
      _isEditing = false;
      var user = User(_nameController.text, _emailController.text,
          _passwordController.text);
      // Enviar os dados atualizados para a API
      ServerInterface().sendingInformation('URL_DA_API', user.toJson());
    });
  }

  void _cancelEdit() {
    setState(() {
      _isEditing = false;
      _setDataFromJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Nome"),
              enabled: _isEditing,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
              enabled: _isEditing,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Senha"),
              obscureText: !_isEditing,
              enabled: _isEditing,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text(_isEditing ? "Salvar" : "Editar"),
                  onPressed: _isEditing ? _saveData : _editData,
                ),
                if (_isEditing)
                  ElevatedButton(
                    child: Text("Cancelar"),
                    onPressed: _cancelEdit,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
