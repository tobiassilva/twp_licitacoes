import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
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
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    editarOrgaoFunctions = Provider.of<UpdateOrgaoFunctions>(context);

    if(leuBanco){
      leuBanco = false;
      carregaDadosConsulta();
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
        body: carregando ? SpinKitThreeBounce(
          color: StyleGlobals().primaryColor,
          size: StyleGlobals().sizeTitulo,
        )
            : Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: editarOrgaoFunctions.jsonOrgao['data']['orgao'].length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              EditarOrgaoPage(editarOrgaoFunctions.jsonOrgao['data']['orgao'][index])));
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
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              "${editarOrgaoFunctions.jsonOrgao['data']['orgao'][index]['nome']}",
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
