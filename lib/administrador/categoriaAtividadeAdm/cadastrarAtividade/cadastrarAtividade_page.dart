import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twp_licitacoes/administrador/categoriaAtividadeAdm/cadastrarAtividade/cadastrarAtividade_functions.dart';
import 'package:twp_licitacoes/globals.dart';

import '../editarAtividade/consultarAtividade_page.dart';

class CadastrarAtividadePage extends StatefulWidget {
  @override
  _CadastrarAtividadePageState createState() => _CadastrarAtividadePageState();
}

class _CadastrarAtividadePageState extends State<CadastrarAtividadePage> {
  TextEditingController controllerNomeAtividade = TextEditingController();
  TextEditingController controllerSegmento = TextEditingController();

  bool carregando = true;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  /*Future iniciaPage() async {
    await cadastroFunctions.getDadosBanco();
    setState(() {
      carregando = false;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          body:
              /*carregando ? SpinKitThreeBounce(
          color: StyleGlobals().primaryColor,
          size: StyleGlobals().sizeTitulo,
        )
        :*/
              Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 75,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: GestureDetector(
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: StyleGlobals().sizeTitulo,
                            color: StyleGlobals().primaryColor,
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ConsultarAtividades()));
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Nova Atividade",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: StyleGlobals().sizeTitulo,
                              color: StyleGlobals().textColorForte),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(
                                      5.0,
                                      5.0,
                                    )),
                              ]),
                          margin: EdgeInsets.only(
                              top: 10, bottom: 0, left: 20, right: 10),
                          padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
                          child: Container(
                            height: 40,
                            child: TextField(
                              controller: controllerNomeAtividade,
                              decoration: InputDecoration.collapsed(
                                hintText: "Nome da Atividade",
                                hintStyle:
                                    TextStyle(fontWeight: FontWeight.w600),
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: 3,
                            ),
                          ),
                        ),
                        /*SizedBox(
                    height: 5,
                  ),
                   Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5.0,
                              spreadRadius: 2.0,
                              offset: Offset(
                                5.0,
                                5.0,
                              )),
                        ]),
                    margin: EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 10),
                    padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
                    child: Container(
                      height: 40,
                      child: TextField(
                        controller: controllerSegmento,
                        decoration: InputDecoration.collapsed(
                          hintText: "Segmento",
                          hintStyle: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                      ),
                    ),
                  ),*/
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          width: 250,
                          height: 45,
                          decoration: BoxDecoration(
                              color: StyleGlobals().primaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: FlatButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Enviar ",
                                    style: TextStyle(
                                      color: StyleGlobals().textColorSecundary,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Icon(
                                    FontAwesomeIcons.check,
                                    size: 20,
                                    color: StyleGlobals().textColorSecundary,
                                  )
                                ],
                              ),
                              onPressed: () async {
                                if (controllerNomeAtividade.text.isNotEmpty) {
                                  setState(() {
                                    carregando = true;
                                  });
                                  await RequisicoesAtividades()
                                      .enviarFormularioAtividades(
                                    controllerNomeAtividade.text,
                                  );

                                  setState(() {
                                    carregando = false;
                                  });
                                  _scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Cadastro Feito com Sucesso!')));
                                } else {
                                  _scaffoldKey.currentState
                                      .showSnackBar(SnackBar(
                                    content: Text('O Campo nao pode ser Vazio'),
                                  ));
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
