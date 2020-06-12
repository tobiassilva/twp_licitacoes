import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/administrador/empresasAdm/empresasAdm_page.dart';

import '../../globals.dart';
import 'homeAdm_functions.dart';
import '../globalsAdm.dart' as globalsAdm;
import 'homeAdm_store.dart';

class HomeAdmWidget {
  BuildContext context;
  HomeAdmWidget(this.context);

  Widget homeAdmPage() {
    return Column(
      children: <Widget>[
        barraTopo(),
        Expanded(
          child: Column(
            children: <Widget>[
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: 'Bem-Vindo\n',
                    style: TextStyle(
                      fontSize: StyleGlobals().sizeSubtitulo + 5,
                      color: StyleGlobals().textColorMedio,
                    ),
                  ),
                  TextSpan(
                    text: '${globalsAdm.nome}',
                    style: TextStyle(
                      fontSize: StyleGlobals().sizeTitulo + 5,
                      color: StyleGlobals().textColorForte,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ]),
              ),
              gridOpcoes(),
            ],
          ),
        ),
      ],
    );
  }

  Widget gridOpcoes() {
    final homeAdmFunctions = Provider.of<HomeAdmFunctions>(context);
    final homeAdmStore = Provider.of<HomeAdmStore>(context);
    return GridView.count(
      shrinkWrap: true,
      childAspectRatio: 3 / 2,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      children: <Widget>[
        FlatButton(
          //padding: EdgeInsets.all(0),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,

          onPressed: () async {
            if (homeAdmStore.carregandoQtde) {
              homeAdmFunctions.scaffoldKeyHomeAdm.currentState.showSnackBar(SnackBar(
                  content: Text(
                      'Aguarde o carregamento ou clique no botão para recarregar')));
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => EmpresasAdmPage()));
            }
          },
          child: _cardOpcoes('Empresas', Colors.red, Colors.redAccent,
              FontAwesomeIcons.building, globalsAdm.dbEmpresas.length),
        ),
        FlatButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () async {
            if (homeAdmStore.carregandoQtde) {
              homeAdmFunctions.scaffoldKeyHomeAdm.currentState.showSnackBar(SnackBar(
                  content: Text(
                      'Aguarde o carregamento ou clique no botão para recarregar')));
            } else {
              /*Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          EmpresasAdmPage()));*/
            }
          },
          child: _cardOpcoes("Licitações", Colors.blue, Colors.lightBlue,
              FontAwesomeIcons.fileSignature, globalsAdm.dbLicitacoes.length),
        ),
        FlatButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () async {
            if (homeAdmStore.carregandoQtde) {
              homeAdmFunctions.scaffoldKeyHomeAdm.currentState.showSnackBar(SnackBar(
                  content: Text(
                      'Aguarde o carregamento ou clique no botão para recarregar')));
            } else {
              /*Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          EmpresasAdmPage()));*/
            }
          },
          child: _cardOpcoes("Órgãos", Colors.green, Colors.green[400],
              FontAwesomeIcons.landmark, globalsAdm.dbOrgaos.length),
          /*Column(
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                "assets/images/Economia.png",
                                scale: 2.2,
                              ),
                            ),
                            Text(globals.Idioma == 'br'?"Economia":'Economy')
                          ],
                        ),*/
        ),
        FlatButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () async {
            if (homeAdmStore.carregandoQtde) {
              homeAdmFunctions.scaffoldKeyHomeAdm.currentState.showSnackBar(SnackBar(
                  content: Text(
                      'Aguarde o carregamento ou clique no botão para recarregar')));
            } else {
              /*Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          EmpresasAdmPage()));*/
            }
          },
          child: _cardOpcoes(
              "Estados",
              Colors.deepPurple,
              Colors.deepPurpleAccent,
              FontAwesomeIcons.city,
              globalsAdm.dbEstados.length),
          /*Column(
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                "assets/images/Curiosidade.png",
                                scale: 2.2,
                              ),
                            ),
                            Text(
                             globals.Idioma == 'br' ?"Curiosidades" : 'Curiosities',
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),*/
        ),
      ],
    );
  }

  Widget _cardOpcoes(_texto, _cor1, _cor2, _icone, _qtde) {
    final homeAdmStore = Provider.of<HomeAdmStore>(context);
    return Observer(
      builder: (_){
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
                    gradient: LinearGradient(colors: [_cor1, _cor2]),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 20.0,
                          spreadRadius: 2.0,
                          offset: Offset(
                            2.0,
                            2.0,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
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
                              : Text(
                            '$_qtde',
                            style: TextStyle(
                              color: StyleGlobals().textColorSecundary,
                              fontSize: StyleGlobals().sizeSubtitulo,
                            ),
                          ),
                        ),
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
      },
    );
  }

  Widget barraTopo() {
    final homeAdmFunctions = Provider.of<HomeAdmFunctions>(context);
    final homeAdmStore = Provider.of<HomeAdmStore>(context);
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

          ///Icone Editar
          ///
          Container(
            height: 75,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () async {
                /*Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditarCadastroPage())
                );*/
                homeAdmStore.setCarregandoQtde(true);
                await homeAdmFunctions.getDadosBanco();
                homeAdmStore.setCarregandoQtde(false);
              },
              child: Icon(
                FontAwesomeIcons.undoAlt,
                color: StyleGlobals().primaryColor,
                //size: StyleGlobals().sizeTitulo,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
