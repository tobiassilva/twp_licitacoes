import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../globals.dart';
import '../cadastro_functions.dart';
import '../cadastro_store.dart';

class InteressesWidget {

  BuildContext context;
  InteressesWidget(this.context);


  Widget interessesPage(){
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  //margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Icon(
                    FontAwesomeIcons.userEdit,
                    color: Colors.green,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.green,
                ),

                Icon(
                  FontAwesomeIcons.chartPie,
                  color: StyleGlobals().primaryColor,
                ),
                Icon(
                    Icons.arrow_forward_ios
                ),
                Icon(
                    FontAwesomeIcons.fileContract
                ),
                Icon(
                    Icons.arrow_forward_ios
                ),
                Icon(
                    FontAwesomeIcons.solidGrinStars
                ),
                Icon(
                    Icons.arrow_forward_ios
                ),
                Icon(
                    FontAwesomeIcons.coins
                ),
              ],
            ),
          ),

          SizedBox(
            height: 25,
          ),

          _formulario_widget(),

          SizedBox(
            height: 45,
          ),

          _botaoSalvarInteresses(),

          SizedBox(
            height: 25,
          ),

        ],
      ),
    );
  }


  Widget _formulario_widget(){

    final cadastroStore = Provider.of<CadastroStore>(context);
    return Container(
      child: Column(
        children: <Widget>[

          /// CATEGORIAS INTERESSE
          ///

          campoCategoria(),

          Observer(
            builder: (_){
              return cadastroStore.temSubcat ?
              campoSubcategoria() :
              Container();
            },
          ),
        ],
      ),
    );


  }


  Widget campoCategoria(){
    final cadastroStore = Provider.of<CadastroStore>(context);
    return         Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
      //color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 20.0,
                spreadRadius: 2.0,
                offset: Offset(
                  10.0,
                  10.0,
                )),
          ]),
      child: GestureDetector(
        onTap: () {
          categoriasDialog();
        },
        child: Observer(
            builder: (_){
              return Row(
                children: <Widget>[

                  Container(
                    decoration: BoxDecoration(
                        color: StyleGlobals().tertiaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(7))),
                    height: 60,
                    width: 43,
                    padding: EdgeInsets.only(left: 8, right: 8),
                    margin: EdgeInsets.only(right: 7),
                    child:
                    cadastroStore.selCategoria
                        ? Icon(
                      FontAwesomeIcons.check,
                      color: StyleGlobals().secundaryColor,
                      size: 22,
                    )
                        : Icon(
                      FontAwesomeIcons.minusCircle,
                      color: StyleGlobals().secundaryColor,
                      size: 22,
                    ),

                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text(cadastroStore.selCategoria ?
                          cadastroStore.nomeCatEscolhido :
                          'selecione uma categoria',
                            style: TextStyle(color: cadastroStore.selCategoria ? Colors.black : Colors.grey[500]),),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: StyleGlobals().tertiaryColor,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topLeft: Radius.circular(7),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(7))
                          ),
                          height: 60,
                          width: 43,
                          padding: EdgeInsets.only(left: 2, right: 2),
                          margin: EdgeInsets.only(left: 7),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
        ),
      ),
    );
  }


  /// CAMPO DE SUBCATEGORIAS
  ///
  Widget campoSubcategoria(){
    final cadastroFunctions = Provider.of<CadastroFunctions>(context);
    final cadastroStore = Provider.of<CadastroStore>(context);
    return         Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
      //color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 20.0,
                spreadRadius: 2.0,
                offset: Offset(
                  10.0,
                  10.0,
                )),
          ]),
      child: GestureDetector(
        onTap: () {
          subcategoriasDialog();
        },
        child: Observer(
            builder: (_){
              return Row(
                children: <Widget>[

                  Container(
                    decoration: BoxDecoration(
                        color: StyleGlobals().tertiaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(7))),
                    height: 60,
                    width: 43,
                    padding: EdgeInsets.only(left: 8, right: 8),
                    margin: EdgeInsets.only(right: 7),
                    child:
                    cadastroStore.selSubcategoria
                        ? Icon(
                      FontAwesomeIcons.check,
                      color: StyleGlobals().secundaryColor,
                      size: 22,
                    )
                        : Icon(
                      FontAwesomeIcons.minusCircle,
                      color: StyleGlobals().secundaryColor,
                      size: 22,
                    ),

                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text(cadastroStore.selSubcategoria ?
                          cadastroStore.nomeSubcatEscolhido :
                          'selecione uma subcategoria',
                            style: TextStyle(color: cadastroStore.selSubcategoria ? Colors.black : Colors.grey[500]),),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: StyleGlobals().tertiaryColor,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topLeft: Radius.circular(7),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(7))
                          ),
                          height: 60,
                          width: 43,
                          padding: EdgeInsets.only(left: 2, right: 2),
                          margin: EdgeInsets.only(left: 7),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
        ),
      ),
    );
  }

  Widget _botaoSalvarInteresses(){

    //final loginStore = Provider.of<LoginStore>(context);
    final cadastroFunctions = Provider.of<CadastroFunctions>(context);

    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () async {
          print('AAAAAAAAA');
          cadastroFunctions.gotoTermos();
        },
        child: Row(
          children: <Widget>[
            Expanded(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: StyleGlobals().colorGradiente,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                            offset: Offset(
                              1.0,
                              1.0,
                            )),
                      ]
                  ),
                  child: Center(
                    child: Text('PRÓXIMO',
                      style: TextStyle(
                          color: StyleGlobals().textColorSecundary,
                          fontSize: StyleGlobals().sizeSubtitulo
                      ),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }



  Future<bool> _onWillPop() {
    Navigator.of(context).pop(false);
  }

  ///Dialog CATEGORIAS
  Future<void> categoriasDialog() async {
    print('EEEEEEE');
    final cadastroStore = Provider.of<CadastroStore>(context, listen: false);
    final cadastroFunctions = Provider.of<CadastroFunctions>(context, listen: false);
    print('cadastroFunctions.listCategorias.length: ${cadastroFunctions.listCategorias.length}');

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return MaterialApp(
          home: WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                margin: EdgeInsets.fromLTRB(30, 35, 30, 30),
                decoration: new BoxDecoration(
                    color: StyleGlobals().secundaryColor,
                    border: new Border.all(
                      width: 1.0,
                      color: Colors.transparent,
                    ),
                    borderRadius:
                    new BorderRadius.all(new Radius.circular(20.0))),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 40,
                      decoration: new BoxDecoration(
                          color: StyleGlobals().primaryColor,
                          borderRadius: new BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                                IconData(
                                  57676,
                                  fontFamily: 'MaterialIcons',
                                ),
                              color: StyleGlobals().secundaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Scrollbar(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: ListView.builder(
                              padding: EdgeInsets.only(top: 10),
                              itemCount: cadastroFunctions.listCategorias.length,
                              itemBuilder: (_, index) {
                                return Column(
                                  children: <Widget>[
                                    FlatButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: () async {
                                        cadastroStore.cadastraCategoria(cadastroFunctions.listCategorias[index]['nome']);
                                        cadastroStore.setSelCategoria(true);
                                        cadastroFunctions.idCategoriaEsc = await cadastroFunctions.listCategorias[index]['id'];

                                        await selListaSubcategorias();
                                        cadastroStore.setLimpaSubcategoria();

                                        Navigator.pop(context);
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: Text(
                                                  cadastroFunctions.listCategorias[index]['nome'],
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: StyleGlobals().textColorForte,
                                                    fontSize: StyleGlobals().sizeTextMedio
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.black45,
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  Future selListaSubcategorias(){
    final cadastroStore = Provider.of<CadastroStore>(context, listen: false);
    final cadastroFunctions = Provider.of<CadastroFunctions>(context, listen: false);

    cadastroFunctions.listSubcategoriasAux.clear();
    cadastroStore.setTemSubcat(false);

    print('id: ${cadastroFunctions.idCategoriaEsc}');
    print('cadastroFunctions.listSubcategoriasTotal.length: ${cadastroFunctions.listSubcategoriasTotal.length}');
    for(int i = 0; i < cadastroFunctions.listSubcategoriasTotal.length; i++){
      if(cadastroFunctions.listSubcategoriasTotal[i]['id_categoria'] == cadastroFunctions.idCategoriaEsc){
        cadastroFunctions.listSubcategoriasAux.add(cadastroFunctions.listSubcategoriasTotal[i]);
        cadastroStore.setTemSubcat(true);
        print('id: ${cadastroFunctions.listSubcategoriasTotal[i]}');
      }
    }
  }

  ///Dialog SUBCATEGORIAS
  Future<void> subcategoriasDialog() async {
    print('EEEEEEE');
    final cadastroStore = Provider.of<CadastroStore>(context, listen: false);
    final cadastroFunctions = Provider.of<CadastroFunctions>(context, listen: false);
    print('cadastroFunctions.listCategorias.length: ${cadastroFunctions.listSubcategoriasAux.length}');

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return MaterialApp(
          home: WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                margin: EdgeInsets.fromLTRB(30, 35, 30, 30),
                decoration: new BoxDecoration(
                    color: StyleGlobals().secundaryColor,
                    border: new Border.all(
                      width: 1.0,
                      color: Colors.transparent,
                    ),
                    borderRadius:
                    new BorderRadius.all(new Radius.circular(20.0))),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 40,
                      decoration: new BoxDecoration(
                          color: StyleGlobals().primaryColor,
                          borderRadius: new BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              IconData(
                                57676,
                                fontFamily: 'MaterialIcons',
                              ),
                              color: StyleGlobals().secundaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Scrollbar(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: ListView.builder(
                              padding: EdgeInsets.only(top: 10),
                              itemCount: cadastroFunctions.listSubcategoriasAux.length,
                              itemBuilder: (_, index) {
                                return Column(
                                  children: <Widget>[
                                    FlatButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: () {
                                        cadastroStore.cadastraSubcategoria(cadastroFunctions.listSubcategoriasAux[index]['nome']);
                                        cadastroStore.setSelSubcategoria(true);
                                        cadastroFunctions.idSubcategoriaEsc = cadastroFunctions.listSubcategoriasAux[index]['id'];

                                        Navigator.pop(context);
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: Text(
                                                  cadastroFunctions.listSubcategoriasAux[index]['nome'],
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: StyleGlobals().textColorForte,
                                                      fontSize: StyleGlobals().sizeTextMedio
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.black45,
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }


}