import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/empresa/editarCadastro/editarCadastro_page.dart';

import '../../globals.dart';
import '../home_functions.dart';

class HomeWidget {
  BuildContext context;
  HomeWidget(this.context);

  /// BARRA COM O MENU NO TOPO
  Widget barraTopo() {
    final homeFunctions = Provider.of<HomeFunctions>(context);
    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            //margin: EdgeInsets.only(left: 20, right: 20),
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                homeFunctions.scaffoldKey.currentState.openDrawer();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    //padding: EdgeInsets.all(10),
                    height: 45,
                    width: 45,
                    /*decoration: BoxDecoration(
                        color: StyleGlobals().tertiaryColor,
                        borderRadius: BorderRadius.circular(10)),*/
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 4,
                              width: 17,
                              decoration: BoxDecoration(
                                  color: StyleGlobals().primaryColor,
                                  border: new Border.all(
                                    width: 1.0,
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(20.0))),
                            ),
                            Divider(
                              color: Colors.transparent,
                              height: 7,
                            ),
                            Container(
                              height: 4,
                              width: 25,
                              decoration: BoxDecoration(
                                  color: StyleGlobals().primaryColor,
                                  border: new Border.all(
                                    width: 1.0,
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(20.0))),
                            ),
                            Divider(
                              color: Colors.transparent,
                              height: 7,
                            ),
                            Container(
                              height: 4,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: StyleGlobals().primaryColor,
                                  border: new Border.all(
                                    width: 1.0,
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(20.0))),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///Icone Editar
          ///
          Container(
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditarCadastroPage()));
              },
              child: Icon(
                FontAwesomeIcons.userEdit,
                color: StyleGlobals().primaryColor,
                //size: StyleGlobals().sizeTitulo,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget botoesTopo(titulo, icone) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: StyleGlobals().primaryColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 30.0,
                      spreadRadius: 0.5,
                      offset: Offset(
                        2.0,
                        2.0,
                      )),
                ]),
            child: Icon(
              icone,
              color: StyleGlobals().textColorSecundary,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            child: Text(
              '$titulo',
              style: TextStyle(
                fontSize: StyleGlobals().sizeText,
                color: StyleGlobals().textColorMedio,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget botoes() {
    return GridView.count(
        shrinkWrap: true,
        childAspectRatio: 3 / 2,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
        children: <Widget>[
          FlatButton(
            onPressed: (){

            },

            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: _cardCamposLicit('Novas', FontAwesomeIcons.fileSignature),
          ),
          FlatButton(
            onPressed: (){

            },

            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: _cardCamposLicit('Visualizadas', FontAwesomeIcons.eye),
          ),
          FlatButton(
            onPressed: (){

            },

            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: _cardCamposLicit('Favoritas', Icons.favorite),
          ),
          FlatButton(
            onPressed: (){

            },

            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: _cardCamposLicit('Participando', FontAwesomeIcons.userCheck),
          ),
        ],
    );
  }


  Widget _cardCamposLicit(_texto, _icone) {
    //final homeAdmStore = Provider.of<HomeAdmStore>(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15),
            //margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
            height: MediaQuery.of(context).size.width / 3.5,

            decoration: BoxDecoration(
              //color: Colors.red,
                gradient: StyleGlobals().colorGradiente,
                borderRadius: BorderRadius.circular(20),
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
            child: Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Icon(
                      _icone,
                      color: Colors.white30,
                      size: MediaQuery.of(context).size.width / 7,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    /*Container(
                      child: homeAdmStore.carregandoQtde
                          ? Container(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              StyleGlobals().secundaryColor),
                          strokeWidth: 3,
                        ),
                      )
                          :*//* Text(
                        '$_qtde',
                        style: TextStyle(
                          color: StyleGlobals().textColorSecundary,
                          fontSize: StyleGlobals().sizeSubtitulo,
                        ),
                      ),
                    ),*/
                    /*Container(
                      child: Icon(
                        _icone,
                        color: StyleGlobals().textColorSecundary,
                        size: StyleGlobals().sizeTitulo,
                      ),
                    ),*/
                    Container(
                      child: Text(
                        _texto,
                        style: TextStyle(
                          color: StyleGlobals().textColorSecundary,
                          fontSize: StyleGlobals().sizeSubtitulo,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }


}
