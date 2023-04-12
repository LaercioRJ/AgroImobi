import 'package:flutter/material.dart';

import 'favorites_terrains_menu.dart';
import 'my_terrains_menu.dart';
import 'search_terrain_screen.dart';

class MenusNavigator extends StatelessWidget {
  final String menuType;
  final Function selectTerrain;
  final Function changeAction;

  const MenusNavigator({ 
    super.key,
    required this.menuType,
    required this.selectTerrain,
    required this.changeAction
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Navigator(
      pages: [
        MaterialPage(
          key: const ValueKey('Search Terrain Menu'),
          child: Scaffold(
            body: SearchTerrainsScreen(selectTerrain: selectTerrain)
          ),
        ),
        if (menuType == "Meus Anúncios")
          MaterialPage(
            key: const ValueKey('My Terrains Menu'),
            child: Scaffold(
              body: MyTerrainsScreen(changeAction: changeAction,),
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
