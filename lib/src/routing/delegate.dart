import 'package:flutter/material.dart';
import 'package:helloworld/src/screen/terrain_visualization.dart';

import 'route_path.dart';
import '../screen/menus/drawer_menu.dart';
import '../screen/login_signin_screens/login_screen.dart';
import '../screen/menus_navigator.dart';

class AppRouterDelegate extends RouterDelegate<AgroNpRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AgroNpRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  AppRouterDelegate({required this.navigatorKey});

  bool isUnknown = false;
  bool isLogged = false;
  int terrainId = -1;
  String menuType = "Procurar Anúncios";

  @override
  AgroNpRoutePath get currentConfiguration {
    if (isUnknown) {
      return AgroNpRoutePath.unknown();
    }

    if (!isLogged) {
      return AgroNpRoutePath.login();
    } else {
      switch (menuType) {
        case "Procurar Anúncios":
          if (terrainId == -1) {
            return AgroNpRoutePath.searchTerrains();
          } else {
            return AgroNpRoutePath.visualizePublicTerrain(terrainId);
          }
        
        case "Meus Anúncios":
          if (terrainId == -1) {
            return AgroNpRoutePath.myTerrains();
          } else {
            return AgroNpRoutePath.viusualizePrivateTerrain(terrainId);
          }
        
        case "Anúncios Favoritos":
          if (terrainId == -1) {
            return AgroNpRoutePath.myFavorites();
          } else {
            return AgroNpRoutePath.visualizeFavoriteTerrain(terrainId);
          }

        case "Meu Perfil":
          return AgroNpRoutePath.myprofile();
      }
    }

    return AgroNpRoutePath.unknown();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('Terrains Menus'),
          child: Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(menuType),
            ),
            drawer: DrawerMenu(changeScreen: _changeSelectedMenu),
            body: MenusNavigator(menuType: menuType, selectTerrain: _selectTerrain))),
        if (!isLogged)
          MaterialPage(
            key: const ValueKey('Login Screen'),
            child: LoginScreen(
              onTapped: _logIn,
            )),
        if (terrainId != -1)
          const MaterialPage(
            key: ValueKey('Terrain Screen'),
            child: TerrainVisualization()
          )
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        isUnknown = false;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AgroNpRoutePath configuration) async {
    isUnknown = true;

    if (configuration.isUnknown) {
      isUnknown = true;
      return;
    }

    if (configuration.isLoginPage) {
      isLogged = false;
      terrainId = -1;
      isUnknown = false;
      menuType = "Procurar Anúncios";
    }

    if (configuration.isSearchTerrains) {
      isLogged = true;
      terrainId = -1;
      isUnknown = false;
      menuType = configuration.menuType;
    }

    if (configuration.isViewPublicTerrain) {
      isLogged = true;
      isUnknown = false;
      menuType = configuration.menuType;
      terrainId = configuration.terrainId;
    }

    if (configuration.isMyFavorites) {
      isLogged = true;
      isUnknown = false;
      menuType = configuration.menuType;
      terrainId = -1;
    }

    if (configuration.isViewFavoriteTerrain) {
      isLogged = true;
      isUnknown = false;
      menuType = configuration.menuType;
      terrainId = configuration.terrainId;
    }

    if (configuration.isMyTerrains) {
      isLogged = true;
      isUnknown = false;
      menuType = configuration.menuType;
      terrainId = -1;
    }

    if (configuration.isViewPrivateTerrain) {
      isLogged = true;
      isUnknown = false;
      menuType = configuration.menuType;
      terrainId = configuration.terrainId;
    }

    if (configuration.isMyProfile) {
      isLogged = true;
      isUnknown = false;
      menuType = configuration.menuType;
      terrainId = configuration.terrainId;
    }
  }

  void _logIn() {
    isLogged = true;
    notifyListeners();
  }

  void _changeSelectedMenu(String menuOption) {
    if (menuOption != menuType) {
      menuType = menuOption;
      notifyListeners();
      if (scaffoldKey.currentState!.hasDrawer) {
        scaffoldKey.currentState!.closeDrawer();
      }
    }
  }

  void _selectTerrain(int newId) {
    terrainId = newId;
  }
}
