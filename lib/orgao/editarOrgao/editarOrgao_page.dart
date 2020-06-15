import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/orgao/cadastroOrgao/cadastroOrgao_functions.dart';
import 'package:twp_licitacoes/orgao/editarOrgao/editarOrgao_functions.dart';

import '../../administrador/homeAdm/homeAdm_page.dart';
import '../../globals.dart';
import 'consultarOrgao_page.dart';

HasuraConnect hasuraConnect =
    HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

class EditarOrgaoPage extends StatefulWidget {
  var jsonOrgao;
  EditarOrgaoPage(this.jsonOrgao);
  @override
  _EditarOrgaoPageState createState() => _EditarOrgaoPageState(this.jsonOrgao);
}

class _EditarOrgaoPageState extends State<EditarOrgaoPage> {
  var jsonOrgaoEsc;
  _EditarOrgaoPageState(this.jsonOrgaoEsc);

  /*TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerCnpj = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerTelefone = TextEditingController();
  TextEditingController controllerCep = TextEditingController();
  TextEditingController controllerCidade = TextEditingController();
  TextEditingController controllerEndereco = TextEditingController();*/

  UpdateOrgaoFunctions editarOrgaoFunctions;
  bool carregando = true;
  bool leuBanco = true;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    editarOrgaoFunctions = Provider.of<UpdateOrgaoFunctions>(context);
    if (leuBanco) {
      leuBanco = false;
      atualizaControllers();
    }
  }

  Future atualizaControllers() async {
    await editarOrgaoFunctions.atualizaControladores(jsonOrgaoEsc);

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
                                          ConsultarOrgaoPage()));
                                },
                              ),
                            ),
                            Expanded(
                              //padding: EdgeInsets.fromLTRB(0, 0, 65, 0),
                              child: Text(
                                "Detalhes Orgão",
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
                        )),
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
                                  controller: editarOrgaoFunctions.nomeOrgao,
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Nome do orgão",
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.w600),
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
                                  /*child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: jsonOrgao['data']['tipo_orgao'].length,
                                itemBuilder: (BuildContext contex, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "${jsonOrgao['data']['tipo_orgao'][index]['nome']}",
                                        style:TextStyle( 
                                          color: StyleGlobals().textColorForte,
                                        ),
                                      ),
                                  
                                      Radio(
                                          value: jsonOrgao['id_tipo_orgao'],
                                          activeColor: Colors.blue,
                                          onChanged: (val) {
                                            print("Radio $val");
                                            //setSelectedRadio(val);
                                          }),
                                    ],
                                  );
                                }),*/
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
                                  controller: editarOrgaoFunctions.cnpj,
                                  decoration: InputDecoration.collapsed(
                                    hintText: "CNPJ",
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.w600),
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
                                  controller: editarOrgaoFunctions.email,
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Email",
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.w600),
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
                                  controller: editarOrgaoFunctions.telefone,
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Telefone",
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.w600),
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
                                  controller: editarOrgaoFunctions.cep,
                                  decoration: InputDecoration.collapsed(
                                    hintText: "CEP",
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.w600),
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
                                  /*child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: jsonEstados['data']['estados'].length,
                                itemBuilder: (BuildContext contex, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "${jsonEstados['data']['estados'][index]['nome']}",
                                        style:TextStyle( 
                                          color: StyleGlobals().textColorForte,
                                        ),
                                      ),
                                  
                                      Radio(
                                          value: jsonEstados['data']['estados'][index]['id'],
                                          groupValue: idEstados,
                                          activeColor: Colors.blue,
                                          onChanged: (val) {
                                            print("Radio $val");
                                            setSelectedRadioEstados(val);
                                          }),
                                    ],
                                  );
                                }),*/
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
                                  controller: editarOrgaoFunctions.cidade,
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Cidade",
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.w600),
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
                                  controller: editarOrgaoFunctions.endereco,
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Endereço",
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
                                        color:
                                            StyleGlobals().textColorSecundary,
                                      )
                                    ],
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      carregando = true;
                                    });

                                    await updateFormulario(
                                      editarOrgaoFunctions.id,
                                      editarOrgaoFunctions.nomeOrgao.text,
                                      editarOrgaoFunctions.cnpj.text,
                                      editarOrgaoFunctions.email.text,
                                      editarOrgaoFunctions.endereco.text,
                                      editarOrgaoFunctions.telefone.text,
                                      editarOrgaoFunctions.cidade.text,
                                      editarOrgaoFunctions.cep.text,
                                    );

                                    setState(() {
                                      carregando = false;
                                    });
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                HomeAdmPage()));
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
                                        color:
                                            StyleGlobals().textColorSecundary,
                                      )
                                    ],
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      carregando = true;
                                    });

                                    await deleteFormulario(
                                      editarOrgaoFunctions.id,
                                    );

                                    setState(() {
                                      carregando = false;
                                    });

                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                HomeAdmPage()));
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

//enviando Atualização
  Future updateFormulario(
      id, nome, cnpj, email, telefone, cep, cidade, endereco) async {
    var resultadoConexao = await Requisicoes().resultadoInternet();
    if (resultadoConexao == false) {
      var data = await hasuraConnect.mutation(updateQueryOrgao(
          id, nome, cnpj, email, telefone, cep, cidade, endereco));

      print(data);
    } else {}
  }

  String updateQueryOrgao(
      id, nome, cnpj, email, telefone, cep, cidade, endereco) {
    return """
   mutation MyMutation {
   update_orgao(where: {id: {_eq: "$id"}}, _set: {nome: "${editarOrgaoFunctions.nomeOrgao.text}", 
    cnpj: "${editarOrgaoFunctions.cnpj.text}", 
    email: "${editarOrgaoFunctions.email.text}", 
    telefone: "${editarOrgaoFunctions.telefone.text}", 
    cep: "${editarOrgaoFunctions.cep.text}", 
    cidade: "${editarOrgaoFunctions.cidade.text}", 
    endereco: "${editarOrgaoFunctions.endereco.text}"}){
      returning {
      id
    }
  }
} 
""";
  }

  //deletando Orgao
  Future deleteFormulario(id) async {
    var resultadoConexao = await Requisicoes().resultadoInternet();
    if (resultadoConexao == false) {
      var data = await hasuraConnect.mutation(deleteQueryOrgao(id));

      print(data);
    } else {}
  }

  String deleteQueryOrgao(id) {
    return """
    mutation MyMutation {
    delete_orgao(where: {id: {_eq: "$id"}}) {
    returning {
      id
    }
  }
}
""";
  }
}
