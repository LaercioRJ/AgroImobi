import 'package:flutter/material.dart';

import '../my_profile_screen.dart';

class DrawerMenu extends StatelessWidget {
  final Function changeScreen;

  const DrawerMenu({super.key, required this.changeScreen});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.manage_search),
            title: const Text('Buscar Anúncios'),
            onTap: () {
              changeScreen("Buscar Anúncios");
            },
          ),
          ListTile(
            leading: const Icon(Icons.badge),
            title: const Text('Meus Anúncios'),
            onTap: () {
              changeScreen("Meus Anúncios");
            },
          ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Meus Favoritos'),
              onTap: () {
                changeScreen("Anúncios Favoritos");
              }),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Meu Perfil'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyProfileScreen()));
            },
          ),
          const ListTile(
              leading: Icon(Icons.settings), title: Text('Settings')),
        ],
      ),
    );
  }
}
