import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';

HasuraConnect hasuraConnect =
    HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

class UpdateSubAtividadesFunctions {
  BuildContext context;
  UpdateSubAtividadesFunctions(this.context);

  var jsonSubAtividades;
  var jsonTipoCategoria;
  /*var jsonInfos;
  var jsonEstado;*/
  bool tipoConexao = true; // false =  sem internet, true = tem internet

  var id;
  final nomeSubAtividade = TextEditingController();
  var idTipoCategoria;

  String subscriptionSubAtividades = """
  subscription MySubscription {
  subcategorias_de_atividades {
    id
    nome
    id_categoria
  }
}
""";

String subscriptionTipoCategoria = """
subscription MySubscription{
  categorias_de_atividades{
    id
    nome
  }
}""";

  Future recebeDados() async {
    await getDadosSubAtividades();
    await getDadosTipoCategoria();
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
Future buscaArmazenaTipoCategoria() async {
    var snapshot = hasuraConnect.subscription(subscriptionSubAtividades);
    snapshot.listen((data) {
      print("Orgao: $data");
      jsonSubAtividades= data;
    });
  }
//obtendo dados das categorias
  Future getDadosSubAtividades() async {
    var resultadoConexao = await resultadoInternet();
    if (resultadoConexao == false) {
      await buscaArmazenaSubAtividades();
    } else {
      //return true;
    }
  }
Future buscaArmazenaSubAtividades() async {
    var snapshot = hasuraConnect.subscription(subscriptionSubAtividades);
    snapshot.listen((data) {
      print("SUBCATEGORIASSSSS: $data");
      jsonSubAtividades = data;
    });
  }
//obtendo dados das categorias
  Future getDadosTipoCategoria() async {
    var resultadoConexao = await resultadoInternet();
    if (resultadoConexao == false) {
      await buscaArmazenaTipoCategoria();
    } else {
      //return true;
    }
  }

  Future atualizaControladores(jsonEscolhido) async {
    //await getDadosOrgaos();
    await zeraControladores();
    print("TEM QUE APARECER AQUI: $jsonEscolhido");
    id = jsonEscolhido['id'];
    nomeSubAtividade.text = jsonEscolhido['nome'];
    idTipoCategoria = jsonEscolhido['id_categoria'];
  }

  Future zeraControladores(){
    nomeSubAtividade.text = '';
    idTipoCategoria = null;
    
  }
}
