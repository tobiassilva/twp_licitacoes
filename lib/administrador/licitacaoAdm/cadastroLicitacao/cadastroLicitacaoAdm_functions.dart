import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:provider/provider.dart';

import 'cadastroLicitacaoAdm_store.dart';


class CadastroLicitacaoAdmFunctions {

  BuildContext context;
  CadastroLicitacaoAdmFunctions(this.context);


  HasuraConnect hasuraConnect = HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');


  List listCategorias = List();
  List listSubcategoriasTotal = List();
  List listSubcategoriasAux = List();
  List listOrgaos = List();
  List listModalidades = List();
  List listSituacoes = List();

  //CadastroUsuárioEmpresa
  final nomeLicitacao = TextEditingController();
  final objetoResumido = TextEditingController();
  final edital = TextEditingController();
  final link = TextEditingController();
  final situacao = TextEditingController();
  final observacoes = TextEditingController();

  //final orgao = TextEditingController();
  //final categoria = TextEditingController();
  //final subcategoria = TextEditingController();
  //final dataLimiteParaCRCorgao = TextEditingController();
  //final dataLimiteEnviodeDocumentos= TextEditingController();
  //final dataHoradaSessaoPublica = TextEditingController();
  //final modalidadedeLicitacao = TextEditingController();

  int idCategoria;
  int idSubcategoria;
  int idOrgao;
  int idModalidade;
  int idSituacao;

  var precoEstimado = new MoneyMaskedTextController(leftSymbol: 'R\$ ');



  // Variáveis Banco
  String queryCategoria = """
        query MyQuery {
          categorias_de_atividades {
            id
            nome
          }
        }
      """;

  String querySubcategoria = """
        query MyQuery {
          subcategorias_de_atividades {
            id
            id_categoria
            nome
          }
        }
      """;

  String queryOrgaos = """
    query MyQuery {
      orgao {
        id
        nome
        cidade
      }
    }
  """;

  String queryModalidades = """
    query MyQuery {
      modalidade_licitacao {
        nome
        id
      }
    }
  """;

  String querySituacao = """
    query MyQuery {
      situacao_licitacao {
        id
        nome
      }
    }
  """;


  Future getDadosBanco() async {
    listCategorias.clear();
    await getCategoria();
    await getSubcategoria();
    await getOrgaos();
    await getModalidades();
    await getSituacoes();


    //cadastroStore.setCarregando();
  }


  Future getCategoria() async {
    var snapshot = hasuraConnect.query(queryCategoria);


    await snapshot.then((data) {
      print(data);
      listCategorias.addAll(data['data']['categorias_de_atividades']);
    });
    //print('listCategorias: $listCategorias');

  }

  Future getSubcategoria() async {
    var snapshot = hasuraConnect.query(querySubcategoria);
    listSubcategoriasTotal.clear();

    await snapshot.then((data) {
      print(data);
      listSubcategoriasTotal.addAll(data['data']['subcategorias_de_atividades']);
    });
    //print('listSubcategorias: $listSubcategoriasTotal');

  }

  Future getOrgaos() async {
    var snapshot = hasuraConnect.query(queryOrgaos);
    listOrgaos.clear();

    await snapshot.then((data) {
      print(data);
      listOrgaos.addAll(data['data']['orgao']);
    });
    //print('listSubcategorias: $listSubcategoriasTotal');

  }

  Future getModalidades() async {
    var snapshot = hasuraConnect.query(queryModalidades);
    listModalidades.clear();

    await snapshot.then((data) {
      print(data);
      listModalidades.addAll(data['data']['modalidade_licitacao']);
    });
    //print('listSubcategorias: $listSubcategoriasTotal');

  }

  Future getSituacoes() async {
    var snapshot = hasuraConnect.query(querySituacao);
    listSituacoes.clear();

    await snapshot.then((data) {
      print(data);
      listSituacoes.addAll(data['data']['situacao_licitacao']);
    });
    //print('listSubcategorias: $listSubcategoriasTotal');

  }


