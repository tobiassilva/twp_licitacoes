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

  List licitacoesNaoVisualizadasList = List();

  Future salvaFavoritos(id) async {
    final homeStore = Provider.of<HomeStore>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idUser = GlobalsVariaveis.empresaUserDB['id'].toString();

    bool naoncontrou = true;

    List<String> myList = (prefs.getStringList('Favoritos') ?? List<String>());
    List<String> myListUser = (prefs.getStringList('userFav') ?? List<String>());

    for(int i=0; i < myList.length; i++){
      //se encontrar na lista, tira dos favoritos e apaga da lista
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
    
    // se não encontrou, aciona o botao favorito e adiciona na lista
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

  Future salvaJaVisualizado(id, _veiodapage) async {
    HomeStore homeStore = HomeStore();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idUser = GlobalsVariaveis.empresaUserDB['id'].toString();

    bool naoncontrou = true;

    List<String> myList = (prefs.getStringList('Visualizado') ?? List<String>());
    List<String> myListUser = (prefs.getStringList('userVis') ?? List<String>());

    for(int i=0; i < myList.length; i++){
      //se encontrar na lista, tira dos favoritos e apaga da lista
      if(myList[i] == id && myListUser[i] == idUser){
        if(_veiodapage){ //se veio pq entrou na pagina nao faz a exclusao
          homeStore.setVisualizado(true);
          return;
        }

        homeStore.setVisualizado(false);

        myList.removeAt(i);
        myListUser.removeAt(i);
        print('myList: $myList');
        print('myListUser: $myListUser');
        await prefs.setStringList('Visualizado', myList);
        await prefs.setStringList('userVis', myListUser);

        naoncontrou = false; //encontrou entao nao roda a outra opcao
        i = myList.length; // para o for
      }
    }

    // se não encontrou, aciona o botao favorito e adiciona na lista
    if(naoncontrou){
      myList.add(id);
      myListUser.add(idUser);
      homeStore.setVisualizado(true);
      print('myList2Viu: $myList');
      print('myListUser2Viu: $myListUser');
      await prefs.setStringList('Visualizado', myList);
      await prefs.setStringList('userVis', myListUser);
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

  /// VERIFICA JÁ SELECIONADOS

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


  Future verificaVisualizados(id) async {
    HomeStore homeStore = HomeStore();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idUser = GlobalsVariaveis.empresaUserDB['id'].toString();

    bool naoncontrou = true;

    List<String> myList = (prefs.getStringList('Visualizado') ?? List<String>());
    List<String> myListUser = (prefs.getStringList('userVis') ?? List<String>());

    print('myListVisu: ${myList.length}');
    print('myListUserVisu: ${myListUser.length}');
    print('myList2Visu: $myList');
    print('myListUser2Visu: $myListUser');

    for(int i=0; i < myList.length; i++){
      if(myList[i] == id && myListUser[i] == idUser){

        homeStore.setVisualizado(true);

        naoncontrou = false; //encontrou entao nao roda a outra opcao
        i = myList.length; // para o for
      }
    }


    if(naoncontrou){
      homeStore.setVisualizado(false);
      print('myList2Visu: $myList');
      print('myListUser2Visu: $myListUser');
    }

  }



  /// VERIFICA AS LICITACOES QUE NAO FORAM VISUALIZADAS AINDA
  Future carregaLicitacoesNaoVisualizadas() async {
    licitacoesNaoVisualizadasList.clear();
    print('ENTROU NESSA CARALHA');

    String idUser = GlobalsVariaveis.empresaUserDB['id'].toString();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> myList = (prefs.getStringList('Visualizado') ?? List<String>());
    List<String> myListUser = (prefs.getStringList('userVis') ?? List<String>());

    print('myList: $myList');
    print('myListUser: $myListUser');

    await encontraLicitacoes(idUser, myList, myListUser);
    print('litas de licitacoes: ${licitacoesNaoVisualizadasList}');
    print('litas de length: ${licitacoesNaoVisualizadasList.length}');

  }

  List listaAux = List();

  Future encontraLicitacoes(idUser, myList, myListUser) async {
    //licitacoesNaoVisualizadasList.addAll(GlobalsVariaveis.dbUserLicitacoes);
    listaAux.clear();


    await procuraAdicionados(myList, myListUser, idUser);

    print('TAMANHO 2 DELE: ${listaAux.length}');

    print('myListUserVisu222: $myListUser');
    bool encontrouLicitacao = false;
    for(int i=0; i < GlobalsVariaveis.dbUserLicitacoes.length; i++){
        for(int j=0; j<listaAux.length; j++){
          print('GlobalsVariaveis.dbUserLicitacoes: ${GlobalsVariaveis.dbUserLicitacoes[i]}');
          if(listaAux[j]['id'].toString() == GlobalsVariaveis.dbUserLicitacoes[i]['id'].toString()){
            print('ENCONTROU ddddddddd $i');
            encontrouLicitacao = true;
          }
        }

        print('licitacoesNaoVisualizadasList ddddddddd $i $encontrouLicitacao');

        if(!encontrouLicitacao){

          print('licitacoesNaoVisualizadasList ddddddddd $i');
          licitacoesNaoVisualizadasList.add(GlobalsVariaveis.dbUserLicitacoes[i]);
        }

        encontrouLicitacao = false;
    }
    print('myListUserVisu333: $myListUser');

  }

  Future procuraAdicionados(myList, myListUser, idUser) async {
    for(int i=0; i < myList.length; i++){
      if(myListUser[i] == idUser){
        //print('myListUser myListUser: ${myListUser[i]} + $idUser');
        for(int j=0; j<GlobalsVariaveis.dbUserLicitacoes.length; j++){
          //print('GlobalsVariaveis.dbUserLicitacoes: ${GlobalsVariaveis.dbUserLicitacoes[j]}');
          //print('myList[i]: ${myList[i]}');
          if(myList[i] == GlobalsVariaveis.dbUserLicitacoes[j]['id'].toString()){
            print('ENCONTROU');
            listaAux.add(GlobalsVariaveis.dbUserLicitacoes[j]);
          }
        }
      }
    }

    print('myListUserVisu111: $myListUser');
    print('TAMANHO DELE: ${listaAux.length}');
  }

}
