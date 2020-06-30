import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twp_licitacoes/globalsVars.dart';
import 'package:twp_licitacoes/home/Store/home_store.dart';

class VisualizadasLicitacoesFunctions{

  BuildContext context;
  VisualizadasLicitacoesFunctions(this.context);

  List licitacoesVisualizadasList = List();

  Future carregaLicitacoesVisualizadas() async {
    licitacoesVisualizadasList.clear();
    print('ENTROU NESSA CARALHA');

    String idUser = GlobalsVariaveis.empresaUserDB['id'].toString();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> myList = (prefs.getStringList('Visualizado') ?? List<String>());
    List<String> myListUser = (prefs.getStringList('userVis') ?? List<String>());

    print('myList: $myList');
    print('myListUser: $myListUser');

    await encontraLicitacoes(idUser, myList, myListUser);
    print('litas de licitacoes: ${licitacoesVisualizadasList}');

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
            licitacoesVisualizadasList.add(GlobalsVariaveis.dbUserLicitacoes[j]);
          }
        }
      }
    }
  }


  Future salvaJaVisualizado(id) async {
    final homeStore = Provider.of<HomeStore>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idUser = GlobalsVariaveis.empresaUserDB['id'].toString();

    bool naoncontrou = true;

    List<String> myList = (prefs.getStringList('Visualizado') ?? List<String>());
    List<String> myListUser = (prefs.getStringList('userVis') ?? List<String>());

    for(int i=0; i < myList.length; i++){
      //se encontrar na lista, tira dos favoritos e apaga da lista
      if(myList[i] == id && myListUser[i] == idUser){

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


  ///VERIFICA JÁ VISUALIZADOS
///
  Future verificaVisualizados(id) async {
    final homeStore = Provider.of<HomeStore>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idUser = GlobalsVariaveis.empresaUserDB['id'].toString();

    bool naoncontrou = true;

    List<String> myList = (prefs.getStringList('Visualizado') ?? List<String>());
    List<String> myListUser = (prefs.getStringList('userVis') ?? List<String>());

    for(int i=0; i < myList.length; i++){
      if(myList[i] == id && myListUser[i] == idUser){

        homeStore.setVisualizado(true);

        naoncontrou = false; //encontrou entao nao roda a outra opcao
        i = myList.length; // para o for
      }
    }


    if(naoncontrou){
      homeStore.setVisualizado(false);
      print('myList2: $myList');
      print('myListUser2: $myListUser');
    }

  }

}