import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';


HasuraConnect hasuraConnect = HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

class updateOrgaos{

  var jsonOrgao;
  var jsonInfos;
  bool tipoConexao = true; // false =  sem internet, true = tem internet


   //Editar Orgaos
  final nomeOrgao = TextEditingController();
  final cnpj = TextEditingController();
  final email = TextEditingController();
  final telefone = TextEditingController();
  final cep = TextEditingController();
  final cidade = TextEditingController();
  final endereco = TextEditingController();
  
    

  String subscriptionOrgao = 
    """
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
    
    
    return jsonOrgao;
  }

   void buscaArmazenaOrgaos() {
    var snapshot = hasuraConnect.subscription(subscriptionOrgao);
    snapshot.listen((data) {
      print("Orgao: $data");
      jsonOrgao = data;
      
    });
  }
  Future carregaDados() async {
    await getDadosOrgaos();
    print("TEM QUE APARECER AQUI: $jsonOrgao");
    nomeOrgao.text = jsonOrgao['nome'];
    cnpj.text = jsonOrgao['cnpj'];
    email.text= jsonOrgao['email'];
    telefone.text = jsonOrgao['telefone'];
    cep.text = jsonOrgao['cep'];
    cidade.text = jsonOrgao['cidade'];
    endereco.text = jsonOrgao['endereco'];
  
  }

   Future carregaInfos() async{
    await updateOrgaos().carregaDados();
    return jsonInfos;
 }
}