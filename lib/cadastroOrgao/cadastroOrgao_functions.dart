import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';


var url;
HasuraConnect hasuraConnect =
    HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

class requisicoesDropdown {

var jsonTipoOrgao;
var jsonEstado;
List<DropdownMenuItem<String>> dropDownMenuItems;
bool tipoConexao = true; // false =  sem internet, true = tem internet

  String subscriptionOrgao = """
subscription {
  orgao {
    nome
    id
    id_tipo_orgao
    id_estados
  }
}
""";

  String subscriptionTipoOrgao = """
subscription {
  tipo_orgao {
    id
    nome
  }
}

""";

  String subscriptionEstado = """
subscription {
  estados {
    id
    nome
  }
}
""";

  

//verificando internet
  Future<bool> resultadoInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return true;
    } else {
      return false;
    }
  }

//obtendo dados dos orgaos
  Future getDadosOrgaos() async {
    var resultadoConexao = await resultadoInternet();

    if (resultadoConexao == false) {
      var snapshot = hasuraConnect.subscription(subscriptionOrgao);

      snapshot.listen((data) {
        print(data);
      });
    } else {
      return true;
    }
  }
// obtendo os tipos de orgaos
  Future getDadosTiposOrgaos() async {
    var resultadoConexao = await resultadoInternet();

    if(resultadoConexao == false){
    var snapshot = hasuraConnect.subscription(subscriptionTipoOrgao);
    snapshot.listen((data) {
      print(data);
      jsonTipoOrgao = data;
      dropDownMenuItems = _getDropDownMenuItems(jsonTipoOrgao);
      return jsonTipoOrgao;
    });
    print("WWWWWWWWWW: $jsonTipoOrgao");
    
    }else{
    return true;
  }
  }
List<DropdownMenuItem<String>> _getDropDownMenuItems(jsonData) {
 List<DropdownMenuItem<String>> items = new List();
 int qtde = jsonData['data']['tipo_orgao'].length;
 int i;
 items.add(new DropdownMenuItem(
    value: '',
    child: Text('Selecione...', style: TextStyle(
      color: Colors.black54,),),
  ));
   for (i = 0; i < qtde; i++) {
    items.add(new DropdownMenuItem(
      value: jsonData['data']['tipo_orgao'][i]['id'],
      child: new Text(jsonData['data']['tipo_orgao'][i]['nome'],
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.black,
          )),
    ));
  }
  return items;
}





//obtendo estados
  Future getDadosEstados() async {
    var resultadoConexao = await resultadoInternet();

    if(resultadoConexao == false){
    var snapshot = hasuraConnect.subscription(subscriptionEstado);
    snapshot.listen((data) {
      print(data);
    });
  }else{
    return true;
  }
  }
}


