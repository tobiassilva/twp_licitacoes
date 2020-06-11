import 'package:flutter/material.dart';
import 'package:twp_licitacoes/orgao/EditarOrgao/EditarOrgao_page.dart';
import 'package:twp_licitacoes/orgao/cadastroOrgao/cadastroOrgao_functions.dart';
import 'package:twp_licitacoes/orgao/editarOrgao/editarOrgao_functions.dart';

import '../../globals.dart';


class ConsultarOrgaoPage extends StatefulWidget {
  @override
  _ConsultarOrgaoPageState createState() => _ConsultarOrgaoPageState();
}

class _ConsultarOrgaoPageState extends State<ConsultarOrgaoPage> {
  final id = TextEditingController();

  TextEditingController controllerEditarNome = TextEditingController();
  TextEditingController controllerEditarCnpj = TextEditingController();
  TextEditingController controllerEditarEmail = TextEditingController();
  TextEditingController controllerEditarTelefone = TextEditingController();
  TextEditingController controllerEditarCep = TextEditingController();
  TextEditingController controllerEditarCidade = TextEditingController();
  TextEditingController controllerEditarEndereco = TextEditingController();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var jsonOrgao;
  var jsonEstados;
  bool carregando = false;

  Future carregaDados() async {
    //var jsonInformacoes = await requisicoes().carregaInfos();

    var jsonAux1 = await updateOrgaos().getDadosOrgaos();
    var jsonAux2 = await requisicoes().getDadosEstados();
    setState(() {
      jsonOrgao = jsonAux1;
      jsonEstados = jsonAux2;
    });
    print("BBBBBBB: $jsonAux1");
    print("CCCCCC: $jsonAux2");
  }

  int idTipoOrgao;

  setSelectedRadio(int val) {
    setState(() {
      idTipoOrgao = val;
    });
  }

  int idEstados;
  setSelectedRadioEstados(int val) {
    setState(() {
      idEstados = val;
    });
  }

  @override
  void initState() {
    carregaDados();
    idTipoOrgao = 1;
    idEstados = 1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: StyleGlobals().primaryColor,
          title: Text(
            "Consultar Orgãos",
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
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: jsonOrgao['data']['orgao'].length,
                itemBuilder: (BuildContext contex, index) {
                  return GestureDetector(
                    onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              EditarOrgaoPage(jsonOrgao['data']['orgao'][index])));
                    },

                  child: Container(
                    decoration: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: Offset(
                            5,
                            5,
                          )),
                      ]),
                      margin: EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 10),
                      padding:EdgeInsets.fromLTRB(10, 10, 30, 0),
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              "${jsonOrgao['data']['orgao'][index]['nome']}",
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
