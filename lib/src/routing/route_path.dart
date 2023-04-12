class AgroNpRoutePath {
  final int terrainId;
  final String menuType;
  final String action;
  final bool isUnknown;
  final bool isLogged;

  AgroNpRoutePath.login()
      : terrainId = -1,
        isUnknown = false,
        menuType = "Procurar Anúncios",
        isLogged = false,
        action = "Visualizar";

  AgroNpRoutePath.myprofile()
      : terrainId = -1,
        isUnknown = false,
        menuType = "Meu Perfil",
        isLogged = true,
        action = "Visualizar";

  AgroNpRoutePath.searchTerrains()
      : terrainId = -1,
        isUnknown = false,
        menuType = "Procurar Anúncios",
        isLogged = true,
        action = "Visualizar";

  AgroNpRoutePath.visualizePublicTerrain(this.terrainId)
      : isUnknown = false,
        menuType = "Procurar Anúncios",
        isLogged = true,
        action = "Visualizar";

  AgroNpRoutePath.myTerrains()
      : terrainId = -1,
        isUnknown = false,
        menuType = "Meus Anúncios",
        isLogged = true,
        action = "Visualizar";

  AgroNpRoutePath.viusualizePrivateTerrain(this.terrainId)
      : isUnknown = false,
        menuType = "Meus Anúncios",
        isLogged = true,
        action = "Visualizar";

  AgroNpRoutePath.myFavorites()
    : terrainId = -1,
      isUnknown = false,
      menuType = "Anúncios Favoritos",
      isLogged = true,
      action = "Visualizar";

  AgroNpRoutePath.visualizeFavoriteTerrain(this.terrainId)
    : isUnknown = false,
      menuType = "Anúncios Favoritos",
      isLogged = true,
      action = "Visualizar";

  AgroNpRoutePath.buildTerrain()
    : isUnknown = false,
      menuType = "Meus Anúncios",
      isLogged = true,
      terrainId = -1,
      action = "Criar Anúncio";

  AgroNpRoutePath.unknown()
      : terrainId = -1,
        menuType = "",
        isLogged = false,
        isUnknown = true,
        action = "Visualizar";

  bool get isLoginPage => (terrainId == -1 && menuType == "" && !isUnknown && !isLogged && action == "Visualizar");

  bool get isMyProfile => (terrainId == -1 && menuType == "myProfile" && !isUnknown && isLogged && action == "Visualizar");

  bool get isSearchTerrains => (terrainId == -1 && menuType == "searchTerrains" && !isUnknown && isLogged && action == "Visualizar");
  
  bool get isViewPublicTerrain => (terrainId != -1 && menuType == "searchTerrains" && !isUnknown && isLogged && action == "Visualizar");

  bool get isMyTerrains => (terrainId == -1 && menuType == "myTerrains" && !isUnknown && isLogged && action == "Visualizar");

  bool get isViewPrivateTerrain => (terrainId != -1 && menuType == "myTerrains" && !isUnknown && isLogged && action == "Visualizar");

  bool get isMyFavorites => (terrainId == -1 && menuType == "myFavorites" && !isUnknown && isLogged && action == "Visualizar");

  bool get isViewFavoriteTerrain => (terrainId != -1 && menuType == "myFavorites" && !isUnknown && isLogged && action == "Visualizar");

  bool get isBuildTerrain => (terrainId == -1 && menuType == "myTerrains" && !isUnknown && isLogged && action == "Criar Anúncio");

  bool get isUnknownPage => (isUnknown);
}
