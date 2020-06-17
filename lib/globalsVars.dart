import 'package:flutter/material.dart';


class GlobalsVariaveis{

  ///DADOS DE PESQUISA USUÁRIO
  ///
  static List dbUserEmpresa = List();
  static List dbUserLicitacoes = List();
  static List dbUserOrgaos = List();
  static List dbUserEstados = List();
  static List dbUserEstadoInteresse = List();

  static var nomeUser;
  static var emailUser;
  static int idUser;

  static var empresaUserFirebase;
  static var empresaUserDB;

  void setEmpresaUserFirebase(value){
    print('AAAAAAAAAAAAA VALUE: $value');
    empresaUserFirebase = value;
  }

}