import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/orgao/cadastroOrgao/cadastroOrgao_functions.dart';
import 'package:twp_licitacoes/orgao/editarOrgao/editarOrgao_functions.dart';


import '../../globals.dart';

HasuraConnect hasuraConnect = HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

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
    if(leuBanco){
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
        body: carregando ? SpinKitThreeBounce(
          color: StyleGlobals().primaryColor,
          size: StyleGlobals().sizeTitulo,
        )
            : Container(
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
                      controller: editarOrgaoFunctions.nomeOrgao,
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
                      controller: editarOrgaoFunctions.cnpj,
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
                      controller: editarOrgaoFunctions.email,
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
                      controller: editarOrgaoFunctions.telefone,
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
                      controller: editarOrgaoFunctions.cep,
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
                      controller: editarOrgaoFunctions.cidade,
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
                      controller: editarOrgaoFunctions.endereco,
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
                            "Atualizar ",
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
                        
                              setState(() {
                                carregando = true;
                              });

                              await updateFormulario(
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



  Future updateFormulario(nome,  cnpj, email, telefone, cep, cidade, endereco ) async {

    var resultadoConexao = await requisicoes().resultadoInternet();
    if (resultadoConexao == false) {

      var data = await hasuraConnect.mutation(updateQueryOrgao(nome, cnpj, email, telefone, cep, cidade, endereco));

      print(data);
    }else{
    }
  }

   String updateQueryOrgao(nome, cnpj, email, telefone, cep, cidade, endereco) {
    return """
   mutation MyMutation {
   update_orgao(where: {nome: {_eq: "$nome"}}, _set: {nome: "${editarOrgaoFunctions.nomeOrgao.text}", 
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
}