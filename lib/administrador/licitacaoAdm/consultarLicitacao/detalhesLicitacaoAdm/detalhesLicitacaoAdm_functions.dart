import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';

class DetalhesLicitacaoAdmFunctions{

  BuildContext context;
  DetalhesLicitacaoAdmFunctions(this.context);

  HasuraConnect hasuraConnect = HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

  String deleteQuery(idLicitacao) {
    return """
    mutation MyMutation {
      delete_licitacoes(where: {id: {_eq: $idLicitacao}}) {
        returning {
          id
          nome
          orgao
          categoria_de_atividade
        }
      }
    }
    """;
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

  Future<bool> deleteLicitacaoAdm(idLicitacao) async {

    bool notConnect = await resultadoInternet();

    if(notConnect){
      return false;
    }

    var snapshot = await hasuraConnect.mutation(deleteQuery(idLicitacao));

    print('EMPRESA DELETADA: $snapshot');

    return true;
  }

}