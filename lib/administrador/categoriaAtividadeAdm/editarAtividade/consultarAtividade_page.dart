import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/administrador/categoriaAtividadeAdm/cadastrarAtividade/cadastrarAtividade_functions.dart';
import 'package:twp_licitacoes/administrador/categoriaAtividadeAdm/editarAtividade/editarAtividade_functions.dart';
import 'package:twp_licitacoes/globals.dart';


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
        body: /*carregando
            ? SpinKitThreeBounce(
                color: StyleGlobals().primaryColor,
                size: StyleGlobals().sizeTitulo,
              )
            :*/ Container(
              height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: editarAtividadesFunctions.jsonAtividades['data']['categorias_de_atividades'].length,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            /*Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    EditarOrgaoPage(editarOrgaoFunctions
                                        .jsonOrgao['data']['orgao'][index])));*/
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 5,
                                      spreadRadius: 2,
                                      offset: Offset(
                                        5,
                                        5,
                                      )),
                                ]),
                            margin: EdgeInsets.only(
                                top: 10, bottom: 0, left: 20, right: 10),
                            padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Flexible(
                                    child: Text(
                                      "${editarAtividadesFunctions.jsonAtividades['data']['categorias_de_atividades'][index]['nome']}",
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: StyleGlobals().textColorForte,
                                        fontSize: StyleGlobals().sizeTextMedio,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "...",
                                    style: TextStyle(
                                        color: StyleGlobals().primaryColor,
                                        fontSize: StyleGlobals().sizeTextMedio),
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
      ),
    );
  }
}
