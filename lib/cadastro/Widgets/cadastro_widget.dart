import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/globals.dart';

import '../cadastro_functions.dart';
import '../cadastro_store.dart';

class CadastroWidget {

  BuildContext context;
  CadastroWidget(this.context);


  Widget userPage(){
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
                    color: StyleGlobals().primaryColor,
                  ),
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


          _botaoSalvarUser(),

          SizedBox(
            height: 25,
          ),

        ],
      ),
    );
  }

  Widget _formulario_widget() {

    //final cadastroStore = Provider.of<CadastroStore>(context);
    final cadastroFunctions = Provider.of<CadastroFunctions>(context);

    return Container(
      child: Column(
        children: <Widget>[

          /// CAMPO NOME
          Container(
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
            child: Row(
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
                  child: Icon(
                    FontAwesomeIcons.userAlt,
                    color: StyleGlobals().secundaryColor,
                    size: 22,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new TextFormField(
                          style: TextStyle(
                              color: StyleGlobals().textColorForte,
                              fontSize: StyleGlobals().sizeSubtitulo
                          ),
                          //keyboardType: TextInputType.,
                          controller: cadastroFunctions.nome,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'digite seu nome',
                            hintStyle: TextStyle(
                                color: StyleGlobals().textColorFraco,
                                fontSize: StyleGlobals().sizeTextMedio
                            ),
                          ),

                        ),

                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          /// CAMPO NOME CONTATO REPRESENTANTE
          Container(
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
            child: Row(
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
                  child: Icon(
                    FontAwesomeIcons.userAlt,
                    color: StyleGlobals().secundaryColor,
                    size: 22,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new TextFormField(
                          style: TextStyle(
                              color: StyleGlobals().textColorForte,
                              fontSize: StyleGlobals().sizeSubtitulo
                          ),
                          //keyboardType: TextInputType.,
                          controller: cadastroFunctions.nome,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'digite seu nome',
                            hintStyle: TextStyle(
                                color: StyleGlobals().textColorFraco,
                                fontSize: StyleGlobals().sizeTextMedio
                            ),
                          ),

                        ),

                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 15,
          ),

          /// CAMPO EMAIL
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
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
            child: Row(
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
                  child: Icon(
                    FontAwesomeIcons.at,
                    color: StyleGlobals().secundaryColor,
                    size: 22,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new TextFormField(
                          style: TextStyle(
                              color: StyleGlobals().textColorForte,
                              fontSize: StyleGlobals().sizeSubtitulo
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: cadastroFunctions.email,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'digite seu email',
                            hintStyle: TextStyle(
                                color: StyleGlobals().textColorFraco,
                                fontSize: StyleGlobals().sizeTextMedio
                            ),
                          ),

                        ),

                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 15,
          ),

          /// CAMPO TELEFONE
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
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
            child: Row(
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
                  child: Icon(
                    FontAwesomeIcons.phoneAlt,
                    color: StyleGlobals().secundaryColor,
                    size: 22,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new TextFormField(
                          style: TextStyle(
                              color: StyleGlobals().textColorForte,
                              fontSize: StyleGlobals().sizeSubtitulo
                          ),
                          keyboardType: TextInputType.phone,

                          //enabled: false,
                          controller: cadastroFunctions.telefone,
                          //obscureText: !loginStore.verSenha,
                          //onChanged: loginStore.setSenha,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'digite seu telefone',
                            hintStyle: TextStyle(
                              color: StyleGlobals().textColorFraco,
                              fontSize: StyleGlobals().sizeTextMedio
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 15,
          ),

          /// CAMPO CNPJ
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
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
            child: Row(
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
                  child: Icon(
                    FontAwesomeIcons.userTie,
                    color: StyleGlobals().secundaryColor,
                    size: 22,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new TextFormField(
                          style: TextStyle(
                            color: StyleGlobals().textColorForte,
                            fontSize: StyleGlobals().sizeSubtitulo
                          ),
                          keyboardType: TextInputType.number,

                          //enabled: false,
                          controller: cadastroFunctions.cnpj,
                          //obscureText: !loginStore.verSenha,
                          //onChanged: loginStore.setSenha,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'informe seu CNPJ',
                            hintStyle: TextStyle(
                                color: StyleGlobals().textColorFraco,
                                fontSize: StyleGlobals().sizeTextMedio
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }


  Widget _botaoSalvarUser(){

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



}