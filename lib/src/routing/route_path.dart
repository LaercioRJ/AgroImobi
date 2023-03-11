class AgroNpRoutePath {
  final int userId;
  final int terrainId;
  final int myTerrainId;
  final bool isUnknown;
  final String menuType;

  AgroNpRoutePath.login()
      : userId = -1,
        terrainId = -1,
        myTerrainId = -1,
        isUnknown = false,
        menuType = "";

  AgroNpRoutePath.home()
      : userId = -1,
        terrainId = -1,
        myTerrainId = -1,
        isUnknown = false,
        menuType = "publicTerrains";

  /*AgroNpRoutePath.myTerrainDetails(this.myTerrainId)
      : userId = -1;
        terrainId = -1,
        menuType = "myterrains",
        isUnknown = false;*/

  AgroNpRoutePath.terrainDetails(this.terrainId)
      : userId = -1,
        isUnknown = false,
        myTerrainId = -1,
        menuType = "";

  AgroNpRoutePath.myProfile(this.userId)
      : terrainId = -1,
        isUnknown = false,
        menuType = "",
        myTerrainId = -1;

  AgroNpRoutePath.unknown()
      : userId = -1,
        terrainId = -1,
        menuType = "",
        myTerrainId = -1,
        isUnknown = true;

  bool get isLoginPage => (userId == -1 && terrainId == -1);

  bool get isHomePage => (userId == -1 && terrainId == -1);

  bool get isTerrainDetailsPage => (userId == -1 && terrainId != -1);

  bool get isMyProfilePage => (userId != -1 && terrainId == -1);
}
