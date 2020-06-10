


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:provider/provider.dart';

import 'Store/cadastro_store.dart';
import 'Store/estado_store.dart';

class CadastroFunctions {

  BuildContext context;
  CadastroFunctions(this.context);

  HasuraConnect hasuraConnect = HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

  //Variáveis
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  List listCategorias = List();
  List listSubcategoriasTotal = List();
  List listSubcategoriasAux = List();
  List listEstados = List();

  var user;

  //CadastroUsuárioEmpresa
  final nomeEmpresa = TextEditingController();
  final nomeRepresentante = TextEditingController();
  final email = TextEditingController();
  final telefone = TextEditingController();
  final cnpj = TextEditingController();
  final cep = TextEditingController();
  final logradouro = TextEditingController();
  final numero = TextEditingController();
  final complemento = TextEditingController();
  final cidade = TextEditingController();
  final estado = TextEditingController();
  int idCategoriaEsc;
  int idSubcategoriaEsc;

  int planoEsc;

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

  String queryEstado = """
        query MyQuery {
          estados {
            id
            nome
          }
        }
      """;

  Future getDadosBanco() async {
    listCategorias.clear();
    await getCategoria();
    await getSubcategoria();
    await getEstados();

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

  Future getEstados() async {
    //EstadoStore estadoStore = EstadoStore();
    var snapshot = hasuraConnect.query(queryEstado);
    listEstados.clear();

    await snapshot.then((data) {
      print(data);
      listEstados.addAll(data['data']['estados']);

    });
    //print('cadastroStore: ${cadastroStore.listEstados}');


  }

  /// ENVIA VALORES PARA O BANCO
  /// ENVIA VALORES PARA O BANCO
  ///
  Future<void> enviaDadosEmpresa(List estadosLidos) async {

    final FirebaseAuth _auth = FirebaseAuth.instance;
    user = await _auth.currentUser();

    print('cep: "${cep.text}"');
    print('cidade: "${cidade.text}"');
    print('complemento: "${complemento.text}"');
    print('');
    var data = await hasuraConnect.mutation(queryEmpresa());

    print('33333333333333333#####: $data');
    print('1111111111111111#####: ${data['data']['insert_empresa']['returning']}');
    print('1111111111111111#####: ${data['data']['insert_empresa']['returning'][0]}');
    print('cadastroStore.listEstados[i].id#####: ${estadosLidos}');

    print('cadastroStore.listEstados[i].id#####: ${estadosLidos[0].nome}');
    print('cadastroStore.listEstados[i].id#####: ${estadosLidos.length}');

    for(int i=0;i< estadosLidos.length;i++){
      print('entrou $i');
      if(estadosLidos[i].selec){
        var dataEst = await hasuraConnect.mutation(queryEmpresaEstadoInteresse(
          data['data']['insert_empresa']['returning'][0]['id'],
            estadosLidos[i].id
        ));
        print('dataEst: $dataEst');
      }
    }


    print('AQUIIIII');

    final notesReference = FirebaseDatabase.instance
        .reference()
        .child('userProfile/${user.uid}');

    await notesReference
        .update({'up': 1, 'id_empresa': data['data']['insert_empresa']['returning'][0]['id']});

    var up;
    await notesReference.once().then((DataSnapshot snapshot){
      if(snapshot.value != null){
        up = snapshot.value['up'];
      }
    });

    print('FOI TUDO APARENTEMENTE');


  }

  String queryEmpresa() {
    //CadastroStore cadastroStore = CadastroStore();
    bool termo = true;
    return (
        """
        mutation MyMutation {
          insert_empresa(objects: {cep: "${cep.text}", cidade: "${cidade.text}", cnpj: "${cnpj.text}", complemento: "${complemento.text}", email: "${email.text}", estado: "${estado.text}", id_categoria: $idCategoriaEsc, id_subcategoria: $idSubcategoriaEsc, logradouro: "${logradouro.text}", nome_empresa: "${nomeEmpresa.text}", nome_representante: "${nomeRepresentante.text}", numero: "${numero.text}", plano: $planoEsc, telefone: "${telefone.text}", termos: $termo}) {
            returning {
              id
              id_categoria
              cep
              termos
            }
          }
        }

      """
    );
  }

  String queryEmpresaEstadoInteresse(idEmpresa, idEstado) {
    //CadastroStore cadastroStore = CadastroStore();

    return (
        """
        mutation MyMutation {
          insert_estado_interesse_empresa(objects: {id_empresa: $idEmpresa, id_estado: $idEstado}) {
            returning {
              id
              id_empresa
              id_estado
            }
          }
        }

      """
    );
  }


  //NAVEGAÇÃO ENTRE AS PÁGINAS
  PageController controllerNavigation =
  new PageController(initialPage: 0, viewportFraction: 1.0);

  gotoUser() {
    controllerNavigation.animateToPage(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoInteresses() {
    controllerNavigation.animateToPage(
      1,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoTermos() {
    controllerNavigation.animateToPage(
      2,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoPlano() {
    //controller_minus1To0.reverse(from: 0.0);
    controllerNavigation.animateToPage(
      3,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoPagamento() {
    //controller_minus1To0.reverse(from: 0.0);
    controllerNavigation.animateToPage(
      4,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }
}