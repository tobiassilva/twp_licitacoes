import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twp_licitacoes/globalsVars.dart';

class FavoritasLicitacoesFunctions {

  BuildContext context;
  FavoritasLicitacoesFunctions(this.context);

  List licitacoesFavoritasList = List();

  Future carregaLicitacoesFavoritas() async {
    licitacoesFavoritasList.clear();
    print('ENTROU NESSA CARALHA');

    String idUser = GlobalsVariaveis.empresaUserDB['id'].toString();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool naoncontrou = true;

    List<String> myList = (prefs.getStringList('Favoritos') ?? List<String>());
    List<String> myListUser = (prefs.getStringList('userFav') ?? List<String>());

    print('myList: $myList');
    print('myListUser: $myListUser');

    await encontraLicitacoes(idUser, myList, myListUser);
    print('litas de licitacoes: ${licitacoesFavoritasList}');

  }

  Future encontraLicitacoes(idUser, myList, myListUser) async {
    for(int i=0; i < myList.length; i++){
      if(myListUser[i] == idUser){
        print('myListUser myListUser: ${myListUser[i]} + $idUser');
        for(int j=0; j<GlobalsVariaveis.dbUserLicitacoes.length; j++){
          print('GlobalsVariaveis.dbUserLicitacoes: ${GlobalsVariaveis.dbUserLicitacoes[j]}');
          print('myList[i]: ${myList[i]}');
          if(myList[i] == GlobalsVariaveis.dbUserLicitacoes[j]['id'].toString()){
            print('ENTROU AQUEEEEE');
            licitacoesFavoritasList.add(GlobalsVariaveis.dbUserLicitacoes[j]);
          }
        }
      }
    }
  }

}