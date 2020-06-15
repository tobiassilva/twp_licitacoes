import 'package:connectivity/connectivity.dart';
import 'package:hasura_connect/hasura_connect.dart';

HasuraConnect hasuraConnect =
    HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

class RequisicoesAtividades {
  var jsonAtividades;
  //var jsonSegmento;
  var jsonInfosAtividades;

  bool tipoConexao = true; // false =  tem internet, true = sem internet

  String subscriptionAtividades = """
  subscription MySubscription {
  categorias_de_atividades {
    nome
  }
}
""";

/*String subscriptionSegmento = """
""";*/

//verificando internet
  Future<bool> resultadoInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return true;
    } else {
      return false;
    }
  }

  Future buscaArmazenaAtividades() async{
    var snapshot = hasuraConnect.subscription(subscriptionAtividades);
    snapshot.listen((data) {
      print("Atividade: $data");
      jsonAtividades = data;
    });
  }

  // obtendo as atividades
  Future getDadosAtividades() async {
    var resultadoConexao = await resultadoInternet();
    if (resultadoConexao == false) {
      await buscaArmazenaAtividades();
    } else {
      //return true;
    }
    print("WWWWWWWWWW: $jsonAtividades");
    return jsonAtividades;
  }

  Future carregaDadosAtividades() async {
    await getDadosAtividades();
    print("ATIVIDADES: $jsonAtividades");
  }

  Future carregaInfosAtividades() async {
    await carregaDadosAtividades();
    return jsonInfosAtividades;
  }
  Future recebeDadosAtividades() async {
      await getDadosAtividades();
      
    }
  Future enviarFormularioAtividades(nome) async {
    var resultadoConexao = await resultadoInternet();
    if (resultadoConexao == false) {
      var data = await hasuraConnect.mutation(queryAtividades(nome));

      print(data);
    } else {}
  }

  String queryAtividades(nome) {
    return """
    mutation MyMutation {
    insert_categorias_de_atividades(objects: {nome: "$nome"}) {
    returning {
      id
    }
  }
}""";
  }
}
