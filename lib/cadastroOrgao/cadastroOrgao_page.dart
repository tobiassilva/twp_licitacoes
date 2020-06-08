import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twp_licitacoes/globals.dart';
import 'package:twp_licitacoes/cadastroOrgao/cadastroOrgao_functions.dart';

class CadastroOrgaoPage extends StatefulWidget {
  @override
  _CadastroOrgaoPageState createState() => _CadastroOrgaoPageState();
}

class _CadastroOrgaoPageState extends State<CadastroOrgaoPage> {
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerTipo = TextEditingController();
  TextEditingController controllerCnpj = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerTelefone = TextEditingController();
  TextEditingController controllerCep = TextEditingController();
  TextEditingController controllerEstado = TextEditingController();
  TextEditingController controllerCidade = TextEditingController();
  TextEditingController controllerEndereco = TextEditingController();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//criando dropdown tipo_orgao  
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
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                  height: 40,
                  child: Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 5),
                    color: Colors.white,
                    child: new Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: Colors.white,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Montserrat",
                          ),
                          //items: ,
                          value: opcaoOrgao,
                          items: requisicoesDropdown().dropDownMenuItems, 
                          iconSize: 20.0,
                          iconEnabledColor: Color.fromRGBO(255, 255, 255, 1),
                          hint: Text(
                            'Carregando...',
                            style: TextStyle(color: Colors.grey),
                          ),
                          onChanged: changedDropDownItem,
                        ),
                      ),
                    ),
                  ),
                ),
                    /*child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        style: TextStyle(
                          color: StyleGlobals().textColorForte,
                        ),
                        value: opcaoOrgao,
                        items: requisicoesDropdown().dropDownMenuItems, 
                        onChanged: changedDropDownItem,
                     ),
                    ),*//*TextField(
                      controller: controllerTipo,
                      decoration: InputDecoration.collapsed(
                        hintText: "Tipo",
                        hintStyle: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 20,
                    ),*/
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
                    height: 40,
                    child: TextField(
                      controller: controllerEstado,
                      decoration: InputDecoration.collapsed(
                        hintText: "Estado",
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
                        /*if (controllerParecer.text.isNotEmpty) {
                              setState(() {
                                carregando = true;
                              });
                              await enviarFormularioParecer()
                                  .enviarFormulario(controllerParecer.text);
                                  
                              setState(() {
                                carregando = false;
                              });

                              print('${controllerParecer.text}');
                            } else {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text('O Campo nao pode ser Vazio'),
                              ));
                            }*/
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
}
