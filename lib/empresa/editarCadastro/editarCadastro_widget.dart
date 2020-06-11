import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/home/home.dart';

import '../../globals.dart';
import 'editarCadastro_functions.dart';
import 'editarCadastro_store.dart';

class EditarCadastroWidget {

  BuildContext context;
  EditarCadastroWidget(this.context);

  Widget editarWidget(){
    return Expanded(
        child: ListView(
          children: <Widget>[
            barraTopo(),
            _formulario_widget(),
            SizedBox(
              height: 25,
            ),
            _botaoEnviarEmpresa(),
            SizedBox(
              height: 25,
            ),
          ],
        )
    );
  }

  ///BARRA DO TOPO
  ///
  Widget barraTopo() {
    final editarCadastroFunctions = Provider.of<EditarCadastroFunctions>(context);
    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            //margin: EdgeInsets.only(left: 20, right: 20),
            child: GestureDetector(
            //clipBehavior: Clip.none,

              onTap: () {
                Navigator.of(context).pop();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 75,
                    width: 75,
                    color: Colors.transparent,
                    //color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.arrow_back_ios,
                          size: StyleGlobals().sizeTitulo,
                          color: StyleGlobals().primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),



        ],
      ),
    );
  }


  Widget _formulario_widget() {

    //final cadastroStore = Provider.of<CadastroStore>(context);
    final editarCadastroFunctions = Provider.of<EditarCadastroFunctions>(context);

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
                          controller: editarCadastroFunctions.nomeEmpresa, ///MUDAR CONTROLADOR
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
                          controller: editarCadastroFunctions.nomeRepresentante,
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
                          controller: editarCadastroFunctions.email,
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
                          inputFormatters: [editarCadastroFunctions.maskTextTel],

                          //enabled: false,
                          controller: editarCadastroFunctions.telefone,
                          //obscureText: !loginStore.verSenha,
                          onChanged: (value){
                            if(editarCadastroFunctions.telefone.text.length > 13){
                              editarCadastroFunctions.telefone.value = editarCadastroFunctions.maskTextTel.updateMask("(##)#####-####");
                            } else {
                              if(editarCadastroFunctions.telefone.text.length == 13){

                                editarCadastroFunctions.telefone.value = editarCadastroFunctions.maskTextTel.updateMask("(##)####-#####");
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
                          inputFormatters: [editarCadastroFunctions.maskTextCNPJ],
                          style: TextStyle(
                              color: StyleGlobals().textColorForte,
                              fontSize: StyleGlobals().sizeSubtitulo
                          ),
                          keyboardType: TextInputType.number,

                          //enabled: false,
                          controller: editarCadastroFunctions.cnpj,
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
                          inputFormatters: [editarCadastroFunctions.maskTextCEP],

                          //enabled: false,
                          controller: editarCadastroFunctions.cep,
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
                          controller: editarCadastroFunctions.logradouro,
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
                              controller: editarCadastroFunctions.numero,
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
                          controller: editarCadastroFunctions.complemento,
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
                          controller: editarCadastroFunctions.cidade,
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
                          controller: editarCadastroFunctions.estado,
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


  Widget _botaoEnviarEmpresa(){

    //final loginStore = Provider.of<LoginStore>(context);
    final editarCadastroFunctions = Provider.of<EditarCadastroFunctions>(context);
    final editarCadastroStore = Provider.of<EditarCadastroStore>(context);

    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () async {
          print('AAAAAAAAA');
          editarCadastroStore.setCarregandoEnvio();
          bool value = await editarCadastroFunctions.updateEmpresa();
          if(value){
            Navigator.of(context).pop(
                MaterialPageRoute(builder: (context) => HomePage())
            );
          }
          editarCadastroStore.setCarregandoEnvio();
        },
        child: Row(
          children: <Widget>[
            Expanded(
                child: Observer(
                  builder: (_){
                    return Container(
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
                        child: editarCadastroStore.carregandoEnvio ?
                        SpinKitThreeBounce(
                          color: StyleGlobals().textColorSecundary,
                          size: StyleGlobals().sizeTitulo,
                        )
                            : Text('ATUALIZAR',
                          style: TextStyle(
                              color: StyleGlobals().textColorSecundary,
                              fontSize: StyleGlobals().sizeSubtitulo
                          ),
                        ),
                      ),
                    );
                  },
                ),

            ),
          ],
        ),
      ),
    );
  }




}