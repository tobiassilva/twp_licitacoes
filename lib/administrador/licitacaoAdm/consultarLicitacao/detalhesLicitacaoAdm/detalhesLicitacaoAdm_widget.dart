import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/administrador/homeAdm/homeAdm_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../globals.dart';
import 'detalhesLicitacaoAdm_functions.dart';
import 'detalhesLicitacaoAdm_store.dart';

class DetalhesLicitacaoAdmWidget {
  BuildContext context;
  var jsonLicitacao;
  DetalhesLicitacaoAdmWidget(this.context, this.jsonLicitacao);

  Widget detalhesLicitacaoPrincipal() {
    return ListView(
      children: <Widget>[
        barraTopo(),
        SizedBox(
          height: 35,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: _detalhesLicitacao(),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget barraTopo() {
    final detalhesLicitacaoAdmFunctions =
        Provider.of<DetalhesLicitacaoAdmFunctions>(context);
    final detalhesLicitacaoAdmStore =
        Provider.of<DetalhesLicitacaoAdmStore>(context);
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
              '${jsonLicitacao['nome'] == null || jsonLicitacao['nome'] == '' || jsonLicitacao['nome'] == 'null' ? 'Licitação' : jsonLicitacao['nome']}',
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
                          title: Text(
                              'Deseja apagar PERMANENTEMENTE a licitação "${jsonLicitacao['nome'] == null || jsonLicitacao['nome'] == '' || jsonLicitacao['nome'] == 'null' ? '' : jsonLicitacao['nome']} "do Órgão "${jsonLicitacao['orgao']}"?'),
                          //backgroundColor: Colors.transparent,
                          content: Text(
                              'Não será possível recupera-la posteriormente'),

                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(
                                'Cancelar',
                                style: TextStyle(
                                  fontSize: StyleGlobals().sizeTextMedio,
                                  color: StyleGlobals().tertiaryColor,
                                ),
                              ),
                            ),
                            FlatButton(
                              onPressed: () async {
                                detalhesLicitacaoAdmStore.setCarregando(true);
                                bool _apagou =
                                    await detalhesLicitacaoAdmFunctions
                                        .deleteLicitacaoAdm(
                                            jsonLicitacao['id']);
                                Navigator.of(context).pop();
                                if (_apagou) {
                                  detalhesLicitacaoAdmStore
                                      .setCarregando(false);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => AlertDialog(
                                            title: Text(
                                                'Licitação "${jsonLicitacao['nome'] == null || jsonLicitacao['nome'] == '' || jsonLicitacao['nome'] == 'null' ? '' : jsonLicitacao['nome']} "Apagada com Sucesso'),
                                            //backgroundColor: Colors.transparent,
                                            content: Icon(
                                              FontAwesomeIcons.check,
                                              color: Colors.green,
                                              size: 60,
                                            ),

                                            actions: <Widget>[
                                              FlatButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                      builder: (context) => HomeAdmPage()));
                                                  //await detalhesEmpresasAdmFunctions.deleteEmpresaAdm(jsonEmpresa['id']);
                                                },
                                                child: Text(
                                                  'OK',
                                                  style: TextStyle(
                                                    fontSize: StyleGlobals()
                                                        .sizeTextMedio,
                                                    color: StyleGlobals()
                                                        .tertiaryColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )));
                                } else {
                                  detalhesLicitacaoAdmStore
                                      .setCarregando(false);
                                  //NAO TEM INTERNET
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => AlertDialog(
                                            title: Text(
                                                'Você precisa estar Conectado para esta ação'),
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
                                                child: Text(
                                                  'OK',
                                                  style: TextStyle(
                                                    fontSize: StyleGlobals()
                                                        .sizeTextMedio,
                                                    color: StyleGlobals()
                                                        .tertiaryColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )));
                                }
                              },
                              child: Observer(
                                builder: (_) {
                                  return detalhesLicitacaoAdmStore.carregando
                                      ? SpinKitThreeBounce(
                                          color: StyleGlobals().primaryColor,
                                          size: StyleGlobals().sizeTitulo,
                                        )
                                      : Text(
                                          'Confirmar',
                                          style: TextStyle(
                                            fontSize:
                                                StyleGlobals().sizeTextMedio,
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

  Widget _detalhesLicitacao() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _informacaoDado('Órgão:', jsonLicitacao['orgao']),
        _informacaoDado(
            'Categoria de Atividade:', jsonLicitacao['categoria_de_atividade']),
        _informacaoDado('Subategoria de Atividade:',
            jsonLicitacao['subcategoria_de_atividade']),
        _informacaoDado('Preço Estimado:', jsonLicitacao['preco_estimado']),
        _informacaoDado('Data Limite para CRC Órgão:', jsonLicitacao['data_limite_para_crc_orgao']),
        _informacaoDado('Data Limite para envio de documentos:', jsonLicitacao['data_limite_envio_de_documentos']),
        _informacaoDado('Data e hora da sessão pública:', jsonLicitacao['data_e_hora_da_sessao_publica']),
        _informacaoDado('Modalidade:', jsonLicitacao['modalidade_de_licitacao']),
        _informacaoDado('Edital:', jsonLicitacao['edital']),
        _informacaoDado('Situação:', jsonLicitacao['situacao']),
        Divider(
          height: 25,
          thickness: 1,
        ),
        _informacaoDadoTexto('Observações', jsonLicitacao['observacoes']),
        SizedBox(
          height: 20,
        ),
        _informacaoDadoTexto('Objeto Resumido', jsonLicitacao['objeto_resumido']),
        SizedBox(
          height: 15,
        ),
        _links(jsonLicitacao['telefone'])
      ],
    );
  }

  Widget _informacaoDado(text, value) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
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
          ),
          SizedBox(
            width: 3,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Flexible(
                  child: Text(
                    '${value == '' || value == null || value == 'null' ? 'Não Informado' : value}',
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
          ),
        ],
      ),
    );
  }

  Widget _informacaoDadoTexto(text, value){
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                  fontSize: StyleGlobals().sizeTextMedio,
                  color: StyleGlobals().textColorForte,
                  //fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: StyleGlobals().sizeText,
                    color: StyleGlobals().textColorForte,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _links(_numeroTel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        jsonLicitacao['link'] != null && jsonLicitacao['link'] != ''
            ? Container(
          height: 40,
          margin:
          EdgeInsets.only(left: 30, right: 30, bottom: 4, top: 15),
          decoration: BoxDecoration(
            //color: Color.fromRGBO(19, 104, 136, 1),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                color: StyleGlobals().tertiaryColor, width: 3.0),
          ),
          //padding: EdgeInsets.all(10),rderRadius: BorderRadius.circular(30),
          child: FlatButton(
            onPressed: () async {
              if (await canLaunch('${jsonLicitacao['link']}')) {
                await launch('${jsonLicitacao['link']}');
              } else {
                throw 'Could not launch';
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(FontAwesomeIcons.globeAmericas,
                    color: StyleGlobals().tertiaryColor, size: 18),
                Text(
                  ' Site',
                  style: TextStyle(color: StyleGlobals().tertiaryColor,
                    fontSize: StyleGlobals().sizeSubtitulo
                  ),
                )
              ],
            ),
          ),
        )
            : Container(),
      ],
    );
  }
}
