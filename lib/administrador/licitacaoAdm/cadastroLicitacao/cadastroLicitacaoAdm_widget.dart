import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:twp_licitacoes/administrador/homeAdm/homeAdm_page.dart';

import '../../../globals.dart';
import 'cadastroLicitacaoAdm_functions.dart';
import 'cadastroLicitacaoAdm_store.dart';

class CadastroLicitacaoAdmWidget {

  BuildContext context;
  CadastroLicitacaoAdmWidget(this.context);


  Widget cadastroLicitacaoPrincipal(){
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: <Widget>[
          barraTopo(),


          _formulario_widget(),

          SizedBox(
            height: 45,
          ),


          _botaoPago(),

          SizedBox(
            height: 25,
          ),

        ],
      ),
    );
  }

  Widget barraTopo() {

    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width,
      //color: Colors.red,
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

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Text(
                      'Nova Licitação',
                    style: TextStyle(
                      color: StyleGlobals().textColorForte,
                      fontSize: StyleGlobals().sizeTitulo,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 75,
            width: 75,
            color: Colors.transparent,
            //color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

              ],
            ),
          ),


        ],
      ),
    );
  }

  Widget _formulario_widget() {

    final cadastroLicitacaoAdmStore = Provider.of<CadastroLicitacaoAdmStore>(context);
    final cadastroLicitacaoFunctions = Provider.of<CadastroLicitacaoAdmFunctions>(context);

    return Container(
      child: Column(
        children: <Widget>[

          /// CAMPO NOME LICITACAO
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
            //color: Colors.white,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      offset: Offset(
                        1.0,
                        1.0,
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
                              fontSize: StyleGlobals().sizeTextMedio
                          ),
                          //keyboardType: TextInputType.,
                          controller: cadastroLicitacaoFunctions.nomeLicitacao,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'digite o nome da Licitação',
                            hintStyle: TextStyle(
                                color: StyleGlobals().textColorFraco,
                                fontSize: StyleGlobals().sizeText
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


          /// CATEGORIAS INTERESSE
          ///

          campoCategoria(),

          Observer(
            builder: (_){
              return cadastroLicitacaoAdmStore.temSubcat ?
              campoSubcategoria() :
              Container();
            },
          ),

          ///CAMPO ORGÃO
          ///
          campoOrgao(),

          ///CAMPO MODALIDADE
          ///
          campoModalidade(),

          ///CAMPO SITUAÇÃO
          ///
          campoSituacao(),

          SizedBox(
            height: 15,
          ),

          /// CAMPO VALOR
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            //color: Colors.white,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      offset: Offset(
                        1.0,
                        1.0,
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
                            fontSize: StyleGlobals().sizeTextMedio
                          ),
                          keyboardType: TextInputType.number,
                          controller: cadastroLicitacaoFunctions.precoEstimado,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,

                            hintStyle: TextStyle(
                                color: StyleGlobals().textColorFraco,
                                fontSize: StyleGlobals().sizeText
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


          /// DATA LIMITE CRC
          campoDataLimiteCRC(),

          /// DATA LIMITE PARA ENVIO DE DOCUMENTOS
          campoDataLimiteEnvioDoc(),

          /// DATA DA SESSÃO PÚBLICA
          campoDataSessaoPublica(),

          ///HORA DA SESSÃO PÚBLICA
          ///
          campoHoraSessaoPublica(),

          /// EDITAL
          ///
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
            //color: Colors.white,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      offset: Offset(
                        1.0,
                        1.0,
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
                              fontSize: StyleGlobals().sizeTextMedio
                          ),
                          //keyboardType: TextInputType.,
                          controller: cadastroLicitacaoFunctions.edital,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'edital (00/0000)',
                            hintStyle: TextStyle(
                                color: StyleGlobals().textColorFraco,
                                fontSize: StyleGlobals().sizeText
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

          /// LINK
          ///
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
            //color: Colors.white,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      offset: Offset(
                        1.0,
                        1.0,
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
                    FontAwesomeIcons.globeAmericas,
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
                              fontSize: StyleGlobals().sizeTextMedio
                          ),
                          //keyboardType: TextInputType.,
                          controller: cadastroLicitacaoFunctions.link,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'informe o link',
                            hintStyle: TextStyle(
                                color: StyleGlobals().textColorFraco,
                                fontSize: StyleGlobals().sizeText
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



          /// CAMPO OBSERVAÇÃO
          Container(
            //height: 60,
            margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
            //color: Colors.white,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      offset: Offset(
                        1.0,
                        1.0,
                      )),
                ]),
            child: Row(
              children: <Widget>[
                Column(
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
                  ],
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new TextFormField(
                          style: TextStyle(
                              color: StyleGlobals().textColorForte,
                              fontSize: StyleGlobals().sizeTextMedio
                          ),
                          //keyboardType: TextInputType.,
                          controller: cadastroLicitacaoFunctions.observacoes,
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'observações',
                            hintStyle: TextStyle(
                                color: StyleGlobals().textColorFraco,
                                fontSize: StyleGlobals().sizeText
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



          /// CAMPO OBJETO RESUMIDO
          Container(
            //height: 60,
            margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
            //color: Colors.white,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      offset: Offset(
                        1.0,
                        1.0,
                      )),
                ]),
            child: Row(
              children: <Widget>[
                Column(
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
                  ],
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new TextFormField(
                          style: TextStyle(
                              color: StyleGlobals().textColorForte,
                              fontSize: StyleGlobals().sizeTextMedio
                          ),
                          //keyboardType: TextInputType.,
                          controller: cadastroLicitacaoFunctions.objetoResumido,
                          textAlign: TextAlign.left,
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'objeto resumido',
                            hintStyle: TextStyle(
                                color: StyleGlobals().textColorFraco,
                                fontSize: StyleGlobals().sizeText
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



        ],
      ),
    );
  }


  /// CAMPO CATEGORIA
  ///
  Widget campoCategoria(){
    final cadastroLicitacaoAdmStore = Provider.of<CadastroLicitacaoAdmStore>(context, listen: false);
    //final cadastroLicitacaoAdmStore = Provider.of<CadastroStore>(context);
    return         Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
      //color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(
                  1.0,
                  1.0,
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
                    cadastroLicitacaoAdmStore.selCategoria
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
                          child: Text(cadastroLicitacaoAdmStore.selCategoria ?
                          cadastroLicitacaoAdmStore.nomeCatEscolhido :
                          'selecione uma categoria',
                            style: TextStyle(color: cadastroLicitacaoAdmStore.selCategoria
                                ? StyleGlobals().textColorForte
                                : StyleGlobals().textColorFraco,
                              fontSize: cadastroLicitacaoAdmStore.selCategoria
                                  ? StyleGlobals().sizeTextMedio
                                  : StyleGlobals().sizeText,
                            ),),
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
    //final cadastroFunctions = Provider.of<CadastroFunctions>(context);
    final cadastroLicitacaoAdmStore = Provider.of<CadastroLicitacaoAdmStore>(context, listen: false);
    //final cadastroLicitacaoAdmStore = Provider.of<CadastroStore>(context);
    return         Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
      //color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(
                  1.0,
                  1.0,
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
                    cadastroLicitacaoAdmStore.selSubcategoria
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
                          child: Text(cadastroLicitacaoAdmStore.selSubcategoria ?
                          cadastroLicitacaoAdmStore.nomeSubcatEscolhido :
                          'selecione uma subcategoria',
                            style: TextStyle(
                              color: cadastroLicitacaoAdmStore.selSubcategoria
                                ? StyleGlobals().textColorForte
                                : StyleGlobals().textColorFraco,
                              fontSize: cadastroLicitacaoAdmStore.selSubcategoria
                                  ? StyleGlobals().sizeTextMedio
                                  : StyleGlobals().sizeText,
                            ),),
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

  /// CAMPO ORGÃO
  ///
  Widget campoOrgao(){
    final cadastroLicitacaoAdmStore = Provider.of<CadastroLicitacaoAdmStore>(context, listen: false);
    //final cadastroLicitacaoAdmStore = Provider.of<CadastroStore>(context);
    return         Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
      //color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(
                  1.0,
                  1.0,
                )),
          ]),
      child: GestureDetector(
        onTap: () {
          orgaoDialog();
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
                    cadastroLicitacaoAdmStore.selOrgao
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
                          child: Text(cadastroLicitacaoAdmStore.selOrgao ?
                          cadastroLicitacaoAdmStore.nomeOrgaoEscolhido :
                          'selecione o Órgao responsável',
                            style: TextStyle(
                              color: cadastroLicitacaoAdmStore.selOrgao
                                ? StyleGlobals().textColorForte
                                : StyleGlobals().textColorFraco,
                              fontSize: cadastroLicitacaoAdmStore.selOrgao
                                  ? StyleGlobals().sizeTextMedio
                                  : StyleGlobals().sizeText,
                            ),),
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

  /// CAMPO MODALIDADE
  ///
  Widget campoModalidade(){
    final cadastroLicitacaoAdmStore = Provider.of<CadastroLicitacaoAdmStore>(context, listen: false);
    //final cadastroLicitacaoAdmStore = Provider.of<CadastroStore>(context);
    return         Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
      //color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(
                  1.0,
                  1.0,
                )),
          ]),
      child: GestureDetector(
        onTap: () {
          modalidadeDialog();
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
                    cadastroLicitacaoAdmStore.selmodalidade
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
                          child: Text(cadastroLicitacaoAdmStore.selmodalidade ?
                          cadastroLicitacaoAdmStore.modalidade :
                          'selecione a Modalidade',
                            style: TextStyle(
                              color: cadastroLicitacaoAdmStore.selmodalidade
                                ? StyleGlobals().textColorForte
                                : StyleGlobals().textColorFraco,
                              fontSize: cadastroLicitacaoAdmStore.selmodalidade
                                  ? StyleGlobals().sizeTextMedio
                                  : StyleGlobals().sizeText,
                            ),),
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

  /// CAMPO SITUAÇÃO
  ///
  Widget campoSituacao(){
    final cadastroLicitacaoAdmStore = Provider.of<CadastroLicitacaoAdmStore>(context, listen: false);
    //final cadastroLicitacaoAdmStore = Provider.of<CadastroStore>(context);
    return Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
      //color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(
                  1.0,
                  1.0,
                )),
          ]),
      child: GestureDetector(
        onTap: () {
          situacaoDialog();
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
                    cadastroLicitacaoAdmStore.selsituacao
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
                          child: Text(cadastroLicitacaoAdmStore.selsituacao ?
                          cadastroLicitacaoAdmStore.situacao :
                          'selecione a Situação',
                            style: TextStyle(
                              color: cadastroLicitacaoAdmStore.selsituacao
                                ? StyleGlobals().textColorForte
                                : StyleGlobals().textColorFraco,
                              fontSize: cadastroLicitacaoAdmStore.selsituacao
                                  ? StyleGlobals().sizeTextMedio
                                  : StyleGlobals().sizeText,
                            ),),
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


  /// CAMPO DATA LIMITE PARA CRC ORGÃO
  ///
  Widget campoDataLimiteCRC() {
    final cadastroLicitacaoAdmStore = Provider.of<CadastroLicitacaoAdmStore>(context, listen: false);
    DateTime _dateTime;
    var _formatoData = new DateFormat('dd/MM/yyyy');
    return Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
      //color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(
                  1.0,
                  1.0,
                )),
          ]),
      child: GestureDetector(
        onTap: () {
          showDatePicker(

              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2010),
              lastDate: DateTime(2025),
          ).then((date) {
                print('date');
                _dateTime = date;

                cadastroLicitacaoAdmStore.dataLimiteCRC = _formatoData.format(_dateTime);
                cadastroLicitacaoAdmStore.setSelDataLimiteCRC(true);


            /*setState(() {
              _dateTime = date;
              data = formatter.format(_dateTime);
              AutGlobal.dataInicial = data;
            });*/
          });
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
                    child: Icon(
                      FontAwesomeIcons.calendarDay,
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
                          child: Text(cadastroLicitacaoAdmStore.seldataLimiteCRC ?
                          cadastroLicitacaoAdmStore.dataLimiteCRC :
                          'data limite CRC órgão',
                            style: TextStyle(
                                color: cadastroLicitacaoAdmStore.seldataLimiteCRC
                                    ? StyleGlobals().textColorForte
                                    : StyleGlobals().textColorFraco,
                              fontSize: cadastroLicitacaoAdmStore.seldataLimiteCRC
                                  ? StyleGlobals().sizeTextMedio
                                  : StyleGlobals().sizeText,
                            ),),
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

  /// CAMPO DATA LIMITE PARA ENVIO DE DOCUMENTO
  ///
  Widget campoDataLimiteEnvioDoc() {
    final cadastroLicitacaoAdmStore = Provider.of<CadastroLicitacaoAdmStore>(context, listen: false);
    DateTime _dateTime;
    var _formatoData = new DateFormat('dd/MM/yyyy');
    return Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
      //color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(
                  1.0,
                  1.0,
                )),
          ]),
      child: GestureDetector(
        onTap: () {
          showDatePicker(

            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2010),
            lastDate: DateTime(2025),
          ).then((date) {
            print('date');
            _dateTime = date;

            cadastroLicitacaoAdmStore.dataLimiteEnvioDoc = _formatoData.format(_dateTime);
            cadastroLicitacaoAdmStore.setSelDataLimiteEnvioDoc(true);


            /*setState(() {
              _dateTime = date;
              data = formatter.format(_dateTime);
              AutGlobal.dataInicial = data;
            });*/
          });
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
                    child: Icon(
                      FontAwesomeIcons.calendarDay,
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
                          child: Text(cadastroLicitacaoAdmStore.seldataLimiteEnvioDoc ?
                          cadastroLicitacaoAdmStore.dataLimiteEnvioDoc :
                          'data limite para envio de Documentos',
                            style: TextStyle(color: cadastroLicitacaoAdmStore.seldataLimiteEnvioDoc
                                ? StyleGlobals().textColorForte
                                : StyleGlobals().textColorFraco,
                              fontSize: cadastroLicitacaoAdmStore.seldataLimiteEnvioDoc
                                  ? StyleGlobals().sizeTextMedio
                                  : StyleGlobals().sizeText,
                            ),
                          ),
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

  /// CAMPO DATA SESSÃO PÚBLICA
  ///
  Widget campoDataSessaoPublica() {
    final cadastroLicitacaoAdmStore = Provider.of<CadastroLicitacaoAdmStore>(context, listen: false);
    DateTime _dateTime;
    var _formatoData = new DateFormat('dd/MM/yyyy');
    return Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
      //color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(
                  1.0,
                  1.0,
                )),
          ]),
      child: GestureDetector(
        onTap: () {
          showDatePicker(

            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2010),
            lastDate: DateTime(2025),
          ).then((date) {
            print('date');
            _dateTime = date;

            cadastroLicitacaoAdmStore.dataSessaoPublica = _formatoData.format(_dateTime);
            cadastroLicitacaoAdmStore.setSelDataSessaoPublica(true);


            /*setState(() {
              _dateTime = date;
              data = formatter.format(_dateTime);
              AutGlobal.dataInicial = data;
            });*/
          });
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
                    child: Icon(
                      FontAwesomeIcons.calendarDay,
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
                          child: Text(cadastroLicitacaoAdmStore.seldataSessaoPublica ?
                          cadastroLicitacaoAdmStore.dataSessaoPublica :
                          'data da sessão pública',
                            style: TextStyle(
                                color: cadastroLicitacaoAdmStore.seldataSessaoPublica
                                    ? StyleGlobals().textColorForte
                                    : StyleGlobals().textColorFraco,
                              fontSize: cadastroLicitacaoAdmStore.seldataSessaoPublica
                                  ? StyleGlobals().sizeTextMedio
                                  : StyleGlobals().sizeText,
                            ),
                          ),
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

  /// CAMPO HORA DA SESSÃO PÚBLICA
  ///
  Widget campoHoraSessaoPublica() {
    final cadastroLicitacaoAdmStore = Provider.of<CadastroLicitacaoAdmStore>(context, listen: false);
    TimeOfDay _time;
    return Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
      //color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(
                  1.0,
                  1.0,
                )),
          ]),
      child: GestureDetector(
        onTap: () {
          showTimePicker(

            context: context,
              initialTime: TimeOfDay.now()
          ).then((time) {
            print('time');
            final now = new DateTime.now();
            final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
            final format = DateFormat.Hm();
            cadastroLicitacaoAdmStore.horaSessaoPublica = format.format(dt);
            cadastroLicitacaoAdmStore.setSelHoraSessaoPublica(true);


            /*setState(() {
              _dateTime = date;
              data = formatter.format(_dateTime);
              AutGlobal.dataInicial = data;
            });*/
          });
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
                    child: Icon(
                      FontAwesomeIcons.clock,
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
                          child: Text(cadastroLicitacaoAdmStore.selhoraSessaoPublica ?
                          cadastroLicitacaoAdmStore.horaSessaoPublica :
                          'hora da sessão pública',
                            style: TextStyle(
                                color: cadastroLicitacaoAdmStore.selhoraSessaoPublica
                                    ? StyleGlobals().textColorForte
                                    : StyleGlobals().textColorFraco,
                              fontSize: cadastroLicitacaoAdmStore.selhoraSessaoPublica
                                  ? StyleGlobals().sizeTextMedio
                              : StyleGlobals().sizeText,
                            ),),
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


  Future<bool> _onWillPop() {
    Navigator.of(context).pop(false);
  }


  ///Dialog CATEGORIAS
  Future<void> categoriasDialog() async {
    print('EEEEEEE');
    final cadastroLicitacaoAdmStore = Provider.of<CadastroLicitacaoAdmStore>(context, listen: false);
    final cadastroLicitacaoAdmFunctions = Provider.of<CadastroLicitacaoAdmFunctions>(context, listen: false);
    print('cadastroFunctions.listCategorias.length: ${cadastroLicitacaoAdmFunctions.listCategorias.length}');

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
                              itemCount: cadastroLicitacaoAdmFunctions.listCategorias.length,
                              itemBuilder: (_, index) {
                                return Column(
                                  children: <Widget>[
                                    FlatButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: () async {
                                        cadastroLicitacaoAdmStore.cadastraCategoria(cadastroLicitacaoAdmFunctions.listCategorias[index]['nome']);
                                        cadastroLicitacaoAdmStore.setSelCategoria(true);
                                        cadastroLicitacaoAdmFunctions.idCategoria = await cadastroLicitacaoAdmFunctions.listCategorias[index]['id'];
                                        cadastroLicitacaoAdmStore.setSelSubcategoria(false);
                                        await selListaSubcategorias();
                                        cadastroLicitacaoAdmStore.setLimpaSubcategoria();
                                        cadastroLicitacaoAdmFunctions.idSubcategoria = null;

                                        Navigator.pop(context);
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: Text(
                                                  cadastroLicitacaoAdmFunctions.listCategorias[index]['nome'],
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
    final cadastroLicitacaoAdmStore = Provider.of<CadastroLicitacaoAdmStore>(context, listen: false);
    final cadastroLicitacaoAdmFunctions = Provider.of<CadastroLicitacaoAdmFunctions>(context, listen: false);

    //final cadastroLicitacaoAdmStore = Provider.of<CadastroStore>(context, listen: false);
    //final cadastroLicitacaoAdmFunctions = Provider.of<CadastroFunctions>(context, listen: false);

    cadastroLicitacaoAdmFunctions.listSubcategoriasAux.clear();
    cadastroLicitacaoAdmStore.setTemSubcat(false);

    print('id: ${cadastroLicitacaoAdmFunctions.idCategoria}');
    print('cadastroLicitacaoAdmFunctions.listSubcategoriasTotal.length: ${cadastroLicitacaoAdmFunctions.listSubcategoriasTotal.length}');
    for(int i = 0; i < cadastroLicitacaoAdmFunctions.listSubcategoriasTotal.length; i++){
      if(cadastroLicitacaoAdmFunctions.listSubcategoriasTotal[i]['id_categoria'] == cadastroLicitacaoAdmFunctions.idCategoria){
        cadastroLicitacaoAdmFunctions.listSubcategoriasAux.add(cadastroLicitacaoAdmFunctions.listSubcategoriasTotal[i]);
        cadastroLicitacaoAdmStore.setTemSubcat(true);
        print('id: ${cadastroLicitacaoAdmFunctions.listSubcategoriasTotal[i]}');
      }
    }
  }


  ///Dialog SUBCATEGORIAS
  Future<void> subcategoriasDialog() async {

    final cadastroLicitacaoAdmStore = Provider.of<CadastroLicitacaoAdmStore>(context, listen: false);
    final cadastroLicitacaoAdmFunctions = Provider.of<CadastroLicitacaoAdmFunctions>(context, listen: false);

    print('EEEEEEE');
    //final cadastroLicitacaoAdmStore = Provider.of<CadastroStore>(context, listen: false);
    //final cadastroLicitacaoAdmFunctions = Provider.of<CadastroFunctions>(context, listen: false);
    print('cadastroLicitacaoAdmFunctions.listCategorias.length: ${cadastroLicitacaoAdmFunctions.listSubcategoriasAux.length}');

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
                              itemCount: cadastroLicitacaoAdmFunctions.listSubcategoriasAux.length,
                              itemBuilder: (_, index) {
                                return Column(
                                  children: <Widget>[
                                    FlatButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: () {
                                        cadastroLicitacaoAdmStore.cadastraSubcategoria(cadastroLicitacaoAdmFunctions.listSubcategoriasAux[index]['nome']);
                                        cadastroLicitacaoAdmStore.setSelSubcategoria(true);
                                        cadastroLicitacaoAdmFunctions.idSubcategoria = cadastroLicitacaoAdmFunctions.listSubcategoriasAux[index]['id'];

                                        Navigator.pop(context);
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: Text(
                                                  cadastroLicitacaoAdmFunctions.listSubcategoriasAux[index]['nome'],
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


  ///DIALOG ÓRGÃO
///
  Future<void> orgaoDialog() async {
    print('EEEEEEE');
    final cadastroLicitacaoAdmStore = Provider.of<CadastroLicitacaoAdmStore>(context, listen: false);
    final cadastroLicitacaoAdmFunctions = Provider.of<CadastroLicitacaoAdmFunctions>(context, listen: false);
    print('cadastroFunctions.listCategorias.length: ${cadastroLicitacaoAdmFunctions.listOrgaos.length}');

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
                              itemCount: cadastroLicitacaoAdmFunctions.listOrgaos.length,
                              itemBuilder: (_, index) {
                                return Column(
                                  children: <Widget>[
                                    FlatButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: () async {
                                        cadastroLicitacaoAdmStore.cadastraOrgao(cadastroLicitacaoAdmFunctions.listOrgaos[index]['nome']);
                                        cadastroLicitacaoAdmStore.setSelOrgao(true);
                                        cadastroLicitacaoAdmFunctions.idOrgao = await cadastroLicitacaoAdmFunctions.listOrgaos[index]['id'];

                                        Navigator.pop(context);
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: Text(
                                                  cadastroLicitacaoAdmFunctions.listOrgaos[index]['nome'],
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


  ///DIALOG MODALIDADE
///
  Future<void> modalidadeDialog() async {
    print('EEEEEEE');
    final cadastroLicitacaoAdmStore = Provider.of<CadastroLicitacaoAdmStore>(context, listen: false);
    final cadastroLicitacaoAdmFunctions = Provider.of<CadastroLicitacaoAdmFunctions>(context, listen: false);
    print('cadastroFunctions.listModalidades.length: ${cadastroLicitacaoAdmFunctions.listModalidades.length}');

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
                              itemCount: cadastroLicitacaoAdmFunctions.listModalidades.length,
                              itemBuilder: (_, index) {
                                return Column(
                                  children: <Widget>[
                                    FlatButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: () async {
                                        cadastroLicitacaoAdmStore.cadastraModalidade(cadastroLicitacaoAdmFunctions.listModalidades[index]['nome']);
                                        cadastroLicitacaoAdmStore.setSelModalidade(true);
                                        cadastroLicitacaoAdmFunctions.idModalidade = await cadastroLicitacaoAdmFunctions.listModalidades[index]['id'];

                                        Navigator.pop(context);
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: Text(
                                                  cadastroLicitacaoAdmFunctions.listModalidades[index]['nome'],
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


  ///DIALOG SITUAÇÃO
///
  Future<void> situacaoDialog() async {
    print('EEEEEEE');
    final cadastroLicitacaoAdmStore = Provider.of<CadastroLicitacaoAdmStore>(context, listen: false);
    final cadastroLicitacaoAdmFunctions = Provider.of<CadastroLicitacaoAdmFunctions>(context, listen: false);
    print('cadastroFunctions.listSituacoes.length: ${cadastroLicitacaoAdmFunctions.listSituacoes.length}');

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
                              itemCount: cadastroLicitacaoAdmFunctions.listSituacoes.length,
                              itemBuilder: (_, index) {
                                return Column(
                                  children: <Widget>[
                                    FlatButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: () async {
                                        cadastroLicitacaoAdmStore.cadastraSituacao(cadastroLicitacaoAdmFunctions.listSituacoes[index]['nome']);
                                        cadastroLicitacaoAdmStore.setSelSituacao(true);
                                        cadastroLicitacaoAdmFunctions.idSituacao = await cadastroLicitacaoAdmFunctions.listSituacoes[index]['id'];

                                        Navigator.pop(context);
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: Text(
                                                  cadastroLicitacaoAdmFunctions.listSituacoes[index]['nome'],
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




  Widget _botaoPago(){

    final cadastroLicitacaoAdmStore = Provider.of<CadastroLicitacaoAdmStore>(context, listen: false);
    final cadastroLicitacaoAdmFunctions = Provider.of<CadastroLicitacaoAdmFunctions>(context, listen: false);

    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Observer(
        builder: (_){
          return FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () async {
              if(!cadastroLicitacaoAdmStore.carregandoEnvio){
                cadastroLicitacaoAdmStore.setCarregandoEnvio(true);
                print('orgao: "${cadastroLicitacaoAdmStore.nomeOrgaoEscolhido}"');
                print('nomeCatEscolhido: "${cadastroLicitacaoAdmStore.nomeCatEscolhido}"');
                print('nomeSubcatEscolhido: "${cadastroLicitacaoAdmStore.nomeSubcatEscolhido}"');
                print('dataLimiteCRC: "${cadastroLicitacaoAdmStore.dataLimiteCRC}"');
                print('dataLimiteEnvioDoc: "${cadastroLicitacaoAdmStore.dataLimiteEnvioDoc}"');
                print('dataSessaoPublica: "${cadastroLicitacaoAdmStore.dataSessaoPublica}"');
                print('horaSessaoPublica: "${cadastroLicitacaoAdmStore.horaSessaoPublica}"');
                print('situacao: "${cadastroLicitacaoAdmStore.situacao}"');
                print('modalidade: "${cadastroLicitacaoAdmStore.modalidade}"');
                print('\n\n\t\t AAAAAAAAAAAAAAAAA\n\n');

                bool resEnvio = await cadastroLicitacaoAdmFunctions.enviaDadosLicitacao(
                    cadastroLicitacaoAdmStore.nomeOrgaoEscolhido,
                    cadastroLicitacaoAdmStore.nomeCatEscolhido,
                    cadastroLicitacaoAdmStore.nomeSubcatEscolhido,
                    cadastroLicitacaoAdmStore.dataLimiteCRC,
                    cadastroLicitacaoAdmStore.dataLimiteEnvioDoc,
                    cadastroLicitacaoAdmStore.dataSessaoPublica,
                    cadastroLicitacaoAdmStore.horaSessaoPublica,
                    cadastroLicitacaoAdmStore.situacao,
                    cadastroLicitacaoAdmStore.modalidade
                );
                if(resEnvio) {
                  cadastroLicitacaoAdmFunctions.nomeLicitacao.text = '';
                  cadastroLicitacaoAdmFunctions.objetoResumido.text = '';
                  cadastroLicitacaoAdmFunctions.edital.text = '';
                  cadastroLicitacaoAdmFunctions.link.text = '';
                  cadastroLicitacaoAdmFunctions.observacoes.text = '';
                  cadastroLicitacaoAdmFunctions.precoEstimado.text = '';
                  cadastroLicitacaoAdmFunctions.idCategoria = null;
                  cadastroLicitacaoAdmFunctions.idSubcategoria = null;
                  cadastroLicitacaoAdmFunctions.idOrgao = null;
                  cadastroLicitacaoAdmFunctions.idModalidade = null;
                  cadastroLicitacaoAdmFunctions.idSituacao = null;

                  cadastroLicitacaoAdmStore.zeraValores();

                  cadastroLicitacaoAdmStore.setCarregandoEnvio(false);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeAdmPage())
                  );
                }

              }

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
                      child: cadastroLicitacaoAdmStore.carregandoEnvio ?
                      SpinKitThreeBounce(
                        color: StyleGlobals().secundaryColor,
                        size: StyleGlobals().sizeTitulo,
                      )
                          : Center(
                        child: Text('ENVIAR',
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
          );
        },
      ),
    );

  }





}