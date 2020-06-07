


import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:provider/provider.dart';

import 'cadastro_store.dart';

class CadastroFunctions {

  BuildContext context;
  CadastroFunctions(this.context);

  HasuraConnect hasuraConnect = HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

  //Variáveis
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  List listCategorias = List();
  List listSubcategoriasTotal = List();
  List listSubcategoriasAux = List();

  //CadastroUsuárioEmpresa
  final nomeEmpresa = TextEditingController();
  final nome = TextEditingController();
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

  Future getDadosBanco() async {
    listCategorias.clear();
    await getCategoria();
    await getSubcategoria();

  }

  Future getCategoria() async {
    var snapshot = hasuraConnect.query(queryCategoria);


    await snapshot.then((data) {
      print(data);
      listCategorias.addAll(data['data']['categorias_de_atividades']);
    });
    print('listCategorias: $listCategorias');

  }

  Future getSubcategoria() async {
    var snapshot = hasuraConnect.query(querySubcategoria);
    listSubcategoriasTotal.clear();

    await snapshot.then((data) {
      print(data);
      listSubcategoriasTotal.addAll(data['data']['subcategorias_de_atividades']);
    });
    print('listSubcategorias: $listSubcategoriasTotal');

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