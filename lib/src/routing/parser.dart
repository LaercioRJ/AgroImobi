import 'package:flutter/material.dart';

import 'route_path.dart';

class AgroNpInformationParser extends RouteInformationParser<AgroNpRoutePath> {
  // Interpreta a URI para indicar onde deve se prosseguir
  @override
  Future<AgroNpRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    String routeName;

    if (uri.pathSegments.isEmpty) {
      return AgroNpRoutePath.home();
    }

    if (uri.pathSegments.length == 1) {
      routeName = uri.pathSegments[0];

      switch (routeName) {
        case "login":
          {
            return AgroNpRoutePath.login();
          }
      }

      return AgroNpRoutePath.unknown();
    }

    if (uri.pathSegments.length == 2) {
      routeName = uri.pathSegments[0];
      var remaining = uri.pathSegments[1];
      var id = int.tryParse(remaining);

      if (id == null) {
        return AgroNpRoutePath.unknown();
      }

      switch (remaining) {
        case 'terrain':
          {
            return AgroNpRoutePath.terrainDetails(id);
          }

        case 'user':
          {
            return AgroNpRoutePath.myProfile(id);
          }

        default:
          {
            return AgroNpRoutePath.unknown();
          }
      }
    }

    return AgroNpRoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(AgroNpRoutePath configuration) {
    if (configuration.isHomePage) {
      return const RouteInformation(location: '/');
    }

    if (configuration.isLoginPage) {
      return const RouteInformation(location: '/login');
    }

    if (configuration.isTerrainDetailsPage) {
      return RouteInformation(location: '/terrain/${configuration.terrainId}');
    }

    if (configuration.isMyProfilePage) {
      return RouteInformation(location: '/myProfile/${configuration.userId}');
    }

    return const RouteInformation(location: '/404');
  }
}
