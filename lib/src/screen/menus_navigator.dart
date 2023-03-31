import 'package:flutter/material.dart';

import 'menus/favorites_terrains_menu.dart';
import 'menus/my_terrains_menu.dart';
import 'menus/search_terrain_screen.dart';

class MenusNavigator extends StatelessWidget {
  final String menuType;

  const MenusNavigator({ super.key, required this.menuType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Navigator(
      pages: [
        MaterialPage(
          key: const ValueKey('Search Terrain Menu'),
          child: Scaffold(body: SearchTerrainsScreen()),
        ),
        if (menuType == "Meus Anúncios")
          const MaterialPage(
              key: ValueKey('My Terrains Menu'),
              child: Scaffold(
                body: MyTerrainsScreen(),
              ))
        else if (menuType == "Anúncios Favoritos")
          const MaterialPage(
              key: ValueKey('My Favorites Terrains'),
              child: Scaffold(
                body: FavoritesTerrainsScreen(),
              ))
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        return true;
      },
    ));
  }
}
