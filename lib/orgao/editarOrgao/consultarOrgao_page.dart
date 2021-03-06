import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/orgao/EditarOrgao/EditarOrgao_page.dart';

import 'package:twp_licitacoes/orgao/cadastroOrgao/cadastroOrgao_page.dart';
import 'package:twp_licitacoes/orgao/editarOrgao/editarOrgao_functions.dart';

import '../../administrador/homeAdm/homeAdm_page.dart';
import '../../globals.dart';

class ConsultarOrgaoPage extends StatefulWidget {
  @override
  _ConsultarOrgaoPageState createState() => _ConsultarOrgaoPageState();
}

class _ConsultarOrgaoPageState extends State<ConsultarOrgaoPage> {
  final id = TextEditingController();

  /*TextEditingController controllerEditarNome = TextEditingController();
  TextEditingController controllerEditarCnpj = TextEditingController();
  TextEditingController controllerEditarEmail = TextEditingController();
  TextEditingController controllerEditarTelefone = TextEditingController();
  TextEditingController controllerEditarCep = TextEditingController();
  TextEditingController controllerEditarCidade = TextEditingController();
  TextEditingController controllerEditarEndereco = TextEditingController();*/

  UpdateOrgaoFunctions editarOrgaoFunctions;

  bool leuBanco = true;

  @override
  void didChangeDependencies() {
    
    super.didChangeDependencies();

    editarOrgaoFunctions = Provider.of<UpdateOrgaoFunctions>(context);

    if (leuBanco) {

      carregaDadosConsulta();
      leuBanco = false;
    }
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool carregando = true;

  Future carregaDadosConsulta() async {
    //var jsonInformacoes = await requisicoes().carregaInfos();

    await editarOrgaoFunctions.recebeDadosDB();

    setState(() {
      carregando = false;
    });
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
    idTipoOrgao = 1;
    idEstados = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: GestureDetector(
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: StyleGlobals().sizeTitulo,
                                  color: StyleGlobals().primaryColor,
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomeAdmPage()));
                                },
                              ),
                            ),
                            Text(
                              "Consultar Orgãos",
                              style: TextStyle(
                                  fontSize: StyleGlobals().sizeTitulo,
                                  color: StyleGlobals().textColorForte),
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
                                          CadastroOrgaoPage()));
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
                              itemCount: editarOrgaoFunctions
                                  .jsonOrgao['data']['orgao'].length,
                              itemBuilder: (_, index) {
                                String _nome = editarOrgaoFunctions.jsonOrgao['data']['orgao'][index]['nome'];
                                String _cnpj = editarOrgaoFunctions.jsonOrgao['data']['orgao'][index]['cnpj'];
                                String _email = editarOrgaoFunctions.jsonOrgao['data']['orgao'][index]['email'];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                EditarOrgaoPage(
                                                    editarOrgaoFunctions
                                                            .jsonOrgao['data']
                                                        ['orgao'][index])));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                                    padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                                    decoration: BoxDecoration(
                                      //color: Colors.red,
                                        gradient: LinearGradient(colors: [Colors.white, Colors.white]),
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 10.0,
                                              spreadRadius: 2.0,
                                              offset: Offset(
                                                1.0,
                                                1.0,
                                              )),
                                        ]),
                                    child: Row(
                                      children: <Widget>[

                                        Container(
                                          child: Icon(
                                            FontAwesomeIcons.landmark,
                                            size: 35,
                                            color: StyleGlobals().primaryColor,
                                          ),
                                        ),

                                        SizedBox(
                                          width: 15,
                                        ),

                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                '${_nome == '' || _nome == null ? "Não Informado" : _nome}',
                                                style: TextStyle(
                                                  color: StyleGlobals().textColorMedio,
                                                  fontSize: StyleGlobals().sizeSubtitulo,
                                                ),
                                              ),

                                              SizedBox(
                                                height: 5,
                                              ),

                                              Row(
                                                children: <Widget>[
                                                  Icon(
                                                    FontAwesomeIcons.solidIdCard,
                                                    size: StyleGlobals().sizeText,
                                                    color: StyleGlobals().tertiaryColor,
                                                  ),
                                                  Text(
                                                    ' ${_cnpj == '' || _cnpj == null ? "CNPJ Não Informado" : _cnpj}',
                                                    style: TextStyle(
                                                      color: StyleGlobals().textColorMedio,
                                                      fontSize: StyleGlobals().sizeText,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(
                                                height: 5,
                                              ),

                                              Row(
                                                children: <Widget>[
                                                  Icon(
                                                    FontAwesomeIcons.at,
                                                    size: StyleGlobals().sizeText,
                                                    color: StyleGlobals().tertiaryColor,
                                                  ),
                                                  Text(
                                                    ' ${_email == '' || _email == null ? "Email Não Informado" : _email}',
                                                    style: TextStyle(
                                                      color: StyleGlobals().textColorMedio,
                                                      fontSize: StyleGlobals().sizeText,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),/*Container(
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
                                        top: 10,
                                        bottom: 0,
                                        left: 20,
                                        right: 10),
                                    padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Flexible(
                                            child: Text(
                                              "${editarOrgaoFunctions.jsonOrgao['data']['orgao'][index]['nome']}",
                                              maxLines: 1,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: StyleGlobals()
                                                    .textColorForte,
                                                fontSize: StyleGlobals()
                                                    .sizeTextMedio,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "...",
                                            style: TextStyle(
                                                color:
                                                    StyleGlobals().primaryColor,
                                                fontSize: StyleGlobals()
                                                    .sizeTextMedio),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),*/
                                );
                              }),
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

/*appBar: AppBar(
          backgroundColor: StyleGlobals().primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Consultar Orgãos",
                style: TextStyle(color: StyleGlobals().textColorSecundary),
              ),
              
            ],
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
        ),*/
