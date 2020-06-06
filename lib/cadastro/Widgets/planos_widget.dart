

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../globals.dart';
import '../cadastro_functions.dart';
import '../cadastro_store.dart';

class PlanosWidget {
  BuildContext context;
  PlanosWidget(this.context);

  Widget pagamentoPage() {
    final cadastroStore = Provider.of<CadastroStore>(context);
    final cadastroFunctions = Provider.of<CadastroFunctions>(context);

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
                  FontAwesomeIcons.fileContract,
                  color: Colors.green,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.green,
                ),
                Icon(FontAwesomeIcons.solidGrinStars,
                  color: StyleGlobals().primaryColor,
                ),
                Icon(Icons.arrow_forward_ios),
                Icon(FontAwesomeIcons.coins),
              ],
            ),
          ),

          SizedBox(
            height: 35,
          ),

          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text(
              'Escolha o plano perfeito para o seu negócio, e troque quando quiser',
              style: TextStyle(
                fontSize: StyleGlobals().sizeTitulo,
                color: StyleGlobals().textColorForte,
              ),

            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text(
              '\nPreço semestral parcelado em 6x',
              style: TextStyle(
                fontSize: StyleGlobals().sizeSubtitulo,
                color: StyleGlobals().textColorForte,
              ),

            ),
          ),
          SizedBox(
            height: 35,
          ),


          _tabelaPrecos(),

          SizedBox(
            height: 45,
          ),

          _botaoPlanos(),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _tabelaPrecos(){
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.top,

        children: [
          TableRow(
            children: [
              Container(),
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Text('Básico',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: StyleGlobals().sizeSubtitulo,
                    color: StyleGlobals().textColorForte,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Text('Profissional',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: StyleGlobals().sizeSubtitulo,
                    color: StyleGlobals().textColorForte,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]
          ),

          TableRow(
              children: [
                Container(),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Text('R\$ 79,90',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: StyleGlobals().sizeSubtitulo,
                      color: StyleGlobals().textColorForte,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Text('R\$ 139,90',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: StyleGlobals().sizeSubtitulo,
                      color: StyleGlobals().textColorForte,
                    ),
                  ),
                ),
              ]
          ),
          TableRow(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Text('Licitações',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: StyleGlobals().sizeSubtitulo,
                      color: StyleGlobals().textColorForte,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Icon(
                    FontAwesomeIcons.checkCircle,
                    color: Colors.green,
                    size: StyleGlobals().sizeSubtitulo,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Icon(
                    FontAwesomeIcons.checkCircle,
                    color: Colors.green,
                    size: StyleGlobals().sizeSubtitulo,
                  ),
                ),
              ]
          ),
          TableRow(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Text('Notificações',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: StyleGlobals().sizeSubtitulo,
                      color: StyleGlobals().textColorForte,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Icon(
                    FontAwesomeIcons.checkCircle,
                    color: Colors.green,
                    size: StyleGlobals().sizeSubtitulo,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Icon(
                    FontAwesomeIcons.checkCircle,
                    color: Colors.green,
                    size: StyleGlobals().sizeSubtitulo,
                  ),
                ),
              ]
          ),
          TableRow(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Text('Busca por filtros',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: StyleGlobals().sizeSubtitulo,
                      color: StyleGlobals().textColorForte,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Icon(
                    FontAwesomeIcons.windowClose,
                    color: Colors.red,
                    size: StyleGlobals().sizeSubtitulo,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Icon(
                    FontAwesomeIcons.checkCircle,
                    color: Colors.green,
                    size: StyleGlobals().sizeSubtitulo,
                  ),
                ),
              ]
          ),
          TableRow(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Text('Agenda de licit',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: StyleGlobals().sizeSubtitulo,
                      color: StyleGlobals().textColorForte,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Icon(
                    FontAwesomeIcons.checkCircle,
                    color: Colors.green,
                    size: StyleGlobals().sizeSubtitulo,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Icon(
                    FontAwesomeIcons.checkCircle,
                    color: Colors.green,
                    size: StyleGlobals().sizeSubtitulo,
                  ),
                ),
              ]
          ),
          TableRow(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Text('Painel de Licitações',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: StyleGlobals().sizeSubtitulo,
                      color: StyleGlobals().textColorForte,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Icon(
                    FontAwesomeIcons.checkCircle,
                    color: Colors.green,
                    size: StyleGlobals().sizeSubtitulo,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Icon(
                    FontAwesomeIcons.checkCircle,
                    color: Colors.green,
                    size: StyleGlobals().sizeSubtitulo,
                  ),
                ),
              ]
          ),
          TableRow(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Text('Consultoria e Assessoria',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: StyleGlobals().sizeSubtitulo,
                      color: StyleGlobals().textColorForte,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Icon(
                    FontAwesomeIcons.windowClose,
                    color: Colors.red,
                    size: StyleGlobals().sizeSubtitulo,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Icon(
                    FontAwesomeIcons.checkCircle,
                    color: Colors.green,
                    size: StyleGlobals().sizeSubtitulo,
                  ),
                ),
              ]
          ),
          TableRow(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Text('2 usuários',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: StyleGlobals().sizeSubtitulo,
                      color: StyleGlobals().textColorForte,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Icon(
                    FontAwesomeIcons.windowClose,
                    color: Colors.red,
                    size: StyleGlobals().sizeSubtitulo,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Icon(
                    FontAwesomeIcons.checkCircle,
                    color: Colors.green,
                    size: StyleGlobals().sizeSubtitulo,
                  ),
                ),
              ]
          ),
        ],
      ),
    );
  }

  Widget _botaoPlanos() {
    //final loginStore = Provider.of<LoginStore>(context);
    final cadastroFunctions = Provider.of<CadastroFunctions>(context);

    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () async {
                cadastroFunctions.gotoTermos();
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              colors: [StyleGlobals().tertiaryColor, StyleGlobals().tertiaryColor]
                          ),
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
                        child: Text(
                          'BÁSICO',
                          style: TextStyle(
                              color: StyleGlobals().textColorSecundary,
                              fontSize: StyleGlobals().sizeSubtitulo),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () async {
                print('AAAAAAAAA');
                cadastroFunctions.gotoPagamento();
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              colors: [StyleGlobals().tertiaryColor, StyleGlobals().tertiaryColor]
                          ),
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
                        child: Text(
                          'PROFISSIONAL',
                          style: TextStyle(
                              color: StyleGlobals().textColorSecundary,
                              fontSize: StyleGlobals().sizeSubtitulo),
                        ),
                      ),
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


}