
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:twp_licitacoes/globals.dart';
import 'package:twp_licitacoes/globalsFunctions.dart';

class RelatoriosFunctions {

  BuildContext context;
  RelatoriosFunctions(context);

  HasuraConnect hasuraConnect =
  HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');
  List listaStatus = List();

  List<DropdownMenuItem<String>> dropDownStatusItems;

  String querySituacao = """
    query MyQuery {
      situacao_licitacao {
        id
        nome
      }
    }
  """;


  Future getDadosBanco() async {
    listaStatus.clear();
    Future<bool> Function() cs = FunctionsGlobals().result;
    print('INTERNET: $cs');

    var snapshot = await hasuraConnect.query(querySituacao);

    listaStatus.addAll(snapshot['data']['situacao_licitacao']);
    print(listaStatus);
    print(listaStatus[2]);
    dropDownStatusItems = _getDropDownMenuItems();
    print('dropDownStatusItems: $dropDownStatusItems');

  }

  //monta DropDown Status
  List<DropdownMenuItem<String>> _getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();

    int qtde = listaStatus.length;
    int i;

    print('ENTROU DROP DOWN');
    print(listaStatus.length);
    print(listaStatus);
    print(listaStatus[2]);

    items.add(new DropdownMenuItem(
      value: null,
      child: Text('Selecione...'),
    ));

    for (i = 0; i < qtde; i++) {
      print('ENTROU : $i');
      items.add(new DropdownMenuItem(
        value: listaStatus[i]['id'].toString(),
        child: new Text(listaStatus[i]['nome'],
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: StyleGlobals().sizeTextMedio,
              color: StyleGlobals().textColorMedio,
            )),
      ));
    }

    return items;
  }



}