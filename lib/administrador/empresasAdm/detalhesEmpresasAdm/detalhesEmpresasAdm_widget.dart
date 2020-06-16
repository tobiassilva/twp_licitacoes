import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/administrador/homeAdm/homeAdm_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../globals.dart';
import 'detalhesEmpresasAdm_store.dart';
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
    final detalhesEmpresasAdmStore = Provider.of<DetalhesEmpresasAdmStore>(context);
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
                        detalhesEmpresasAdmStore.setCarregando(true);
                        bool _apagou = await detalhesEmpresasAdmFunctions.deleteEmpresaAdm(jsonEmpresa['id']);
                        Navigator.of(context).pop();
                        if(_apagou){
                          detalhesEmpresasAdmStore.setCarregando(false);
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
                        } else {
                          detalhesEmpresasAdmStore.setCarregando(false);
                          //NAO TEM INTERNET
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AlertDialog(
                                title: Text('Você precisa estar Conectado para esta ação'),
                                //backgroundColor: Colors.transparent,
                                content: Icon(
                                  Icons.signal_wifi_off,
                                  color: Colors.red,
                                  size: 60,
                                ),

                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
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
                        }
                      },
                      child: Observer(
                        builder: (_){
                          return detalhesEmpresasAdmStore.carregando ?
                          SpinKitThreeBounce(
                            color: StyleGlobals().primaryColor,
                            size: StyleGlobals().sizeTitulo,
                          )
                              : Text('Confirmar',
                            style: TextStyle(
                              fontSize: StyleGlobals().sizeTextMedio,
                              color: StyleGlobals().tertiaryColor,
                            ),
                          );
                        },
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

        jsonEmpresa['telefone'] != null && jsonEmpresa['telefone'] != ''
        ? _ligar(jsonEmpresa['telefone']) : Container(),
      ],
    );
  }

  Widget _informacaoDado(text, value){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
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

          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              '${ value == '' || value == null || value == 'null' ? 'Não Informado' : value}',
              style: TextStyle(
                fontSize: StyleGlobals().sizeTextMedio,
                color: StyleGlobals().textColorForte,
                //fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _ligar(_numeroTel) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(
              left: 30, right: 30, bottom: 4, top: 15),
          decoration: BoxDecoration(
            //color: Color.fromRGBO(19, 104, 136, 1),
            borderRadius: BorderRadius.circular(30),
            border:
            Border.all(color: Colors.green, width: 3.0),
          ),
          child: FlatButton(
            onPressed: ()async {
              if (await canLaunch('tel://+55$_numeroTel')) {
              await launch(
                'tel://+55$_numeroTel');
              } else {
              throw 'Could not launch $_numeroTel';
              }
            },
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.green,
                ),
                Text(
                  'ligar',
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

}