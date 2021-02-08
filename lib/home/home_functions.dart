import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:twp_licitacoes/globals.dart';

import '../globalsVars.dart';

class HomeFunctions {

  BuildContext context;
  HomeFunctions(this.context);

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  HasuraConnect _hasuraConnect = HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var user;


  String queryEmpresa(id) {
    return """
    query MyQuery {
      empresa(where: {id: {_eq: $id}}) {
        cep
        cidade
        cnpj
        complemento
        email
        estado
        id_categoria
        id_subcategoria
        logradouro
        nome_empresa
        nome_representante
        numero
        id
        plano
        telefone
        termos
      }
    }

    """;
  }


  String queryLicitacoes(idCat, idOrgao) {
    return """
      query MyQuery {
        licitacoes(where: {id_categoria_de_atividade: {_eq: $idCat}, _and: {id_orgao: {_eq: $idOrgao}}}) {
          id
          categoria_de_atividade
          data_e_hora_da_sessao_publica
          data_limite_envio_de_documentos
          data_limite_para_crc_orgao
          edital
          link
          modalidade_de_licitacao
          objeto_resumido
          observacoes
          orgao
          preco_estimado
          situacao
          subcategoria_de_atividade
          nome
          id_categoria_de_atividade
          id_modalidade_de_licitacao
          id_orgao
          id_situacao
          id_subcategoria_de_atividade
        }
      }

  """;
  }


  String queryOrgaos(idEst) {
    return """
      query MyQuery {
        orgao(where: {id_estados: {_eq: $idEst}}) {
          cep
          cidade
          cnpj
          email
          endereco
          id
          id_estados
          id_tipo_orgao
          nome
          telefone
        }
      }
    
      """;
  }


  String queryEstInt(idEmp) {
    return """
      query MyQuery {
        estado_interesse_empresa(where: {id_empresa: {_eq: $idEmp}}) {
          id
          id_empresa
          id_estado
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


  Future getDadosBanco() async {

    //GlobalsVariaveis GlobalsVariaveis = GlobalsVariaveis();

    GlobalsVariaveis.dbUserLicitacoes.clear();
    GlobalsVariaveis.dbUserOrgaos.clear();
    GlobalsVariaveis.dbUserEstadoInteresse.clear();
    GlobalsVariaveis.dbUserEmpresa.clear();
    GlobalsVariaveis.dbUserEstados.clear();


    bool conexaoInternet = await resultadoInternet();

    if(conexaoInternet){
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AlertDialog(
            title: Text('Você precisa estar Conectado para esta ação'),
            //backgroundColor: Colors.transparent,
            content: Icon(
              Icons.signal_wifi_off,
              color: Colors.red,
              size: 60,
            ),

            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  //await detalhesEmpresasAdmFunctions.deleteEmpresaAdm(jsonEmpresa['id']);
                },
                child: Text('OK',
                  style: TextStyle(
                    fontSize: StyleGlobals().sizeTextMedio,
                    color: StyleGlobals().tertiaryColor,
                  ),
                ),
              ),
            ],
          )));
      //scaffoldKeyHomeAdm.currentState.showSnackBar(SnackBar(content: Text('SEM INTERNET. Conecte-se a internet e tente novamente')));
      return;
    }


    var empresaFB = await getEmpresaFirebase();



    /// ENCONTRA OS DADOS REFERENTES A EMPRESA QUE ESTÁ LOGADA
    print('EMPRESA');
    print('EMPRESA: ${GlobalsVariaveis.empresaUserFirebase}');
    print('EMPRESA: ${empresaFB}');
    var snapshotEmp = await _hasuraConnect.query(queryEmpresa(empresaFB['id_empresa']));

    print(snapshotEmp);
    GlobalsVariaveis.empresaUserDB = await snapshotEmp['data']['empresa'][0];
    GlobalsVariaveis.nomeUser = GlobalsVariaveis.empresaUserDB['nome_representante'];


    /// ENCONTRA OS ESTADOS DE INTERESSE DA EMPRESA
    print('ESTADO INTERESSE EMPRESA');
    var snapshotEstInt = await _hasuraConnect.query(queryEstInt(GlobalsVariaveis.empresaUserDB['id']));

    print(snapshotEstInt);
    print(snapshotEstInt['data']['estado_interesse_empresa']);
    /*for(int i = 0; i < snapshotEstInt['data']['estado_interesse_empresa'].length; i++){
      print('ENTROU INTERESSE $i x');
      GlobalsVariaveis.dbUserEstadoInteresse.add(snapshotEstInt['data']['estado_interesse_empresa'][i]);
    }*/
    GlobalsVariaveis.dbUserEstadoInteresse.addAll(snapshotEstInt['data']['estado_interesse_empresa']);


    /// ENCONTRA OS ÓRGÃOS DOS ESTADOS DE INTERESSE DA EMPRESA
    print('ORGAOS');
    print('ESTADOS QTDE ${GlobalsVariaveis.dbUserEstadoInteresse.length}');
    for(int i = 0; i < GlobalsVariaveis.dbUserEstadoInteresse.length; i++){
      print('ENTROU $i ORGAOS');

      var snapshotOrg = await _hasuraConnect.query(queryOrgaos(GlobalsVariaveis.dbUserEstadoInteresse[i]['id_estado']));



      GlobalsVariaveis.dbUserOrgaos.addAll(snapshotOrg['data']['orgao']);
      print('snapshotOrg: ${snapshotOrg['data']['orgao'].length}');
      print('dbUserOrgaos: ${GlobalsVariaveis.dbUserOrgaos.length}');
    }


    print('LICITACOES');
    for(int i = 0; i < GlobalsVariaveis.dbUserOrgaos.length; i++){
      var snapshotLic = await _hasuraConnect.query(queryLicitacoes(GlobalsVariaveis.empresaUserDB['id_categoria'], GlobalsVariaveis.dbUserOrgaos[i]['id']));

      print(snapshotLic);
      GlobalsVariaveis.dbUserLicitacoes.addAll(snapshotLic['data']['licitacoes']);
    }
    print('qtde Licitações: ${GlobalsVariaveis.dbUserLicitacoes.length}');


  }


  Future getEmpresaFirebase() async {

    //GlobalsVariaveis GlobalsVariaveis = GlobalsVariaveis();

    user = await _auth.currentUser();

    final notesReference = FirebaseDatabase.instance
        .reference()
        .child('userProfile/${user.uid}');

    print('AQUIIIII');

    await notesReference.once().then((DataSnapshot snapshot){
      if(snapshot.value != null){
        GlobalsVariaveis.empresaUserFirebase = snapshot.value;
        //GlobalsVariaveis.setEmpresaUserFirebase(snapshot.value);
      }
    });
    print('empresaUserFirebase: ${GlobalsVariaveis.empresaUserFirebase}');
    return GlobalsVariaveis.empresaUserFirebase;
  }

}