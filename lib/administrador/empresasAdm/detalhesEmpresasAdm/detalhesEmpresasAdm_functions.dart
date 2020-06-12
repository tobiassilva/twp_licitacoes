import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';

class DetalhesEmpresasAdmFunctions {

  BuildContext context;
  DetalhesEmpresasAdmFunctions(this.context);

  HasuraConnect hasuraConnect = HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

  // Variáveis
  //final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  String deleteQuery(idEmpresa){
    return """
  mutation MyMutation {
    delete_empresa(where: {id: {_eq: $idEmpresa}}) {
      returning {
        nome_empresa
        id
      }
    }
  }
  """;}

  Future deleteEmpresaAdm(idEmpresa) async {
    var snapshot = hasuraConnect.mutation(deleteQuery(idEmpresa));

    print('EMPRESA DELETADA: $snapshot');

    await snapshot.then((data){

      print('EMPRESA DELETADA data: $data');
    });

  }



}