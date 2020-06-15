import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/administrador/categoriaAtividadeAdm/editarAtividade/editarAtividade_functions.dart';
import 'package:twp_licitacoes/globals.dart';
import 'package:twp_licitacoes/home/home.dart';

HasuraConnect hasuraConnect =
    HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

class EditarAtividadesPage extends StatefulWidget {
  var jsonAtividades;
  EditarAtividadesPage(this.jsonAtividades);
  @override
  _EditarAtividadesPageState createState() =>
      _EditarAtividadesPageState(this.jsonAtividades);
}

class _EditarAtividadesPageState extends State<EditarAtividadesPage> {
  var jsonAtividadesEsc;
  _EditarAtividadesPageState(this.jsonAtividadesEsc);

  UpdateAtividadesFunctions editarAtividadesFunctions;
  bool carregando = true;
  bool leuBanco = true;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    editarAtividadesFunctions = Provider.of<UpdateAtividadesFunctions>(context);
    if (leuBanco) {
      leuBanco = false;
      atualizaControllers();
    }
  }

  Future atualizaControllers() async {
    await editarAtividadesFunctions.atualizaControladores(jsonAtividadesEsc);

    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: carregando
            ? SpinKitThreeBounce(
                color: StyleGlobals().primaryColor,
                size: StyleGlobals().sizeTitulo,
              )
            : Container(
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
                                        HomePage()));
                              },
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Detalhes Atividade",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: StyleGlobals().sizeTitulo,
                                  color: StyleGlobals().textColorForte),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child:
                            Column(mainAxisSize: MainAxisSize.max, children: <
                                Widget>[
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
                                controller:
                                    editarAtividadesFunctions.nomeAtividade,
                                decoration: InputDecoration.collapsed(
                                  hintText: "Nome da Atividade",
                                  hintStyle:
                                      TextStyle(fontWeight: FontWeight.w600),
                                ),
                                keyboardType: TextInputType.multiline,
                                maxLines: 20,
                              ),
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
                                      "Atualizar ",
                                      style: TextStyle(
                                        color:
                                            StyleGlobals().textColorSecundary,
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
                                  setState(() {
                                    carregando = true;
                                  });

                                  await updateFormulario(
                                    editarAtividadesFunctions.id,
                                    editarAtividadesFunctions
                                        .nomeAtividade.text,
                                  );

                                  setState(() {
                                    carregando = false;
                                  });

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomePage()));
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
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
                                    Icon(
                                      FontAwesomeIcons.solidTrashAlt,
                                      size: 20,
                                      color: StyleGlobals().textColorSecundary,
                                    )
                                  ],
                                ),
                                onPressed: () async {
                                  setState(() {
                                    carregando = true;
                                  });

                                  await deleteFormulario(
                                    editarAtividadesFunctions
                                        .nomeAtividade.text,
                                  );

                                  setState(() {
                                    carregando = false;
                                  });

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomePage()));
                                },
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  //enviando Atualização
  Future updateFormulario(id, nome) async {
    var resultadoConexao = await editarAtividadesFunctions.resultadoInternet();
    if (resultadoConexao == false) {
      var data = await hasuraConnect.mutation(updateQueryAtividades(id, nome));

      print(data);
    } else {}
  }

  String updateQueryAtividades(id, nome) {
    return """
    mutation MyMutation {
  update_categorias_de_atividades(where: {id: {_eq: "$id"}}, _set: {nome: "${editarAtividadesFunctions.nomeAtividade.text}"}) {
    returning {
      id
    }
  }
}
""";
  }

  //deletando Atividade
  Future deleteFormulario(id) async {
    var resultadoConexao = await editarAtividadesFunctions.resultadoInternet();
    if (resultadoConexao == false) {
      var data = await hasuraConnect.mutation(deleteQueryAtividades(id));

      print(data);
    } else {}
  }

  String deleteQueryAtividades(id) {
    return """
mutation MyMutation {
  delete_categorias_de_atividades(where: {id: {_eq: "$id"}}) {
    returning {
      id
    }
  }
}
""";
  }
}
