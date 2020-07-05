



import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:twp_licitacoes/globalsFunctions.dart';

class RelatoriosFunctions {

  BuildContext context;
  RelatoriosFunctions(context);

  HasuraConnect hasuraConnect =
  HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');
  List listaStatus = List();

  String querySituacao = """
    query MyQuery {
      situacao_licitacao {
        id
        nome
      }
    }
  """;

  Future getDadosBanco() async {
    Future<bool> Function() cs = FunctionsGlobals().result;
    print('INTERNET: $cs');

    var snapshot = await hasuraConnect.query(querySituacao);

    listaStatus.addAll(snapshot['data']['situacao_licitacao']);
    print(listaStatus);


  }

}