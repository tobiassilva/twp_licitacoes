import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twp_licitacoes/globalsVars.dart';
import 'package:twp_licitacoes/home/Store/home_store.dart';

class NovasLicitacoesFunctions{

  BuildContext context;
  NovasLicitacoesFunctions(this.context);

  Future salvaFavoritos(id) async {
    final homeStore = Provider.of<HomeStore>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idUser = GlobalsVariaveis.empresaUserDB['id'].toString();

    bool naoncontrou = true;

    List<String> myList = (prefs.getStringList('Favoritos') ?? List<String>());
    List<String> myListUser = (prefs.getStringList('userFav') ?? List<String>());

    for(int i=0; i < myList.length; i++){
      if(myList[i] == id && myListUser[i] == idUser){
        homeStore.setFavorito(false);

        myList.removeAt(i);
        myListUser.removeAt(i);
        print('myList: $myList');
        print('myListUser: $myListUser');
        await prefs.setStringList('Favoritos', myList);
        await prefs.setStringList('userFav', myListUser);

        naoncontrou = false; //encontrou entao nao roda a outra opcao
        i = myList.length; // para o for
      }
    }
    
    
    if(naoncontrou){
      myList.add(id);
      myListUser.add(idUser);
      homeStore.setFavorito(true);
      print('myList2: $myList');
      print('myListUser2: $myListUser');
      await prefs.setStringList('Favoritos', myList);
      await prefs.setStringList('userFav', myListUser);
    }
  }

  /*
  Future salvaFavoritos(id) async {
    final homeStore = Provider.of<HomeStore>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> myList = (prefs.getStringList('Favoritos') ?? List<String>());
    if(myList.contains(id)){
      homeStore.setFavorito(false);

      myList.remove(id);
      print('myList: $myList');
      await prefs.setStringList('Favoritos', myList);
    }else{
      myList.add(id);
      homeStore.setFavorito(true);
      print('myList2: $myList');
      await prefs.setStringList('Favoritos', myList);
    }
  }
  */

  Future verificaFavoritos(id) async {
    final homeStore = Provider.of<HomeStore>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idUser = GlobalsVariaveis.empresaUserDB['id'].toString();

    bool naoncontrou = true;

    List<String> myList = (prefs.getStringList('Favoritos') ?? List<String>());
    List<String> myListUser = (prefs.getStringList('userFav') ?? List<String>());

    for(int i=0; i < myList.length; i++){
      if(myList[i] == id && myListUser[i] == idUser){

        homeStore.setFavorito(true);

        naoncontrou = false; //encontrou entao nao roda a outra opcao
        i = myList.length; // para o for
      }
    }


    if(naoncontrou){
      homeStore.setFavorito(false);
      print('myList2: $myList');
      print('myListUser2: $myListUser');
    }

  }

}
