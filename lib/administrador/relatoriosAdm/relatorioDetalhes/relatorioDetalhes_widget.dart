import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/administrador/relatoriosAdm/relatorioDetalhes/relatorioDetalhes_functions.dart';
import 'package:twp_licitacoes/globals.dart';


class RelatoriosDetalhesWidget {
  BuildContext context;
  RelatoriosDetalhesWidget(this.context);

  List<DropdownMenuItem<String>> dropDownStatus;

  Widget relatoriosWidgetPrincipal() {
    RelatoriosDetalhesFunctions relatoriosFunctions =
    Provider.of<RelatoriosDetalhesFunctions>(context, listen: false);

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
                  'Relatório de Licitações\n"${relatoriosFunctions.statusEsc['nome']}"',
                  style: TextStyle(
                    fontSize: StyleGlobals().sizeTitulo,
                    color: StyleGlobals().textColorMedio,
                  ),
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child:
                      _relatorioWidget(),

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


          /*Container(
            //margin: EdgeInsets.only(left: 20, right: 20),
            child: GestureDetector(
              //clipBehavior: Clip.none,

              onTap: () {

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
                          FontAwesomeIcons.download,
                          size: StyleGlobals().sizeTitulo,
                          color: StyleGlobals().primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),*/

        ],
      ),
    );
  }


  Widget _relatorioWidget(){
    RelatoriosDetalhesFunctions relatoriosDetalhesFunctions = Provider.of<RelatoriosDetalhesFunctions>(context);
    return Container(
      //color: Colors.red,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: StyleGlobals().textColorFraco)
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: relatoriosDetalhesFunctions.licitacoesList.length,
        itemBuilder:(_, index){
          return Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(width: 1.2, color: StyleGlobals().textColorFraco)
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Modalidade: ',
                      style: TextStyle(
                        fontSize: StyleGlobals().sizeText,
                        color: StyleGlobals().textColorMedio,
                      ),
                    ),
                    Text(
                      '${relatoriosDetalhesFunctions.licitacoesList[index]['nome']}',
                      style: TextStyle(
                        fontSize: StyleGlobals().sizeSubtitulo,
                        color: StyleGlobals().textColorMedio,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Quantidade de Licitações',
                          style: TextStyle(
                            color: StyleGlobals().textColorForte,
                            fontSize: StyleGlobals().sizeText,
                          ),
                        ),
                        Text(
                          '${relatoriosDetalhesFunctions.licitacoesList[index]['licitacoes'].length}',
                          style: TextStyle(
                            color: StyleGlobals().textColorForte,
                            fontSize: StyleGlobals().sizeText,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Valor Total',
                          style: TextStyle(
                            color: StyleGlobals().textColorForte,
                            fontSize: StyleGlobals().sizeText,
                          ),
                        ),
                        Text(
                          '${relatoriosDetalhesFunctions.licitacoesList[index]['valorTotal']}',
                          style: TextStyle(
                            color: StyleGlobals().textColorForte,
                            fontSize: StyleGlobals().sizeText,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),


                SizedBox(
                  height: 20,
                ),

              ],
            ),
          );
  },
      ),
    );
  }


}