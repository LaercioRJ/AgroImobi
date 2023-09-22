// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Terrain {
  int id;
  String title;
  bool sell;
  bool rent;
  double sellPrice;
  double rentPrice;
  double totalArea;
  String areaType;
  String aptidao; // is it a select?
  //String localizacao; // checar qual o tipo de dados
  String city; // select
  String state; // select
  String topography; // select
  int advertisementType;
  String classificacao;
  List<String> photos = [];
  List<String> features;
  String tipoNegocio;
  String descricao;
  String dataInicio;
  String dataFinal;

  Terrain(
    this.id,
    this.title,
    this.sell,
    this.rent,
    this.sellPrice,
    this.rentPrice,
    this.totalArea,
    this.areaType,
    this.aptidao,
    this.city,
    this.state,
    this.topography,
    this.advertisementType,
    this.classificacao,
    this.photos,
    this.features,
    this.tipoNegocio,
    this.descricao,
    this.dataInicio,
    this.dataFinal,
  );

  toJson() {
    Map<String, dynamic> terrainMap = {
      'id': id,
      'title': title,
      'sell': sell,
      'rent': rent,
      'sellPrice': sellPrice,
      'rentPrice': rentPrice,
      'totalArea': totalArea,
      'areaType': areaType,
      'aptidao': aptidao,
      'cidade': city,
      'estado': state,
      'topography': topography,
      'tipo': advertisementType,
      'classificacao': classificacao,
      'fotos': photos,
      'caracteristicas': features,
      'tipoNegocio': tipoNegocio,
      'descricao': descricao,
      'dataInicio': dataInicio,
      'dataFinal': dataFinal,
    };
    String terrainJson = jsonEncode(terrainMap);
    return terrainJson;
  }

  static createEmptyObject() {
    Terrain terrain = Terrain(-1, '', false, false, 0, 0, 0, '', '', '', '', '',
        -1, '', ['', ''], [''], '', '', '', '');

    return terrain;
  }

  static createMockObject() {
    Terrain terrain = Terrain(
        1,
        'Fazenda com reserva natural',
        true,
        true,
        200000,
        5000,
        5000,
        'Hectare',
        '',
        'Bauru',
        'SP',
        'Planice',
        1,
        '',
        ['lib/src/assets/terrain.jpg', 'lib/src/assets/diablo0.jpg'],
        ['eletricidade', 'casa', 'agua'],
        '',
        'Nenhuma descrição',
        '',
        '');

    return terrain;
  }
}
