import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:twp_licitacoes/orgao/cadastroOrgao/cadastroOrgao_functions.dart';

class HomeAdmAnalytics {

  BuildContext context;
  HomeAdmAnalytics(this.context);

  HasuraConnect _hasuraConnect = HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

  List empresaTodas = List();

  Map<String, double> dataMap = new Map();
  Map<String, double> chartPieCategorias = new Map();

  String queryCategorias = """
  query MyQuery {
    categorias_de_atividades {
      id
      nome
    }
  }""";

  String queryEmpresasTodas = """
  query MyQuery {
    empresa {
      id
      id_categoria
    }
  }""";

  String queryEmpresasCategoria(idCategoria) {
    return """
    query MyQuery {
      empresa(where: {id_categoria: {_eq: $idCategoria}}) {
        id_categoria
        id
      }
    }
""";
  }

  Future criaGrafico(){
    dataMap.putIfAbsent("Flutter", () => 5);
    dataMap.putIfAbsent("React", () => 3);
    dataMap.putIfAbsent("Xamarin", () => 2);
    dataMap.putIfAbsent("Ionic", () => 2);
  }

  Future criaGraficoEstados() async {

    var snapshot = _hasuraConnect.query(queryCategorias);
    var snapshotEmpresas = _hasuraConnect.query(queryEmpresasTodas);
    List categoriasList = List();
    chartPieCategorias.clear();

    categoriasList.clear();
    empresaTodas.clear();

    await snapshot.then((data){
      //print('snapshot categorias $data');
      categoriasList.addAll(data['data']['categorias_de_atividades']);
    });

    await snapshotEmpresas.then((data){
     // print('snapshot snapshotEmpresas $data');
      empresaTodas.addAll(data['data']['empresa']);
    });
    print('categoriasList empresaTodas $empresaTodas');

    for(int i=0; i<categoriasList.length; i++){
      bool temEmpresa = await verificaTemEmpresa(categoriasList[i]['id']);

      if(temEmpresa){
        var snapshotEmp = _hasuraConnect.query(queryEmpresasCategoria(categoriasList[i]['id']));
        await snapshotEmp.then((data){
          print('snapshot empresa $data');

          chartPieCategorias.putIfAbsent("${categoriasList[i]['nome']}", () => double.parse(data['data']['empresa'].length.toString()));
        });
      }

    }

  }

  Future<bool> verificaTemEmpresa(idCat) async {

    for(int i=0; i<empresaTodas.length; i++){
      if(empresaTodas[i]['id_categoria'] == idCat){
        return true;
      }
    }

    return false;

  }

}