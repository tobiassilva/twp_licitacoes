import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


import '../../globals.dart';
import 'detalhesEmpresasAdm/detalhesEmpresasAdm_page.dart';
import 'empresasAdm_functions.dart';
import '../globalsAdm.dart' as globalsAdm;


class EmpresasAdmWidget {

  BuildContext context;
  EmpresasAdmWidget(this.context);

  Widget empresasAdmPrincipal(){
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
          children: <Widget>[
            barraTopo(),
            Expanded(child: listaEmpresas()),
          ],
      ),
    );
  }

  Widget barraTopo() {
    final empresasAdmFunctions = Provider.of<EmpresasAdmFunctions>(context);
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

        ],
      ),
    );
  }

  Widget listaEmpresas(){

    return Scrollbar(
      child: ListView.builder(
        //physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: globalsAdm.dbEmpresas.length,
        itemBuilder: (_, index){
          int _plano = globalsAdm.dbEmpresas[index]['plano'];
          String _nomeRepre = globalsAdm.dbEmpresas[index]['nome_representante'];
          String _nomeEmpresa = globalsAdm.dbEmpresas[index]['nome_empresa'];
          int _id = globalsAdm.dbEmpresas[index]['id'];
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DetalhesEmpresasAdm(globalsAdm.dbEmpresas[index]))
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
                      FontAwesomeIcons.solidBuilding,
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
                          '${_nomeEmpresa == '' ? "Não Informado" : _nomeEmpresa}',
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
                              FontAwesomeIcons.userAlt,
                              size: StyleGlobals().sizeText,
                              color: StyleGlobals().tertiaryColor,
                            ),
                            Text(
                              ' ${_nomeRepre == '' ? "Não Informado" : _nomeRepre}',
                              style: TextStyle(
                                color: StyleGlobals().textColorMedio,
                                fontSize: StyleGlobals().sizeText,
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
                              FontAwesomeIcons.coins,
                              size: StyleGlobals().sizeText,
                              color: StyleGlobals().tertiaryColor,
                            ),
                            Text(
                              ' ${_plano == 0 ? "Básico" : _plano == 1 ? "Profissional" : "Não Informado"}',
                              style: TextStyle(
                                color: StyleGlobals().textColorMedio,
                                fontSize: StyleGlobals().sizeText,
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