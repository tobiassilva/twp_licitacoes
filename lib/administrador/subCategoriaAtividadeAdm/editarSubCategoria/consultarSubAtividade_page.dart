import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:twp_licitacoes/administrador/subCategoriaAtividadeAdm/cadastrarSubCategoria/cadastrarSubAtividade_page.dart';
import 'package:twp_licitacoes/administrador/subCategoriaAtividadeAdm/editarSubCategoria/editarSubAtividade_functions.dart';
import 'package:twp_licitacoes/administrador/subCategoriaAtividadeAdm/editarSubCategoria/editarSubAtividade_page.dart';
import 'package:twp_licitacoes/globals.dart';

import '../../../home/home.dart';

class ConsultarSubAtividades extends StatefulWidget {
  @override
  _ConsultarSubAtividadesState createState() => _ConsultarSubAtividadesState();
}

class _ConsultarSubAtividadesState extends State<ConsultarSubAtividades> {
  bool leuBanco = true;
  bool carregando = true;

  UpdateSubAtividadesFunctions editarSubAtividadesFunctions;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    editarSubAtividadesFunctions =
        Provider.of<UpdateSubAtividadesFunctions>(context);

    if (leuBanco) {
      leuBanco = false;
      carregaDadosConsulta();
    }
  }

  Future carregaDadosConsulta() async {
    await editarSubAtividadesFunctions.recebeDados();
    setState(() {
      carregando = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
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
                              "Subcategrias de Atividades",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: StyleGlobals().sizeTitulo,
                                  color: StyleGlobals().textColorForte),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: GestureDetector(
                              child: Icon(
                                FontAwesomeIcons.plus,
                                size: StyleGlobals().sizeTitulo,
                                color: StyleGlobals().primaryColor,
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CadastrarSubAtividadePage()));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: editarSubAtividadesFunctions
                                .jsonSubAtividades['data']
                                    ['subcategorias_de_atividades']
                                .length,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EditarSubAtividadesPage(
                                              editarSubAtividadesFunctions
                                                              .jsonSubAtividades[
                                                          'data'][
                                                      'subcategorias_de_atividades']
                                                  [index])));
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                                  padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                                  decoration: BoxDecoration(
                                      //color: Colors.white,
                                      gradient: LinearGradient(
                                          colors: [Colors.white, Colors.white]),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 10,
                                            spreadRadius: 2,
                                            offset: Offset(
                                              1,
                                              1,
                                            )),
                                      ]),
                                  child: Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Icon(
                                            FontAwesomeIcons.industry,
                                            size: 35,
                                            color: StyleGlobals().primaryColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "${editarSubAtividadesFunctions.jsonSubAtividades['data']['subcategorias_de_atividades'][index]['nome']}",
                                                maxLines: 1,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: StyleGlobals().textColorMedio,
                                                  fontSize:StyleGlobals().sizeText,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "...",
                                          style: TextStyle(
                                              color:
                                                  StyleGlobals().primaryColor,
                                              fontSize:
                                                  StyleGlobals().sizeText),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
