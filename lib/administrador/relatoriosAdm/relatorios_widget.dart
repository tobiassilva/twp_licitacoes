import 'package:flutter/material.dart';
import 'package:twp_licitacoes/globals.dart';

class RelatoriosWidget {
  BuildContext context;

  RelatoriosWidget(this.context);

  Widget relatoriosWidgetPrincipal() {
    return Column(
      children: <Widget>[
        barraTopo(),
        Expanded(
          child: ListView(
            children: <Widget>[],
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
}
