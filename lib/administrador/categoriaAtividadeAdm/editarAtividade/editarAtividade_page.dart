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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleGlobals().primaryColor,
        title: Text(
          "Detalhes",
          style: TextStyle(color: StyleGlobals().textColorSecundary),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: StyleGlobals().colorGradiente,
          ),
        ),
        iconTheme: IconThemeData(
          color: StyleGlobals().secundaryColor,
        ),
        centerTitle: true,
      ),
      body: carregando
          ? SpinKitThreeBounce(
              color: StyleGlobals().primaryColor,
              size: StyleGlobals().sizeTitulo,
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child:
                    Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
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
                        controller: editarAtividadesFunctions.nomeAtividade,
                        decoration: InputDecoration.collapsed(
                          hintText: "Nome da Atividade",
                          hintStyle: TextStyle(fontWeight: FontWeight.w600),
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

                          setState(() {
                            carregando = true;
                          });

                          await updateFormulario(
                            
                            editarAtividadesFunctions.nomeAtividade.text,
                          );

                          setState(() {
                            carregando = false;
                          });

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => HomePage()));
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
                            editarAtividadesFunctions.nomeAtividade.text,
                          );

                          setState(() {
                            carregando = false;
                          });

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => HomePage()));
                        },
                      ),
                    ),
                  ),
                ]),
              ),
            ),
    );
  }
  //enviando Atualização
  Future updateFormulario(nome) async {
    var resultadoConexao = await editarAtividadesFunctions.resultadoInternet();
    if (resultadoConexao == false) {
      var data = await hasuraConnect.mutation(updateQueryAtividades(nome));

      print(data);
    } else {}
  }

  String updateQueryAtividades(nome) {
    return """
    mutation MyMutation {
  update_categorias_de_atividades(where: {nome: {_eq: "$nome"}}, _set: {nome: "${editarAtividadesFunctions.nomeAtividade.text}"}) {
    returning {
      id
    }
  }
}
""";
}

  //deletando Atividade
  Future deleteFormulario(nome) async {
    var resultadoConexao = await editarAtividadesFunctions.resultadoInternet();
    if (resultadoConexao == false) {
      var data = await hasuraConnect.mutation(deleteQueryAtividades(nome));

      print(data);
    } else {}
  }

  String deleteQueryAtividades(nome) {
    return """
mutation MyMutation {
  delete_categorias_de_atividades(where: {nome: {_eq: "$nome"}}) {
    returning {
      id
    }
  }
}
""";
  }
}
