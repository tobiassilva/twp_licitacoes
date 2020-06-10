
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../home/home.dart';

var url;
HasuraConnect hasuraConnect =
HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

class requisicoes {

  var jsonTipoOrgao;
  var jsonEstado;
  var jsonInfos;
  //List<DropdownMenuItem<String>> dropDownMenuItems;
  bool tipoConexao = true; // false =  sem internet, true = tem internet

  String subscriptionOrgao = """
subscription {
  orgao {
    nome
    id
    id_tipo_orgao
    id_estados
    cnpj
    telefone
    endereco
    email
    
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
        print("Orgaos: $data");
      });
    } else {
      //return true;
    }
  }

  void buscaArmazenaTiposOrgaos() {
    var snapshot = hasuraConnect.subscription(subscriptionTipoOrgao);
    snapshot.listen((data) {
      print("TipoOrgao: $data");
      jsonTipoOrgao = data;
      /*dropDownMenuItems = _getDropDownMenuItems(jsonTipoOrgao);
      return jsonTipoOrgao;*/
    });
  }

// obtendo os tipos de orgaos
  Future getDadosTiposOrgaos() async {
    var resultadoConexao = await resultadoInternet();
    if (resultadoConexao == false) {
       await buscaArmazenaTiposOrgaos();
    } else {
      //return true;
    }
    print("WWWWWWWWWW: $jsonTipoOrgao");
    return jsonTipoOrgao;
    
  }
/*List<DropdownMenuItem<String>> _getDropDownMenuItems(jsonData) {
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
}*/


 void buscaArmazenaEstados() {
    var snapshot2 = hasuraConnect.subscription(subscriptionEstado);
    snapshot2.listen((data) {
      print("Estado: $data");
      jsonEstado = data;

    });
  }
//obtendo estados
  Future getDadosEstados() async {
    var resultadoConexao = await resultadoInternet();

    if (resultadoConexao == false) {
      await buscaArmazenaEstados();
    } else {
      //return true;
    }
 print("YYYYYYYYYY: $jsonEstado");
 return jsonEstado;
  }

  Future carregaDados() async {
    await getDadosOrgaos();
    await getDadosTiposOrgaos();
    await getDadosEstados();
    print("AQUI!!: $jsonTipoOrgao");
    print("AQUI22: $jsonEstado");
  }

   Future carregaInfos() async{
    await requisicoes().carregaDados();

    return jsonInfos;
    
   
 }
 final GlobalKey<ScaffoldState> scaffoldState =
new GlobalKey<ScaffoldState>();


}

