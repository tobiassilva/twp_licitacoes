import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:twp_licitacoes/administrador/subCategoriaAtividadeAdm/cadastrarSubCategoria/cadastrarSubAtividade_functions.dart';
import 'package:twp_licitacoes/administrador/subCategoriaAtividadeAdm/editarSubCategoria/consultarSubAtividade_page.dart';
import 'package:twp_licitacoes/globals.dart';

class CadastrarSubAtividadePage extends StatefulWidget {
  @override
  _CadastrarSubAtividadePageState createState() =>
      _CadastrarSubAtividadePageState();
}

class _CadastrarSubAtividadePageState extends State<CadastrarSubAtividadePage> {
  TextEditingController controllerNomeSubAtividade = TextEditingController();

  var jsonTipoCategoria;
  bool leuBanco = true;
  bool carregando = true;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future carregaDados() async {
    var jsonAux = await RequisicoesSubAtividades().getDadosTiposCategoria();
    setState(() {
      jsonTipoCategoria = jsonAux;
    });
    print("CATEGORIACATEGORIA: $jsonAux");
  }

  Future carregandoCampos() async {
    await carregaDados();

    setState(() {
      carregando = false;
    });
  }

  int idTipoCategoria;
  setSelectedRadio(int val) {
    setState(() {
      idTipoCategoria = val;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (leuBanco) {
      leuBanco = false;
    }
  }

  @override
  void initState() {
    idTipoCategoria = 0;
    carregandoCampos();
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
                                    ConsultarSubAtividades()));
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Nova SubAtividade",
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
                              controller: controllerNomeSubAtividade,
                              decoration: InputDecoration.collapsed(
                                hintText: "Nome da SubAtividade",
                                hintStyle:
                                    TextStyle(fontWeight: FontWeight.w600),
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: 3,
                            ),
                          ),
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
                          margin: EdgeInsets.only(
                              top: 10, bottom: 0, left: 20, right: 10),
                          padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
                          child: Container(
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: jsonTipoCategoria['data']
                                        ['categorias_de_atividades']
                                    .length,
                                itemBuilder: (BuildContext contex, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Flexible(
                                        child: Text(
                                          "${jsonTipoCategoria['data']['categorias_de_atividades'][index]['nome']}",
                                          style: TextStyle(
                                            color:
                                                StyleGlobals().textColorForte,
                                          ),
                                        ),
                                      ),
                                      Radio(
                                          value: jsonTipoCategoria['data']
                                                  ['categorias_de_atividades']
                                              [index]['id'],
                                          groupValue: idTipoCategoria,
                                          activeColor: Colors.blue,
                                          onChanged: (val) {
                                            print("Radio $val");
                                            setSelectedRadio(val);
                                          }),
                                    ],
                                  );
                                }),
                          ),
                        ),
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
                                if (controllerNomeSubAtividade
                                        .text.isNotEmpty &&
                                    idTipoCategoria != null) {
                                  setState(() {
                                    carregando = true;
                                  });
                                  await RequisicoesSubAtividades()
                                      .enviarFormularioSubAtividades(
                                    controllerNomeSubAtividade.text,
                                    idTipoCategoria,
                                  );

                                  setState(() {
                                    carregando = false;
                                  });
                                  _scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Cadastro Feito com Sucesso!')));

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ConsultarSubAtividades()));
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
