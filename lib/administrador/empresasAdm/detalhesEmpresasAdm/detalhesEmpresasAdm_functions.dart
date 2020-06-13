import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:twp_licitacoes/administrador/homeAdm/homeAdm_functions.dart';

class DetalhesEmpresasAdmFunctions {

  BuildContext context;
  DetalhesEmpresasAdmFunctions(this.context);

  HasuraConnect hasuraConnect = HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

  // Variáveis
  final GlobalKey<ScaffoldState> scaffoldKeyDetEmpresas = new GlobalKey<ScaffoldState>();

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

  String deleteInteressesEmpresaQuery(idEmpresa){
    return """
  mutation MyMutation {
    delete_estado_interesse_empresa(where: {id_empresa: {_eq: $idEmpresa}}) {
      returning {
        id
        id_empresa
        id_estado
      }
    }
  }
  """;}

  //verificando internet
  Future<bool> resultadoInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteEmpresaAdm(idEmpresa) async {
    HomeAdmFunctions homeAdmFunctions = HomeAdmFunctions(context);

    bool notConnect = await resultadoInternet();

    if(notConnect){
      //homeAdmFunctions.scaffoldKeyHomeAdm.currentState.showSnackBar(SnackBar(content: Text('Você precisa de uma conexão com a internet para realizar a ação.')));
      return false;
    }

    var snapshotInt = await hasuraConnect.mutation(deleteInteressesEmpresaQuery(idEmpresa));

    var snapshot = await hasuraConnect.mutation(deleteQuery(idEmpresa));


    print('EMPRESA DELETADA: $snapshot');
    print('snapshotInt DELETADA: $snapshotInt');


    return true;


  }



}