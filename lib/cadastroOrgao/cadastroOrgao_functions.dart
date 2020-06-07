import 'package:connectivity/connectivity.dart';
import 'package:hasura_connect/hasura_connect.dart';


var url;
HasuraConnect hasuraConnect =
    HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

class requisicoes {
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

  bool tipoConexao = true; // false =  sem internet, true = tem internet

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

  Future getDadosTiposOrgaos() async {
    var resultadoConexao = await resultadoInternet();

    if(resultadoConexao == false){
    var snapshot = hasuraConnect.subscription(subscriptionTipoOrgao);
    snapshot.listen((data) {
      print(data);
    });
    }else{
    return true;
  }
  }

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
