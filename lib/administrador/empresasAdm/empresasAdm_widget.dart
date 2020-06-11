import 'package:flutter/material.dart';
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
      child: ListView(
          children: <Widget>[
            barraTopo(),
            listaEmpresas(),
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

    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
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
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              decoration: BoxDecoration(
                //color: Colors.red,
                  gradient: LinearGradient(colors: [Colors.white, Colors.white]),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${_nomeEmpresa == '' ? "Não Informado" : _nomeEmpresa}',
                    style: TextStyle(
                      color: StyleGlobals().textColorForte,
                      fontSize: StyleGlobals().sizeTextMedio,
                    ),
                  ),

                  Text(
                    '${_nomeRepre == '' ? "Não Informado" : _nomeRepre}',
                    style: TextStyle(
                      color: StyleGlobals().textColorMedio,
                      fontSize: StyleGlobals().sizeTextMedio,
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Plano: ${_plano == 0 ? "Básico" : _plano == 1 ? "Profissional" : "Não Informado"}',
                        style: TextStyle(
                          color: StyleGlobals().tertiaryColor,
                          fontSize: StyleGlobals().sizeTextMedio,
                        ),
                      ),
                    ],
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