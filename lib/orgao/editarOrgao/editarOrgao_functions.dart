import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';


HasuraConnect hasuraConnect =
    HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

class UpdateOrgaoFunctions {
  BuildContext context;
  UpdateOrgaoFunctions(this.context);

  var jsonOrgao;
  var jsonInfos;
  var jsonEstado;
  bool tipoConexao = true; // false =  sem internet, true = tem internet

  //Editar Orgaos
  var id;
  final nomeOrgao = TextEditingController();
  var idTipo;
  final cnpj = TextEditingController();
  final email = TextEditingController();
  final telefone = TextEditingController();
  var idEstado;
  final cep = TextEditingController();
  final cidade = TextEditingController();
  final endereco = TextEditingController();

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

  String subscriptionEstado = """
subscription {
  estados {
    id
    nome
  }
}
""";

  Future recebeDadosDB() async {
    await getDadosOrgaos();
    await getDadosEstados();
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
  Future getDadosOrgaos() async {
    var resultadoConexao = await resultadoInternet();
    if (resultadoConexao == false) {
      await buscaArmazenaOrgaos();
    } else {
      //return true;
    }
  }

  Future buscaArmazenaOrgaos() async {
    var snapshot = hasuraConnect.subscription(subscriptionOrgao);
    snapshot.listen((data) {
      print("Orgao: $data");
      jsonOrgao = data;
    });
  }

  Future atualizaControladores(jsonEscolhido) async {
    //await getDadosOrgaos();
    await zeraControladores();
    print("TEM QUE APARECER AQUI: $jsonEscolhido");
    id = jsonEscolhido['id'];
    nomeOrgao.text = jsonEscolhido['nome'];
    idTipo = jsonEscolhido['id_tipo_orgao'];
    cnpj.text = jsonEscolhido['cnpj'];
    email.text = jsonEscolhido['email'];
    telefone.text = jsonEscolhido['telefone'];
    idEstado = jsonEscolhido['id_estados'];
    cep.text = jsonEscolhido['cep'];
    cidade.text = jsonEscolhido['cidade'];
    endereco.text = jsonEscolhido['endereco'];
  }

  Future zeraControladores(){
    nomeOrgao.text = '';
    idTipo = null;
    cnpj.text = '';
    email.text = '';
    telefone.text = '';
    idEstado = null;
    cep.text = '';
    cidade.text = '';
    endereco.text = '';
  }

  Future buscaArmazenaEstados() async {
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
  }

  /*Future carregaInfos() async{
    await carregaDados();
    return jsonInfos;
 }*/

}
