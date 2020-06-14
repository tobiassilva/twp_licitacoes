import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twp_licitacoes/administrador/empresasAdm/empresasAdm_page.dart';
import 'package:twp_licitacoes/home/home.dart';

import '../../globals.dart';
import 'HomeAdm_analytics.dart';
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
          child: ListView(
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
              SizedBox(
                height: 25,
              ),
              analytics(),
            ],
          ),
        ),
      ],
    );
  }

  Widget gridOpcoes() {
    final homeAdmFunctions = Provider.of<HomeAdmFunctions>(context);
    final homeAdmStore = Provider.of<HomeAdmStore>(context);
    return Observer(
      builder: (_){
        return homeAdmStore.carregandoQtde
            ? carregandoQtdeDados()
            : GridView.count(
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AlertDialog(
                        title: Text(
                            'Aguarde o carregamento ou clique no botão para recarregar'),
                        //backgroundColor: Colors.transparent,
                        content: Icon(
                          FontAwesomeIcons.history,
                          color: Colors.red,
                          size: 60,
                        ),

                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              //await detalhesEmpresasAdmFunctions.deleteEmpresaAdm(jsonEmpresa['id']);
                            },
                            child: Text(
                              'OK',
                              style: TextStyle(
                                fontSize:
                                StyleGlobals().sizeTextMedio,
                                color: StyleGlobals().tertiaryColor,
                              ),
                            ),
                          ),
                        ],
                      )));
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          EmpresasAdmPage()));
                }
              },
              child: _cardOpcoes(
                  'Empresas',
                  Colors.red,
                  Colors.redAccent,
                  FontAwesomeIcons.building,
                  globalsAdm.dbEmpresas.length),
            ),
            FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () async {
                if (homeAdmStore.carregandoQtde) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AlertDialog(
                        title: Text(
                            'Aguarde o carregamento ou clique no botão para recarregar'),
                        //backgroundColor: Colors.transparent,
                        content: Icon(
                          FontAwesomeIcons.history,
                          color: Colors.red,
                          size: 60,
                        ),

                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              //await detalhesEmpresasAdmFunctions.deleteEmpresaAdm(jsonEmpresa['id']);
                            },
                            child: Text(
                              'OK',
                              style: TextStyle(
                                fontSize:
                                StyleGlobals().sizeTextMedio,
                                color: StyleGlobals().tertiaryColor,
                              ),
                            ),
                          ),
                        ],
                      )));
                } else {
                  /*Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          EmpresasAdmPage()));*/
                }
              },
              child: _cardOpcoes(
                  "Licitações",
                  Colors.blue,
                  Colors.lightBlue,
                  FontAwesomeIcons.fileSignature,
                  globalsAdm.dbLicitacoes.length),
            ),
            FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () async {
                if (homeAdmStore.carregandoQtde) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AlertDialog(
                        title: Text(
                            'Aguarde o carregamento ou clique no botão para recarregar'),
                        //backgroundColor: Colors.transparent,
                        content: Icon(
                          FontAwesomeIcons.history,
                          color: Colors.red,
                          size: 60,
                        ),

                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              //await detalhesEmpresasAdmFunctions.deleteEmpresaAdm(jsonEmpresa['id']);
                            },
                            child: Text(
                              'OK',
                              style: TextStyle(
                                fontSize:
                                StyleGlobals().sizeTextMedio,
                                color: StyleGlobals().tertiaryColor,
                              ),
                            ),
                          ),
                        ],
                      )));
                } else {
                  /*Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          EmpresasAdmPage()));*/
                }
              },
              child: _cardOpcoes(
                  "Órgãos",
                  Colors.green,
                  Colors.green[400],
                  FontAwesomeIcons.landmark,
                  globalsAdm.dbOrgaos.length),
            ),
            FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () async {
                if (homeAdmStore.carregandoQtde) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AlertDialog(
                        title: Text(
                            'Aguarde o carregamento ou clique no botão para recarregar'),
                        //backgroundColor: Colors.transparent,
                        content: Icon(
                          FontAwesomeIcons.history,
                          color: Colors.red,
                          size: 60,
                        ),

                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              //await detalhesEmpresasAdmFunctions.deleteEmpresaAdm(jsonEmpresa['id']);
                            },
                            child: Text(
                              'OK',
                              style: TextStyle(
                                fontSize:
                                StyleGlobals().sizeTextMedio,
                                color: StyleGlobals().tertiaryColor,
                              ),
                            ),
                          ),
                        ],
                      )));
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
            ),
          ],
        );
      },
    );
  }

  Widget carregandoQtdeDados(){
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      child: GridView.count(
        shrinkWrap: true,
        childAspectRatio: 3 / 2,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
        children: <Widget>[
          _cardCarregamento(),
          _cardCarregamento(),
          _cardCarregamento(),
          _cardCarregamento(),
        ],
      ),
    );
  }

  Widget _cardCarregamento(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              //margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
              height: MediaQuery.of(context).size.width / 3.5,
              decoration: BoxDecoration(
                  color: Colors.white,
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardOpcoes(_texto, _cor1, _cor2, _icone, _qtde) {
    final homeAdmStore = Provider.of<HomeAdmStore>(context);
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
  }

  /// ANALYTICS GRAFICOS
  Widget analytics() {
    final homeAdmAnalytics = Provider.of<HomeAdmAnalytics>(context);
    final homeAdmStore = Provider.of<HomeAdmStore>(context);
    return Observer(
      builder: (_) {
        return Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: <Widget>[
              homeAdmStore.carregandoCategorias
                  ? carregandoGrafico()
                  /*Container(
                height: 32,
                width: 32,
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      StyleGlobals().primaryColor),
                  strokeWidth: 3,
                ),
              )*/
                  : PieChart(dataMap: homeAdmAnalytics.chartPieCategorias),
            ],
          ),
        );
      },
    );
  }

  Widget carregandoGrafico() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
        //color: Colors.red,
        //height: MediaQuery.of(context).size.height/2.3,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.chartPie,
              color: Colors.white,
              size: MediaQuery.of(context).size.width / 2.5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 15.0,
                        height: 15.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 40,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 15.0,
                        height: 15.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 40,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 15.0,
                        height: 15.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 40,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget barraTopo() {
    final homeAdmFunctions = Provider.of<HomeAdmFunctions>(context);
    final homeAdmStore = Provider.of<HomeAdmStore>(context);
    final homeAdmAnalytics = Provider.of<HomeAdmAnalytics>(context);
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
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
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
                          FontAwesomeIcons.running,
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
                homeAdmStore.setCarregandoCategorias(true);
                await homeAdmFunctions.getDadosBanco();
                await homeAdmAnalytics.criaGraficoEstados();
                homeAdmStore.setCarregandoCategorias(false);
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
