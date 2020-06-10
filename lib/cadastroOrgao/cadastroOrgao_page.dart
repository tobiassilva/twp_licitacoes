import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:twp_licitacoes/globals.dart';
import 'package:twp_licitacoes/cadastroOrgao/cadastroOrgao_functions.dart';

import '../globals.dart';
import 'cadastroOrgao_functions.dart';

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
  bool carregando = false;
/*//criando dropdown tipo_orgao  
String opcaoOrgao = '';
int itemSel;
void changedDropDownItem(String itemSelecionado) {
    int i;
    setState(() {
      print(itemSelecionado);
      print(requisicoesDropdown().jsonTipoOrgao['data']['tipo_orgao'].length);
      opcaoOrgao = itemSelecionado;
      for (i = 0; i < requisicoesDropdown().jsonTipoOrgao['data']['tipo_orgao'].length; i++) {
        if (requisicoesDropdown().jsonTipoOrgao['data']['tipo_orgao'][i]['id'] == opcaoOrgao) {
          itemSel = i;
          controllerTipo.text = opcaoOrgao;
          return;
        }
      }
      controllerTipo.text = '';
    });
  }*/

  Future carregaDados() async {
    //var jsonInformacoes = await requisicoes().carregaInfos();

    var jsonAux1 = await requisicoes().getDadosTiposOrgaos();
    var jsonAux2 = await requisicoes().getDadosEstados();
    setState(() {
      jsonOrgaos = jsonAux1;
      jsonEstados = jsonAux2;
    });
    print("BBBBBBB: $jsonAux1");
    print("CCCCCCC: $jsonAux2");
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
      idEstados= val;
    });
  }

  @override
  void initState() {
    carregaDados();
    idTipoOrgao = 0;
    idEstados=0;

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
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
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
                  margin:
                      EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 10),
                  padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
                  child: Container(
                    height: 40,
                    child: TextField(
                      controller: controllerNome,
                      decoration: InputDecoration.collapsed(
                        hintText: "Nome do orgão",
                        hintStyle: TextStyle(fontWeight: FontWeight.w600),
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
                  margin:
                      EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 10),
                  padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
                  child: Container(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: jsonOrgaos['data']['tipo_orgao'].length,
                        itemBuilder: (BuildContext contex, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "${jsonOrgaos['data']['tipo_orgao'][index]['nome']}",
                                style:TextStyle( 
                                  color: StyleGlobals().textColorForte,
                                ),
                              ),
                          
                              Radio(
                                  value: jsonOrgaos['data']['tipo_orgao'][index]['id'],
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
                  margin:
                      EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 10),
                  padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
                  child: Container(
                    height: 40,
                    child: TextField(
                      controller: controllerCnpj,
                      decoration: InputDecoration.collapsed(
                        hintText: "CNPJ",
                        hintStyle: TextStyle(fontWeight: FontWeight.w600),
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
                  margin:
                      EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 10),
                  padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
                  child: Container(
                    height: 40,
                    child: TextField(
                      controller: controllerEmail,
                      decoration: InputDecoration.collapsed(
                        hintText: "Email",
                        hintStyle: TextStyle(fontWeight: FontWeight.w600),
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
                  margin:
                      EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 10),
                  padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
                  child: Container(
                    height: 40,
                    child: TextField(
                      controller: controllerTelefone,
                      decoration: InputDecoration.collapsed(
                        hintText: "Telefone",
                        hintStyle: TextStyle(fontWeight: FontWeight.w600),
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
                  margin:
                      EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 10),
                  padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
                  child: Container(
                    height: 40,
                    child: TextField(
                      controller: controllerCep,
                      decoration: InputDecoration.collapsed(
                        hintText: "CEP",
                        hintStyle: TextStyle(fontWeight: FontWeight.w600),
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
                  margin:
                      EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 10),
                  padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
                  child: Container(
                    child: ListView.builder(
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
                  margin:
                      EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 10),
                  padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
                  child: Container(
                    height: 40,
                    child: TextField(
                      controller: controllerCidade,
                      decoration: InputDecoration.collapsed(
                        hintText: "Cidade",
                        hintStyle: TextStyle(fontWeight: FontWeight.w600),
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
                  margin:
                      EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 10),
                  padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
                  child: Container(
                    height: 40,
                    child: TextField(
                      controller: controllerEndereco,
                      decoration: InputDecoration.collapsed(
                        hintText: "Endereço",
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
                            "Enviar ",
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
                        if (controllerNome.text.isNotEmpty && idTipoOrgao!=null && controllerCnpj.text.isNotEmpty &&
  controllerEmail.text.isNotEmpty && controllerTelefone.text.isNotEmpty && controllerCep.text.isNotEmpty
  && idEstados!=null && controllerCidade.text.isNotEmpty && controllerEndereco.text.isNotEmpty) {
                              setState(() {
                                carregando = true;
                              });
                              await enviarFormulario(
                                controllerNome.text,
                                idTipoOrgao,
                                controllerCnpj.text,
                                controllerEmail.text,
                                controllerTelefone.text,
                                controllerCep.text,
                                idEstados,
                                controllerCidade.text,
                                controllerEndereco.text
                                );
                                  
                              setState(() {
                                carregando = false;
                              });

                              
                            } else {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text('O Campo nao pode ser Vazio'),
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
      ),
    );
  }



  HasuraConnect conexao =
  HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

  Future enviarFormulario(nome, int tipo, cnpj, email, telefone, cep, int estado, cidade, endereco ) async {

    var resultadoConexao = await requisicoes().resultadoInternet();
    if (resultadoConexao == false) {


      var data = await conexao.mutation(queryOrgao());

      print(data);
    }else{
    }
  }



  String queryOrgao(){

    return (
        """
        mutation MyMutation {
          insert_orgao(objects: {nome: '${controllerNome.text}', id_tipo_orgao: $idTipoOrgao, cnpj:'${controllerCnpj.text}', email: '${controllerEmail.text}', telefone: '${controllerTelefone.text}', cep: '${controllerCep.text}', id_estados: $idEstados, cidade: '${controllerCidade.text}', endereco: '${controllerEndereco.text}'}) {
            returning {
              id
            }
          }
        }
      """
    );
  }
}
