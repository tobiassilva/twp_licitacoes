import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twp_licitacoes/orgao/editarOrgao/editarOrgao_functions.dart';


import '../../globals.dart';

class EditarOrgaoPage extends StatefulWidget {
  var jsonOrgao;
  EditarOrgaoPage(this.jsonOrgao);
  @override
  _EditarOrgaoPageState createState() => _EditarOrgaoPageState(this.jsonOrgao);
  
}

class _EditarOrgaoPageState extends State<EditarOrgaoPage> {
  var jsonOrgao;
  _EditarOrgaoPageState(this.jsonOrgao);


   TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerCnpj = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerTelefone = TextEditingController();
  TextEditingController controllerCep = TextEditingController();
  TextEditingController controllerCidade = TextEditingController();
  TextEditingController controllerEndereco = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: StyleGlobals().primaryColor,
          title: Text(
            "Detalhes",
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
                      controller: updateOrgaos().nomeOrgao,
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
                  margin:
                      EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 10),
                  padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
                  child: Container(
                    height: 40,
                    child: TextField(
                      controller: updateOrgaos().cnpj,
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
                      controller: updateOrgaos().email,
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
                      controller: updateOrgaos().telefone,
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
                      controller: updateOrgaos().cep,
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
                  margin:
                      EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 10),
                  padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
                  child: Container(
                    height: 40,
                    child: TextField(
                      controller: updateOrgaos().cidade,
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
                      controller: updateOrgaos().endereco,
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
                        /*if (controllerNome.text.isNotEmpty && idTipoOrgao!=null && controllerCnpj.text.isNotEmpty &&
  controllerEmail.text.isNotEmpty && controllerTelefone.text.isNotEmpty && controllerCep.text.isNotEmpty
  && idEstados!=null && controllerCidade.text.isNotEmpty && controllerEndereco.text.isNotEmpty) {
                              setState(() {
                                carregando = true;
                              });
                              await requisicoes().enviarFormulario(
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
                            }*/
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}