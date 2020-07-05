import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/administrador/categoriaAtividadeAdm/editarAtividade/editarAtividade_functions.dart';
import 'package:twp_licitacoes/administrador/categoriaAtividadeAdm/editarAtividade/editarAtividade_page.dart';
import 'package:twp_licitacoes/globals.dart';

import '../../../home/home.dart';
import '../cadastrarAtividade/cadastrarAtividade_page.dart';

class ConsultarAtividades extends StatefulWidget {
  @override
  _ConsultarAtividadesState createState() => _ConsultarAtividadesState();
}

class _ConsultarAtividadesState extends State<ConsultarAtividades> {
  bool leuBanco = true;
  bool carregando = true;

  UpdateAtividadesFunctions editarAtividadesFunctions;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    editarAtividadesFunctions = Provider.of<UpdateAtividadesFunctions>(context);

    if (leuBanco) {
      leuBanco = false;
      carregaDadosConsulta();
    }
  }

  Future carregaDadosConsulta() async {
    await editarAtividadesFunctions.recebeDadosAtividades();

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
        body:
            /*carregando
            ? SpinKitThreeBounce(
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
                              builder: (BuildContext context) => HomePage()));
                        },
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Consultar Atividades",
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
                                          CadastrarAtividadePage()));
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
                      itemCount: editarAtividadesFunctions
                          .jsonAtividades['data']['categorias_de_atividades']
                          .length,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    EditarAtividadesPage(
                                        editarAtividadesFunctions
                                                    .jsonAtividades['data']
                                                ['categorias_de_atividades']
                                            [index])));
                          },
                          child: Container(
                             margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                            decoration: BoxDecoration(
                                //color: Colors.white,
                                gradient:  LinearGradient(
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
                                          "${editarAtividadesFunctions.jsonAtividades['data']['categorias_de_atividades'][index]['nome']}",
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: StyleGlobals().textColorMedio,
                                            fontSize: StyleGlobals().sizeText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "...",
                                    style: TextStyle(
                                        color: StyleGlobals().primaryColor,
                                        fontSize: StyleGlobals().sizeText),
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
