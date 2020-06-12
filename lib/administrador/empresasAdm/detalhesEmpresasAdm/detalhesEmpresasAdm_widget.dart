import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/administrador/homeAdm/homeAdm_page.dart';

import '../../../globals.dart';
import 'detalhesEmpresasAdm_functions.dart';

class DetalhesEmpresasAdmWidget {

  BuildContext context;
  var jsonEmpresa;
  DetalhesEmpresasAdmWidget(this.context, this.jsonEmpresa);

  Widget detalhesEmpresaPrincipal(){
    return ListView(
      children: <Widget>[
        barraTopo(),
        SizedBox(
          height: 35,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: _detalhesEmpresa(),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget barraTopo() {
    final detalhesEmpresasAdmFunctions = Provider.of<DetalhesEmpresasAdmFunctions>(context);
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
          Flexible(
            child: Text(
              '${jsonEmpresa['nome_empresa']}',
              style: TextStyle(
                fontSize: StyleGlobals().sizeTitulo,
                color: StyleGlobals().textColorForte,
                //fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Container(
            //margin: EdgeInsets.only(left: 20, right: 20),
            child: FlatButton(
              padding: EdgeInsets.all(0),
              //clipBehavior: Clip.none,

              onPressed: () {
                //Navigator.of(context).pop();
                print('APAGANDO?');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AlertDialog(
                  title: Text('Deseja apagar PERMANENTEMENTE a empresa "${jsonEmpresa['nome_empresa']}"?'),
                  //backgroundColor: Colors.transparent,
                      content: Text('Não será possível recupera-la posteriormente'),

                  actions: <Widget>[
                    FlatButton(
                      onPressed: ()=>Navigator.of(context).pop(),
                      child: Text('Cancelar',
                        style: TextStyle(
                          fontSize: StyleGlobals().sizeTextMedio,
                          color: StyleGlobals().tertiaryColor,
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () async {
                        await detalhesEmpresasAdmFunctions.deleteEmpresaAdm(jsonEmpresa['id']);
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AlertDialog(
                              title: Text('"${jsonEmpresa['nome_empresa']}" Apagada com Sucesso'),
                              //backgroundColor: Colors.transparent,
                              content: Icon(
                                FontAwesomeIcons.check,
                                color: Colors.green,
                                size: 60,
                              ),

                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (context) => HomeAdmPage()));
                                    //await detalhesEmpresasAdmFunctions.deleteEmpresaAdm(jsonEmpresa['id']);
                                  },
                                  child: Text('OK',
                                    style: TextStyle(
                                      fontSize: StyleGlobals().sizeTextMedio,
                                      color: StyleGlobals().tertiaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            )));
                      },
                      child: Text('Confirmar',
                        style: TextStyle(
                          fontSize: StyleGlobals().sizeTextMedio,
                          color: StyleGlobals().tertiaryColor,
                        ),
                      ),
                    ),
                  ],
                )));
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
                          FontAwesomeIcons.solidTrashAlt,
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

  Widget _detalhesEmpresa(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _informacaoDado('Representante:', jsonEmpresa['nome_representante']),
        _informacaoDado('Email:', jsonEmpresa['email']),
        _informacaoDado('Telefone:', jsonEmpresa['telefone']),
        _informacaoDado('CNPJ:', jsonEmpresa['cnpj']),
        _informacaoDado('CEP:', jsonEmpresa['cep']),
        _informacaoDado('Logradouro:', jsonEmpresa['logradouro']),
        _informacaoDado('Numero:', jsonEmpresa['numero']),
        _informacaoDado('Complemento:', jsonEmpresa['complemento']),
        _informacaoDado('Cidade:', jsonEmpresa['cidade']),
        _informacaoDado('Estado:', jsonEmpresa['estado']),
      ],
    );
  }

  Widget _informacaoDado(text, value){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 7, 0, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(
              text,
              style: TextStyle(
                fontSize: StyleGlobals().sizeTextMedio,
                color: StyleGlobals().textColorForte,
                //fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Text(
            '${ value == '' ? 'Não Informado' : value}',
            style: TextStyle(
              fontSize: StyleGlobals().sizeTextMedio,
              color: StyleGlobals().textColorForte,
              //fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }


}