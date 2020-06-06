


import 'package:flutter/material.dart';

class CadastroFunctions {

  BuildContext context;
  CadastroFunctions(this.context);

  //Variáveis
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  //CadastroUsuário
  final nome = TextEditingController();
  final email = TextEditingController();
  final telefone = TextEditingController();
  final cnpj = TextEditingController();





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

  gotoTermos() {
    controllerNavigation.animateToPage(
      1,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoPlano() {
    //controller_minus1To0.reverse(from: 0.0);
    controllerNavigation.animateToPage(
      2,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoPagamento() {
    //controller_minus1To0.reverse(from: 0.0);
    controllerNavigation.animateToPage(
      3,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }
}