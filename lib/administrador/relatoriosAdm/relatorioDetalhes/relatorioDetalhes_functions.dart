import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:twp_licitacoes/globals.dart';
import 'package:twp_licitacoes/globalsFunctions.dart';


class RelatoriosDetalhesFunctions {

  BuildContext context;
  RelatoriosDetalhesFunctions(context);

  HasuraConnect hasuraConnect =
  HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

  var statusEsc;
  List licitacoesList = List();
  List modalidadesList = List();

  String queryLicitacoes(){
    return """
    query MyQuery {
      licitacoes(where: {id_situacao: {_eq: ${statusEsc['id']}}}) {
        preco_estimado
        categoria_de_atividade
        data_e_hora_da_sessao_publica
        data_limite_envio_de_documentos
        data_limite_para_crc_orgao
        edital
        nome
        situacao
        subcategoria_de_atividade
        orgao
        observacoes
        objeto_resumido
        modalidade_de_licitacao
        link
        id
        id_categoria_de_atividade
        id_modalidade_de_licitacao
        id_orgao
        id_situacao
        id_subcategoria_de_atividade
      }
    }
    """;
  }

  String queryLicitacoesPorModalidade(idModalidade){
    return """
    query MyQuery {
      licitacoes(where: {id_situacao: {_eq: ${statusEsc['id']}}, id_modalidade_de_licitacao: {_eq: $idModalidade}}) {
        preco_estimado
        categoria_de_atividade
        data_e_hora_da_sessao_publica
        data_limite_envio_de_documentos
        data_limite_para_crc_orgao
        edital
        nome
        situacao
        subcategoria_de_atividade
        orgao
        observacoes
        objeto_resumido
        modalidade_de_licitacao
        link
        id
        id_categoria_de_atividade
        id_modalidade_de_licitacao
        id_orgao
        id_situacao
        id_subcategoria_de_atividade
      }
    }

    """;
  }

  String queryModalidade = """
  query MyQuery {
    modalidade_licitacao {
      id
      nome
    }
  }

  """;


  Future getDadosBanco(_status) async {
    licitacoesList.clear();
    modalidadesList.clear();
    List licitacoesAuxList = List();
    statusEsc = _status;


    var dataModalidades = await hasuraConnect.query(queryModalidade);

    //licitacoesList.addAll(data['data']['licitacoes']);

    modalidadesList.addAll(dataModalidades['data']['modalidade_licitacao']);
    double valorTotal;
    for(int i = 0 ; i<modalidadesList.length; i++){
      valorTotal = 0.0;
      licitacoesAuxList.clear();
      var data = await hasuraConnect.query(queryLicitacoesPorModalidade(modalidadesList[i]['id']));
      licitacoesAuxList.add(data['data']['licitacoes']);

      var split = licitacoesAuxList[0].length;
      for(int i = 0; i<licitacoesAuxList[0].length; i++){
        if(licitacoesAuxList[0][i]['preco_estimado'] != null && licitacoesAuxList[0][i]['preco_estimado'] != 'null'){
          var splitGeral = await licitacoesAuxList[0][i]['preco_estimado'].split(' ');
          if(splitGeral.length > 1){
            //valor vem com virgula, tem que transformar em . para ser lido
            var splitVal = await splitGeral[1].split(',');
            if(splitVal.length > 1){
              valorTotal += double.parse('${splitVal[0]}.${splitVal[1]}');
              print('TEM 2: $valorTotal');
            } else {
              valorTotal += double.parse('${splitGeral[1]}');
            }

          } else {
            valorTotal += double.parse('${splitGeral[0]}');
            print('TEM 1: $valorTotal');
          }
        }

      }

      print('\n\n\tVALOR TOTAL: ${valorTotal} \n\n');
      var jsonLicit = {
        'nome': modalidadesList[i]['nome'],
        'valorTotal': valorTotal,
        'licitacoes': licitacoesAuxList[0],
      };
      print('LICITACOES LIDAS');
      print(jsonLicit);
      licitacoesList.add(jsonLicit);

    }

    print(licitacoesList);
    print(licitacoesList[2]);
    print('dropDownStatusItems: ');

  }


  /*/// PDF
///
  void pdf(nome) {
    final doc = pw.Document();

    doc.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Hello World!'),
        ),
      ),
    );

    final file = File('$nome.pdf');
    file.writeAsBytesSync(doc.save());
  }*/

}