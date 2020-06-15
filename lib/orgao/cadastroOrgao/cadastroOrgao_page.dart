import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twp_licitacoes/globals.dart';
import 'package:twp_licitacoes/orgao/cadastroOrgao/cadastroOrgao_functions.dart';

import '../editarOrgao/consultarOrgao_page.dart';

class CadastroOrgaoPage extends StatefulWidget {
  @override
  _CadastroOrgaoPageState createState() => _CadastroOrgaoPageState();
}

class _CadastroOrgaoPageState extends State<CadastroOrgaoPage> {
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerCnpj = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerTelefone = TextEditingController();
  TextEditingController controllerCep = TextEditingController();
  TextEditingController controllerCidade = TextEditingController();
  TextEditingController controllerEndereco = TextEditingController();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var jsonOrgaos;
  var jsonEstados;
  bool carregando = true;
  bool leuBanco = true;

  Future carregaDados() async {
    //var jsonInformacoes = await requisicoes().carregaInfos();
    var jsonAux1 = await Requisicoes().getDadosTiposOrgaos();
    var jsonAux2 = await Requisicoes().getDadosEstados();
    setState(() {
      jsonOrgaos = jsonAux1;
      jsonEstados = jsonAux2;
    });
    print("BBBBBBB: $jsonAux1");
    print("CCCCCCC: $jsonAux2");
  }

  Future carregandoCampos() async {
    await carregaDados();

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
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if (leuBanco) {
      leuBanco = false;
    }
  }

  @override
  void initState() {
    idTipoOrgao = 0;
    idEstados = 0;
    carregandoCampos();

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
                                          ConsultarOrgaoPage()));
                                },
                              ),
                            ),
                            Expanded(
                              //padding: EdgeInsets.fromLTRB(0, 0, 65, 0),
                              child: Text(
                                "Cadastrar Orgão",
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
                                    controller: controllerNome,
                                    decoration: InputDecoration.collapsed(
                                      hintText: "Nome do orgão",
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 20,
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
                                      itemCount: jsonOrgaos['data']
                                              ['tipo_orgao']
                                          .length,
                                      itemBuilder:
                                          (BuildContext contex, index) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "${jsonOrgaos['data']['tipo_orgao'][index]['nome']}",
                                              style: TextStyle(
                                                color: StyleGlobals()
                                                    .textColorForte,
                                              ),
                                            ),
                                            Radio(
                                                value: jsonOrgaos['data']
                                                    ['tipo_orgao'][index]['id'],
                                                groupValue: idTipoOrgao,
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
                                    controller: controllerCnpj,
                                    decoration: InputDecoration.collapsed(
                                      hintText: "CNPJ",
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 20,
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
                                  height: 40,
                                  child: TextField(
                                    controller: controllerEmail,
                                    decoration: InputDecoration.collapsed(
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    maxLines: 20,
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
                                  height: 40,
                                  child: TextField(
                                    controller: controllerTelefone,
                                    decoration: InputDecoration.collapsed(
                                      hintText: "Telefone",
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    keyboardType: TextInputType.phone,
                                    maxLines: 20,
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
                                  height: 40,
                                  child: TextField(
                                    controller: controllerCep,
                                    decoration: InputDecoration.collapsed(
                                      hintText: "CEP",
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 20,
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
                                      itemCount:
                                          jsonEstados['data']['estados'].length,
                                      itemBuilder:
                                          (BuildContext contex, index) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "${jsonEstados['data']['estados'][index]['nome']}",
                                              style: TextStyle(
                                                color: StyleGlobals()
                                                    .textColorForte,
                                              ),
                                            ),
                                            Radio(
                                                value: jsonEstados['data']
                                                    ['estados'][index]['id'],
                                                groupValue: idEstados,
                                                activeColor: Colors.blue,
                                                onChanged: (val) {
                                                  print("Radio $val");
                                                  setSelectedRadioEstados(val);
                                                }),
                                          ],
                                        );
                                      }),
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
                                  height: 40,
                                  child: TextField(
                                    controller: controllerCidade,
                                    decoration: InputDecoration.collapsed(
                                      hintText: "Cidade",
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 20,
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
                                  height: 40,
                                  child: TextField(
                                    controller: controllerEndereco,
                                    decoration: InputDecoration.collapsed(
                                      hintText: "Endereço",
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w600),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Enviar ",
                                          style: TextStyle(
                                            color: StyleGlobals()
                                                .textColorSecundary,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Icon(
                                          FontAwesomeIcons.check,
                                          size: 20,
                                          color:
                                              StyleGlobals().textColorSecundary,
                                        )
                                      ],
                                    ),
                                    onPressed: () async {
                                      if (controllerNome.text.isNotEmpty &&
                                          idTipoOrgao != null &&
                                          controllerCnpj.text.isNotEmpty &&
                                          controllerEmail.text.isNotEmpty &&
                                          controllerTelefone.text.isNotEmpty &&
                                          controllerCep.text.isNotEmpty &&
                                          idEstados != null &&
                                          controllerCidade.text.isNotEmpty &&
                                          controllerEndereco.text.isNotEmpty) {
                                        setState(() {
                                          carregando = true;
                                        });
                                        await Requisicoes().enviarFormulario(
                                            controllerNome.text,
                                            idTipoOrgao,
                                            controllerCnpj.text,
                                            controllerEmail.text,
                                            controllerTelefone.text,
                                            controllerCep.text,
                                            idEstados,
                                            controllerCidade.text,
                                            controllerEndereco.text);

                                        setState(() {
                                          carregando = false;
                                        });

                                      Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ConsultarOrgaoPage()));

                                      } else {
                                        _scaffoldKey.currentState
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              'O Campo nao pode ser Vazio'),
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
/*appBar: AppBar(
          backgroundColor: StyleGlobals().primaryColor,
          title: Text(
            "Novo Orgão",
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
        ),*/
