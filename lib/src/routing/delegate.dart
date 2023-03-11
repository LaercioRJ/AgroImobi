import 'package:flutter/material.dart';

import 'route_path.dart';
import '../screen/drawer_menu.dart';
import '../screen/login_signin_screens/login_screen.dart';
import '../screen/menus_navigator.dart';

class AppRouterDelegate extends RouterDelegate<AgroNpRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AgroNpRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  AppRouterDelegate({required this.navigatorKey});

  bool show404 = false;
  bool _isLogged = false;
  int _userId = -1;
  int _terrainId = -1;
  String _menuType = "Buscar Anúncios";

  @override
  AgroNpRoutePath get currentConfiguration {
    if (show404) {
      return AgroNpRoutePath.unknown();
    }

    if (_isLogged && _terrainId == -1 && _userId == -1) {
      return AgroNpRoutePath.home();
    }

    return AgroNpRoutePath.unknown();
    /*return _isSelected == false
        ? AgroNpRoutePath.home()
        : AgroNpRoutePath.details(books.indexOf(_selectedBook));*/
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
                  title: Text(_menuType),
                ),
                drawer: DrawerMenu(changeScreen: _visualizeMyTerrains),
                body: MenusNavigator(menuType: _menuType))),
        if (!_isLogged)
          MaterialPage(
              key: const ValueKey('Login Screen'),
              child: LoginScreen(
                onTapped: _logIn,
              ))
        /*else if (_userId != -1)
          const MaterialPage(
              key: ValueKey('My Profile Screen'), child: Text(''))*/
        /*if (show404)
          MaterialPage(
              key: const ValueKey('UnknownPage'), child: UnknownScreen())
        else if (_isSelected)
          BookDetailsPage(book: _selectedBook)*/
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        show404 = false;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AgroNpRoutePath path) async {
    if (path.isUnknown) {
      show404 = true;
      return;
    }

    if (path.isHomePage) {
      _isLogged = true;
      _userId = -1;
      _terrainId = -1;
      show404 = false;
    }

    if (path.isLoginPage) {
      _isLogged = false;
      _userId = -1;
      _terrainId = -1;
      show404 = false;
    }

    /*if (path.isDetailsPage) {
      if (path.id < 0 || path.id > books.length - 1) {
        show404 = true;
        return;
      }

      _selectedBook = books[path.id];
    } else {
      _isSelected = false;
    }*/

    show404 = false;
  }

  void _logIn() {
    _isLogged = true;
    notifyListeners();
  }

  void _visualizeMyTerrains(String menuOption) {
    if (menuOption != _menuType) {
      _menuType = menuOption;
      notifyListeners();
      if (scaffoldKey.currentState!.hasDrawer) {
        scaffoldKey.currentState!.closeDrawer();
      }
    }
  }
}
