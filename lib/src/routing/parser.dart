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
      return AgroNpRoutePath.unknown();
    }

    if (uri.pathSegments.length == 1) {
      routeName = uri.pathSegments[0];

      switch (routeName) {
        case "login":
          {
            return AgroNpRoutePath.login();
          }

        case "myprofile":
          {
            return AgroNpRoutePath.myprofile();
          }

        case "myterrains":
          {
            return AgroNpRoutePath.myTerrains();
          }

        case "searchterrains":
          {
            return AgroNpRoutePath.searchTerrains();
          }

        case "favorites":
          {
            return AgroNpRoutePath.myFavorites();
          }

        case "buildterrain":
          {
            return AgroNpRoutePath.buildTerrain();
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
        case "myterrains":
          {
            return AgroNpRoutePath.viusualizePrivateTerrain(id);
          }

        case "searchterrains":
          {
            return AgroNpRoutePath.visualizePublicTerrain(id);
          }

        case "favorites":
          {
            return AgroNpRoutePath.visualizeFavoriteTerrain(id);
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
    if (configuration.isLogged) {
      return const RouteInformation(location: '/login');
    }

    if (configuration.isBuildTerrain) {
      return const RouteInformation(location: '/buildterrain');
    }

    if (configuration.isSearchTerrains) {
      return const RouteInformation(location: '/searchterrain');
    }

    if (configuration.isViewPublicTerrain) {
      return RouteInformation(
          location: '/searchterrain/${configuration.terrainId}');
    }

    if (configuration.isMyProfile) {
      return const RouteInformation(location: '/myProfile');
    }

    if (configuration.isMyFavorites) {
      return const RouteInformation(location: '/myfavorites');
    }

    if (configuration.isViewFavoriteTerrain) {
      return RouteInformation(
          location: '/myfavorites/${configuration.terrainId}');
    }

    if (configuration.isMyTerrains) {
      return const RouteInformation(location: '/myterrains');
    }

    if (configuration.isViewPrivateTerrain) {
      return RouteInformation(
          location: '/myterrains/${configuration.terrainId}');
    }

    return const RouteInformation(location: '/404');
  }
}
