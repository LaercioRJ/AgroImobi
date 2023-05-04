// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Terrain {
  int id;
  double valor;
  double areaTotal;
  String aptidao;
  //String localizacao; // checar qual o tipo de dados
  String cidade;
  String estado;
  String relevo;
  int tipo;
  String classificacao;
  List<String> fotos = [];
  String caracteristicas;
  String tipoNegocio;
  String descricao;
  String dataInicio;
  String dataFinal;

  Terrain(
    this.id,
    this.valor,
    this.areaTotal,
    this.aptidao,
    this.cidade,
    this.estado,
    this.relevo,
    this.tipo,
    this.classificacao,
    this.fotos,
    this.caracteristicas,
    this.tipoNegocio,
    this.descricao,
    this.dataInicio,
    this.dataFinal,
  );

  toJson() {
    Map<String, dynamic> terrainMap = {
      'id': id,
      'valor': valor,
      'areaTotal': areaTotal,
      'aptidao': aptidao,
      'cidade': cidade,
      'estado': estado,
      'relevo': relevo,
      'tipo': tipo,
      'classificacao': classificacao,
      'fotos': fotos,
      'caracteristicas': caracteristicas,
      'tipoNegocio': tipoNegocio,
      'descricao': descricao,
      'dataInicio': dataInicio,
      'dataFinal': dataFinal,
    };
    String terrainJson = jsonEncode(terrainMap);
    return terrainJson;
  }
}
