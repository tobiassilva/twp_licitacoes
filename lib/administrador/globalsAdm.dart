
import 'package:flutter/material.dart';

class UsuarioGlobals {

  void setUsuario(String nome, int id, String login){
    print('$nome, $id, $login');
    this.nome = nome;
    this.login = login;
    this.id = id;
  }

  var nome;
  var login;
  int id;

}