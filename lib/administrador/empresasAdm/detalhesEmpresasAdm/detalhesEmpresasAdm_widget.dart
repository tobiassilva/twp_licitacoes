import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../globals.dart';

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