import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/globals.dart';

import '../cadastro_functions.dart';
import '../Store/cadastro_store.dart';

class CadastroWidget {

  BuildContext context;
  CadastroWidget(this.context);


  var maskTextCNPJ = MaskTextInputFormatter(
      mask: "##.###.###/####-##", filter: {"#": RegExp(r'[0-9]')});

  var maskTextCEP = MaskTextInputFormatter(
      mask: "##.###-###", filter: {"#": RegExp(r'[0-9]')});

  var maskTextTel = MaskTextInputFormatter(
      mask: "(##)####-#####", filter: {"#": RegExp(r'[0-9]')});

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
                  FontAwesomeIcons.chartPie
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

          /// CAMPO NOME EMPRESA
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
                    FontAwesomeIcons.solidBuilding,
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
                          controller: cadastroFunctions.nomeEmpresa, ///MUDAR CONTROLADOR
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'digite o nome da Empresa',
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
                          controller: cadastroFunctions.nomeRepresentante,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'digite seu nome (Representante)',
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
                            hintText: 'email',
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
                          inputFormatters: [maskTextTel],

                          //enabled: false,
                          controller: cadastroFunctions.telefone,
                          //obscureText: !loginStore.verSenha,
                          onChanged: (value){
                            if(cadastroFunctions.telefone.text.length > 13){
                              cadastroFunctions.telefone.value = maskTextTel.updateMask("(##)#####-####");
                            } else {
                              if(cadastroFunctions.telefone.text.length == 13){

                                cadastroFunctions.telefone.value = maskTextTel.updateMask("(##)####-#####");
                              }
                          }
                          },
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'digite o telefone da empressa',
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
                          inputFormatters: [maskTextCNPJ],
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
                            hintText: 'CNPJ',
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
            height: 25,
          ),

          /// ENDEREÇO
          ///

          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text(
              'ENDEREÇO DA EMPRESA',
              style: TextStyle(
                fontSize: StyleGlobals().sizeSubtitulo,
                color: StyleGlobals().textColorForte,
              ),
              textAlign: TextAlign.center,

            ),
          ),

          SizedBox(
            height: 25,
          ),

          /// CAMPO CEP
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
                    FontAwesomeIcons.mapMarkerAlt,
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
                          inputFormatters: [maskTextCEP],

                          //enabled: false,
                          controller: cadastroFunctions.cep,
                          //obscureText: !loginStore.verSenha,
                          //onChanged: loginStore.setSenha,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'CEP',
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
            height: 25,
          ),

          /// CAMPO LOGRADOURO
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
                    FontAwesomeIcons.road,
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
                          keyboardType: TextInputType.text,

                          //enabled: false,
                          controller: cadastroFunctions.logradouro,
                          //obscureText: !loginStore.verSenha,
                          //onChanged: loginStore.setSenha,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'logradouro',
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
            height: 25,
          ),

          /// CAMPO NUMERO
          Row(
            children: <Widget>[
              Container(
                height: 60,
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                width: MediaQuery.of(context).size.width/2,
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
                        Icons.filter_1,
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
                              keyboardType: TextInputType.text,

                              //enabled: false,
                              controller: cadastroFunctions.numero,
                              //obscureText: !loginStore.verSenha,
                              //onChanged: loginStore.setSenha,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'numero',
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

          SizedBox(
            height: 25,
          ),

          ///COMPLEMENTO

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
                    FontAwesomeIcons.mapSigns,
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
                          keyboardType: TextInputType.text,

                          //enabled: false,
                          controller: cadastroFunctions.complemento,
                          //obscureText: !loginStore.verSenha,
                          //onChanged: loginStore.setSenha,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'complemento',
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
            height: 25,
          ),


          ///CIDADE

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
                    FontAwesomeIcons.city,
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
                          keyboardType: TextInputType.text,

                          //enabled: false,
                          controller: cadastroFunctions.cidade,
                          //obscureText: !loginStore.verSenha,
                          //onChanged: loginStore.setSenha,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'cidade',
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
            height: 25,
          ),


          ///ESTADO

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
                    FontAwesomeIcons.mapMarkedAlt,
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
                          keyboardType: TextInputType.text,

                          //enabled: false,
                          controller: cadastroFunctions.estado,
                          //obscureText: !loginStore.verSenha,
                          //onChanged: loginStore.setSenha,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'estado',
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
          cadastroFunctions.gotoInteresses();
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