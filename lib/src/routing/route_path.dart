class AgroNpRoutePath {
  final int terrainId;
  final bool isUnknown;
  final String menuType;
  final bool isLogged;

  AgroNpRoutePath.login()
      : terrainId = -1,
        isUnknown = false,
        menuType = "Procurar Anúncios",
        isLogged = false;

  AgroNpRoutePath.myprofile()
      : terrainId = -1,
        isUnknown = false,
        menuType = "Meu Perfil",
        isLogged = true;

  AgroNpRoutePath.searchTerrains()
      : terrainId = -1,
        isUnknown = false,
        menuType = "Procurar Anúncios",
        isLogged = true;

  AgroNpRoutePath.visualizePublicTerrain(this.terrainId)
      : isUnknown = false,
        menuType = "Procurar Anúncios",
        isLogged = true;

  AgroNpRoutePath.myTerrains()
      : terrainId = -1,
        isUnknown = false,
        menuType = "Meus Anúncios",
        isLogged = true;

  AgroNpRoutePath.viusualizePrivateTerrain(this.terrainId)
      : isUnknown = false,
        menuType = "Meus Anúncios",
        isLogged = true;

  AgroNpRoutePath.myFavorites()
    : terrainId = -1,
      isUnknown = false,
      menuType = "Anúncios Favoritos",
      isLogged = true;

  AgroNpRoutePath.visualizeFavoriteTerrain(this.terrainId)
    : isUnknown = false,
      menuType = "Anúncios Favoritos",
      isLogged = true;

  AgroNpRoutePath.unknown()
      : terrainId = -1,
        menuType = "",
        isLogged = true,
        isUnknown = true;

  bool get isLoginPage => (terrainId == -1 && menuType == "" && !isUnknown && !isLogged);

  bool get isMyProfile => (terrainId == -1 && menuType == "myProfile" && !isUnknown && isLogged);

  bool get isSearchTerrains => (terrainId == -1 && menuType == "searchTerrains" && !isUnknown && isLogged);
  
  bool get isViewPublicTerrain => (terrainId != -1 && menuType == "searchTerrains" && !isUnknown && isLogged);

  bool get isMyTerrains => (terrainId == -1 && menuType == "myTerrains" && !isUnknown && isLogged);

  bool get isViewPrivateTerrain => (terrainId != -1 && menuType == "myTerrains" && !isUnknown && isLogged);

  bool get isMyFavorites => (terrainId == -1 && menuType == "myFavorites" && !isUnknown && isLogged);

  bool get isViewFavoriteTerrain => (terrainId != -1 && menuType == "myFavorites" && !isUnknown && isLogged);

}
