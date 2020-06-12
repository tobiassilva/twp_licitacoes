import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:provider/provider.dart';

import '../globalsAdm.dart' as globalsAdm;
import 'homeAdm_store.dart';

class HomeAdmFunctions {

  BuildContext context;
  HomeAdmFunctions(this.context);

  HasuraConnect _hasuraConnect = HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

  GlobalKey<ScaffoldState> scaffoldKeyHomeAdm = GlobalKey<ScaffoldState>();


  String queryEmpresa = """
  query MyQuery {
    empresa {
      id
      id_categoria
      id_subcategoria
      logradouro
      nome_empresa
      cep
      cidade
      cnpj
      complemento
      email
      estado
      nome_representante
      numero
      plano
      telefone
      termos
    }
  }
  """;


  String queryLicitacoes = """
  query MyQuery {
    licitacoes {
      categoria_de_atividade
      data_e_hora_da_sessao_publica
      data_limite_envio_de_documentos
      data_limite_para_crc_orgao
      edital
      id
      link
      modalidade_de_licitacao
      objeto_resumido
      observacoes
      orgao
      preco_estimado
      situacao
      subcategoria_de_atividade
    }
  }
  """;


  String queryOrgaos = """
  query MyQuery {
    orgao {
      id
      id_estados
      id_tipo_orgao
      nome
      telefone
      cep
      cidade
      cnpj
      email
      endereco
    }
  }
  """;


  String queryEstados = """
  query MyQuery {
    estados {
      id
      nome
    }
  }
  """;

  Future _zeraListas(){
    globalsAdm.dbEmpresas.clear();
    globalsAdm.dbLicitacoes.clear();
    globalsAdm.dbOrgaos.clear();
    globalsAdm.dbEstados.clear();
  }

  Future getDadosBanco() async {

    await _zeraListas();

    print('EMPRESA');
    var snapshotEmp = await _hasuraConnect.query(queryEmpresa);

    print(snapshotEmp);
    globalsAdm.dbEmpresas.addAll(snapshotEmp['data']['empresa']);

    print('LICITACOES');
    var snapshotLic = await _hasuraConnect.query(queryLicitacoes);

    print(snapshotLic);
    globalsAdm.dbLicitacoes.addAll(snapshotLic['data']['licitacoes']);

    print('ORGAOS');
    var snapshotOrg = await _hasuraConnect.query(queryOrgaos);

    print(snapshotOrg);
    globalsAdm.dbOrgaos.addAll(snapshotOrg['data']['orgao']);

    print('ESTADOS');
    var snapshotEst = await _hasuraConnect.query(queryEstados);

    print(snapshotEst);
    globalsAdm.dbEstados.addAll(snapshotEst['data']['estados']);

  }

}