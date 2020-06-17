import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twp_licitacoes/administrador/licitacaoAdm/cadastroLicitacao/cadastroLicitacaoAdm_page.dart';

import '../../../globals.dart';
import '../../globalsAdm.dart' as globalsAdm;
import 'detalhesLicitacaoAdm/detalhesLicitacaoAdm_page.dart';

class ConsultarLicitacaoAdmWidget {

  BuildContext context;
  ConsultarLicitacaoAdmWidget(this.context);


  Widget consultarLicitacoesAdmPrincipal(){
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          barraTopo(),
          Expanded(child: listaLicitacoes()),
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
          GestureDetector(
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
          ),

        ],
      ),
    );
  }

  Widget listaLicitacoes(){

    return Scrollbar(
      child: ListView.builder(
        //physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: globalsAdm.dbLicitacoes.length,
        itemBuilder: (_, index){
          String _orgao = globalsAdm.dbLicitacoes[index]['orgao'];
          String _categoria = globalsAdm.dbLicitacoes[index]['categoria_de_atividade'];
          String _nomeLicit = globalsAdm.dbLicitacoes[index]['nome'];
          int _id = globalsAdm.dbLicitacoes[index]['id'];
          print('_nomeLicit: $_nomeLicit');
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DetalhesLicitacaoAdmPage(globalsAdm.dbLicitacoes[index]))
              );
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
              padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
              decoration: BoxDecoration(
                //color: Colors.red,
                  gradient: LinearGradient(colors: [Colors.white, Colors.white]),
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
              child: Row(
                children: <Widget>[

                  Container(
                    child: Icon(
                      FontAwesomeIcons.fileSignature,
                      size: 35,
                      color: StyleGlobals().primaryColor,
                    ),
                  ),

                  SizedBox(
                    width: 15,
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${_nomeLicit == '' || _nomeLicit == null ? "Não Informado" : _nomeLicit}',
                          style: TextStyle(
                            color: StyleGlobals().textColorMedio,
                            fontSize: StyleGlobals().sizeSubtitulo,
                          ),
                        ),

                        SizedBox(
                          height: 5,
                        ),

                        Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.landmark,
                              size: StyleGlobals().sizeText,
                              color: StyleGlobals().tertiaryColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: Text(
                                '${_orgao == '' || _orgao == 'null' || _orgao == null ? "Órgão Não Informado" : _orgao}',
                                style: TextStyle(
                                  color: StyleGlobals().textColorMedio,
                                  fontSize: StyleGlobals().sizeText,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 5,
                        ),

                        Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.ticketAlt,
                              size: StyleGlobals().sizeText,
                              color: StyleGlobals().tertiaryColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: Text(
                                '${_categoria == '' || _categoria == null || _categoria == 'null' ? "Categoria Não Informada" : _categoria}',
                                style: TextStyle(
                                  color: StyleGlobals().textColorMedio,
                                  fontSize: StyleGlobals().sizeText,
                                ),
                              ),
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
        },
      ),
    );
  }
}