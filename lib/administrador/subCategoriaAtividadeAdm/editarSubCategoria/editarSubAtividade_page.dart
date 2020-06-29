import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:provider/provider.dart';

import 'package:twp_licitacoes/administrador/subCategoriaAtividadeAdm/cadastrarSubCategoria/cadastrarSubAtividade_functions.dart';
import 'package:twp_licitacoes/administrador/subCategoriaAtividadeAdm/editarSubCategoria/editarSubAtividade_functions.dart';
import 'package:twp_licitacoes/globals.dart';
import 'package:twp_licitacoes/home/home.dart';

HasuraConnect hasuraConnect =
    HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

class EditarSubAtividadesPage extends StatefulWidget {
  var jsonSubAtividades;
  EditarSubAtividadesPage(this.jsonSubAtividades);
  @override
  _EditarSubAtividadesPageState createState() =>
      _EditarSubAtividadesPageState(this.jsonSubAtividades);
}

class _EditarSubAtividadesPageState extends State<EditarSubAtividadesPage> {
  var jsonSubAtividadesEsc;
  _EditarSubAtividadesPageState(this.jsonSubAtividadesEsc);

  UpdateSubAtividadesFunctions editarSubAtividadesFunctions;
  bool carregando = true;
  bool leuBanco = true;

  var jsonTipoCategoria;

  Future carregaDados() async {
    //var jsonInformacoes = await requisicoes().carregaInfos();
    var jsonAux = await RequisicoesSubAtividades().getDadosTiposCategoria();
    setState(() {
      jsonTipoCategoria = jsonAux;
    });
    print("IIIIIIIIIIIIIIIII: $jsonAux");
  }

  Future carregandoCampos() async {
    await carregaDados();
    print("JSONSUBCATEGORIA: $jsonSubAtividadesEsc");
    setSelectedRadio(jsonSubAtividadesEsc['id_categoria']);
    await atualizaControllers();
    setState(() {
      carregando = false;
    });
  }

  setSelectedRadio(int val) {
    setState(() {
      editarSubAtividadesFunctions.idTipoCategoria = val;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    editarSubAtividadesFunctions =
        Provider.of<UpdateSubAtividadesFunctions>(context);
    if (leuBanco) {
      leuBanco = false;
      carregandoCampos();
    }
  }

  Future atualizaControllers() async {
    await editarSubAtividadesFunctions
        .atualizaControladores(jsonSubAtividadesEsc);

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
                              "Detalhes SubAtividade",
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
                                controller: editarSubAtividadesFunctions
                                    .nomeSubAtividade,
                                decoration: InputDecoration.collapsed(
                                  hintText: "Nome da SubAtividade",
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
                          SizedBox(
                            height: 10,
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
                                            groupValue:
                                                editarSubAtividadesFunctions
                                                    .idTipoCategoria,
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
                                    editarSubAtividadesFunctions.id,
                                    editarSubAtividadesFunctions
                                        .nomeSubAtividade.text,
                                    editarSubAtividadesFunctions
                                        .idTipoCategoria,
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
                                    editarSubAtividadesFunctions.id,
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
  Future updateFormulario(id, nome, idTipo) async {
    var resultadoConexao = await RequisicoesSubAtividades().resultadoInternet();
    if (resultadoConexao == false) {
      var data = await hasuraConnect
          .mutation(updateQuerySubAtividade(id, nome, idTipo));

      print(data);
    } else {

    }
  }

String updateQuerySubAtividade(id, nome, idTipo){
  return """
  mutation MyMutation {
  update_subcategorias_de_atividades(where: {id: {_eq: "$id"}}, _set: {nome: "${editarSubAtividadesFunctions.nomeSubAtividade.text}", 
  id_categoria: "${editarSubAtividadesFunctions.idTipoCategoria}"}) {
    returning {
      id
    }
  }
}
""";
}

  //deletando Atividade
  Future deleteFormulario(id) async {
    var resultadoConexao =
        await editarSubAtividadesFunctions.resultadoInternet();
    if (resultadoConexao == false) {
      var data = await hasuraConnect.mutation(deleteQuerySubAtividades(id));

      print(data);
    } else {}
  }

  String deleteQuerySubAtividades(id) {
    return """
  mutation MyMutation {
  delete_subcategorias_de_atividades(where: {id: {_eq: "$id"}}) {
    returning {
      id
    }
  }
}
""";
  }

}
