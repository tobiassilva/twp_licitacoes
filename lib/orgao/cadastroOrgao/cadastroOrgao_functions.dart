import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';

var url;
HasuraConnect hasuraConnect =
HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

class Requisicoes{

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
    cep
    cidade
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

  Future buscaArmazenaTiposOrgaos() async {
    var snapshot = hasuraConnect.subscription(subscriptionTipoOrgao);
    snapshot.listen((data) {
      print("TipoOrgao: $data");
      jsonTipoOrgao = data;
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

 Future buscaArmazenaEstados() async{
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
    await Requisicoes().carregaDados();

    return jsonInfos;
    
   
 }
 final GlobalKey<ScaffoldState> scaffoldState =
new GlobalKey<ScaffoldState>();

  Future enviarFormulario(nome,  tipo, cnpj, email, telefone, cep,  estado, cidade, endereco ) async {

    var resultadoConexao = await Requisicoes().resultadoInternet();
    if (resultadoConexao == false) {

      var data = await hasuraConnect.mutation(queryOrgao(nome, tipo, cnpj, email, telefone, cep, estado, cidade, endereco));

      print(data);
    }else{
    }
  }

  String queryOrgao(nome, tipo, cnpj, email, telefone, cep, estado, cidade, endereco){
    return 
    """mutation MyMutation {
        insert_orgao(objects: {nome: "$nome", id_tipo_orgao: $tipo, cnpj: "$cnpj", 
                              email: "$email", telefone: "$telefone", cep: "$cep", id_estados: $estado, 
                              cidade: "$cidade", endereco: "$endereco"}) {
    returning {
      id
      }
  }
}""";
  }
}