  /// ENVIA VALORES PARA O BANCO
  /// ENVIA VALORES PARA O BANCO
  ///
  Future<bool> enviaDadosLicitacao(
      nomeOrgaoEscolhido,
      nomeCatEscolhido,
      nomeSubcatEscolhido,
      dataLimiteCRC,
      dataLimiteEnvioDoc,
      dataSessaoPublica,
      horaSessaoPublica,
      situacao,
      modalidade
      ) async {

    //final cadastroLicitacaoAdmStore = Provider.of<CadastroLicitacaoAdmStore>(context, listen: false);

    print('nomeLicitacao: "${nomeLicitacao.text}"');
    print('objetoResumido: "${objetoResumido.text}"');
    print('edital: "${edital.text}"');
    print('link: "${link.text}"');
    print('observacoes: "${observacoes.text}"');
    print('precoEstimado: "${precoEstimado.text}"');

    print('');
    print('');

    print('idCategoria: "${idCategoria}"');
    print('idSubcategoria: "${idSubcategoria}"');
    print('idOrgao: "${idOrgao}"');
    print('idModalidade: "${idModalidade}"');
    print('idSituacao: "${idSituacao}"');

    print('orgao: "${nomeOrgaoEscolhido}"');
    print('nomeCatEscolhido: "${nomeCatEscolhido}"');
    print('nomeSubcatEscolhido: "${nomeSubcatEscolhido}"');
    print('dataLimiteCRC: "${dataLimiteCRC}"');
    print('dataLimiteEnvioDoc: "${dataLimiteEnvioDoc}"');
    print('dataSessaoPublica: "${dataSessaoPublica}"');
    print('horaSessaoPublica: "${horaSessaoPublica}"');
    print('situacao: "${situacao}"');
    print('modalidade: "${modalidade}"');

    print('');
    var data = await hasuraConnect.mutation(queryLicitacao(
        nomeOrgaoEscolhido,
        nomeCatEscolhido,
        nomeSubcatEscolhido,
        dataLimiteCRC,
        dataLimiteEnvioDoc,
        dataSessaoPublica,
        horaSessaoPublica,
        situacao,
        modalidade));

    print('33333333333333333#####: $data');
    print('1111111111111111#####: ${data['data']['insert_licitacoes']['returning']}');
    //print('1111111111111111#####: ${data['data']['insert_empresa']['returning'][0]}');
    //print('cadastroStore.listEstados[i].id#####: ${estadosLidos}');

    //print('cadastroStore.listEstados[i].id#####: ${estadosLidos[0].nome}');
    //print('cadastroStore.listEstados[i].id#####: ${estadosLidos.length}');


    print('AQUIIIII');

    print('FOI TUDO APARENTEMENTE');

    return true;
  }

  String queryLicitacao(
      nomeOrgaoEscolhido,
      nomeCatEscolhido,
      nomeSubcatEscolhido,
      dataLimiteCRC,
      dataLimiteEnvioDoc,
      dataSessaoPublica,
      horaSessaoPublica,
      situacao,
      modalidade) {
    //CadastroStore cadastroStore = CadastroStore();

    return (
        """
        mutation MyMutation {
          insert_licitacoes(
            objects: {
              id_categoria_de_atividade: $idCategoria, 
              id_modalidade_de_licitacao: $idModalidade, 
              id_orgao: $idModalidade, 
              id_situacao: $idSituacao, 
              id_subcategoria_de_atividade: $idSubcategoria, 
              nome: "${nomeLicitacao.text}", 
              categoria_de_atividade: "$nomeCatEscolhido", 
              subcategoria_de_atividade: "$nomeSubcatEscolhido", 
              orgao: "$nomeOrgaoEscolhido", 
              modalidade_de_licitacao: "$modalidade", 
              situacao: "$situacao", 
              preco_estimado: "${precoEstimado.text}", 
              data_limite_para_crc_orgao: "$dataLimiteCRC", 
              data_limite_envio_de_documentos: "$dataLimiteEnvioDoc", 
              data_e_hora_da_sessao_publica: "$dataSessaoPublica - $horaSessaoPublica", 
              edital: "${edital.text}", 
              link: "${link.text}", 
              observacoes: "${observacoes.text}", 
              objeto_resumido: "${objetoResumido.text}"}) {
            returning {
              id
              nome
            }
          }
        }
      """
    );
  }

}