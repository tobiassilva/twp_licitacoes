import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/administrador/relatoriosAdm/relatorioDetalhes/relatorioDetalhes_page.dart';
import 'package:twp_licitacoes/administrador/relatoriosAdm/relatorios_functions.dart';
import 'package:twp_licitacoes/administrador/relatoriosAdm/store/relatorios_store.dart';
import 'package:twp_licitacoes/globals.dart';

class RelatoriosWidget {
  BuildContext context;

  RelatoriosWidget(this.context);

  List<DropdownMenuItem<String>> dropDownStatus;

  /// EXEMPLOS
  /// RELATÓRIO DE EMPRESA POR STATUS
  /// MOSTRA QUANTAS TEM, VALOR TOTAL DELAS, ETC
  ///
  /// OU ESCOLHE O STATUS NO FILTRO
  /// AI MOSTRA AS LICIT DAQUELE STATUS POR TIPO, (CADA PARTE SAO AS LICITACOES DE DETERMINADO TIPO)

  Widget relatoriosWidgetPrincipal() {
    RelatoriosFunctions relatoriosFunctions =
    Provider.of<RelatoriosFunctions>(context, listen: false);
    dropDownStatus = relatoriosFunctions.dropDownStatusItems;
    RelatoriosStore relatoriosStore = Provider.of<RelatoriosStore>(context, listen: false);
    return Column(
      children: <Widget>[
        barraTopo(),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
              right: 15,
              left: 15,
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Selecione o Filtro',
                  style: TextStyle(
                    fontSize: StyleGlobals().sizeTitulo,
                    color: StyleGlobals().textColorMedio,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () async {
                          print('AAAAAAAAA');
                          /*Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => CadastroPage())
                              );*/

                          //relatoriosStore.setRelatStatus(true);
                          _statusDialog();
                        },
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.only(
                            left: 35,
                            right: 35,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: StyleGlobals().primaryColor),
                          child: Center(
                            child: Text(
                              'Status',
                              style: TextStyle(
                                  color: StyleGlobals().secundaryColor,
                                  fontSize: StyleGlobals().sizeSubtitulo),
                            ),
                          ),
                        ),
                      ),

                      /*Observer(
                        builder: (_){
                          return !relatoriosStore.relatStatus
                          ?  :
                              filtroStatus();
                        },
                      ),*/

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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
          /*GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CadastroLicitacaoAdmPage())
              );
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
                        Icons.add,
                        size: StyleGlobals().sizeTitulo+5,
                        color: StyleGlobals().primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }


  /// FILTROS STATUS
  ///
  Widget filtroStatus(){

    RelatoriosFunctions relatoriosFunctions =
    Provider.of<RelatoriosFunctions>(context);
    RelatoriosStore relatoriosStore = Provider.of<RelatoriosStore>(context);

    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      //height: MediaQuery.of(context).size.height / 2,
      //width: MediaQuery.of(context).size.width,
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
                    relatoriosStore.setRelatStatus(false);
                  },
                  child: Icon(
                      IconData(57676, fontFamily: 'MaterialIcons')),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Informe o Status desejado',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 185, 255, 1),
                          fontSize: 15.0,
                          fontFamily: "Montserrat",
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
//                  /height: 50,
                  child: DropdownButton(
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: "Montserrat",
                    ),
                    //items: ,
                    value: relatoriosStore.statusSelecionado,
                    items: dropDownStatus,
                    iconSize: 20.0,
                    iconEnabledColor:
                    Color.fromRGBO(255, 255, 255, 1),
                    hint: Text(
                      'Carregando...',
                    ),
                    onChanged: relatoriosStore.setStatusSelecionado,
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );


  }

  /// DIALOG FILTROS
  ///
  ///
  Future<bool> _onWillPop() {
    Navigator.of(context).pop(false);
    print("Teste");
  }

  Future<void> _statusDialog() async {
    RelatoriosFunctions relatoriosFunctions =
        Provider.of<RelatoriosFunctions>(context, listen: false);
    RelatoriosStore relatoriosStore = Provider.of<RelatoriosStore>(context, listen: false);
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return MaterialApp(
          home: WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                  height: MediaQuery.of(context).size.height / 2,
                  //width: MediaQuery.of(context).size.width,
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
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                  Icons.arrow_back_ios,
                                color: StyleGlobals().secundaryColor,
                                size: StyleGlobals().sizeSubtitulo,
                              ),
                            ),

                            Expanded(
                              child: Text(
                                'Selecione',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: StyleGlobals().textColorSecundary,
                                  fontSize: StyleGlobals().sizeSubtitulo,


                                ),
                              ),
                            ),
                            FlatButton(
                              onPressed: null,
                              child: Icon(
                                IconData(57676,),
                                color: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[

                            Expanded(
                              child: Container(
                                child: Container(
                                  height: MediaQuery.of(context).size.height / 2,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: relatoriosFunctions.listaStatus.length,
                                    itemBuilder: (_, index){
                                      return Column(
                                        children: <Widget>[
                                          FlatButton(
                                            onPressed: (){
                                              Navigator.of(context).push(
                                                MaterialPageRoute(builder: (context) => RelatoriosDetalhesPage(relatoriosFunctions.listaStatus[index]))
                                              );
                                            },
                                            child: Text(
                                                relatoriosFunctions.listaStatus[index]['nome']
                                            ),
                                          ),
                                          Divider(),
                                        ],
                                      );
                                    },
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
              ),
            ),
          ),
        );
      },
    );
  }
}
