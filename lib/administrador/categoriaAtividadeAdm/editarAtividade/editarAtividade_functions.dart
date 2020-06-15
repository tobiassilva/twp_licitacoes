import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';

HasuraConnect hasuraConnect =
    HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

class UpdateAtividadesFunctions {
  BuildContext context;
  UpdateAtividadesFunctions(this.context);

  var jsonAtividades;
  /*var jsonInfos;
  var jsonEstado;*/
  bool tipoConexao = true; // false =  sem internet, true = tem internet

  //Editar Orgaos
  var id;
  final nomeAtividade = TextEditingController();

  String subscriptionAtividades = """
subscription MySubscription {
  categorias_de_atividades {
    id
    nome
  }
}
""";

  Future recebeDadosAtividades() async {
    await getDadosAtividades();
  }

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
  Future getDadosAtividades() async {
    var resultadoConexao = await resultadoInternet();
    if (resultadoConexao == false) {
      await buscaArmazenaAtividades();
    } else {
      //return true;
    }
  }

  Future buscaArmazenaAtividades() async{
    var snapshot = hasuraConnect.subscription(subscriptionAtividades);
    snapshot.listen((data) {
      print("ATIVIDADE UPDATE: $data");
      jsonAtividades = data;
    });
  }

  Future atualizaControladores(jsonEscolhido) async {
    //await getDadosOrgaos();
    print("TEM QUE APARECER AQUI ATIVIDADE: $jsonEscolhido");
    id = jsonEscolhido['id'];
    nomeAtividade.text = jsonEscolhido['nome'];
  }

  /*Future carregaInfos() async{
    await carregaDados();
    return jsonInfos;
 }*/

}
