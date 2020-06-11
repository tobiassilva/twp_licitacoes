import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../globals.dart';
import '../cadastro_functions.dart';
import 'package:twp_licitacoes/empresa/cadastro/Store/cadastro_store.dart';
import 'package:twp_licitacoes/home/home.dart';

class PagamentoWidget {
  BuildContext context;
  PagamentoWidget(this.context);

  Widget planosPage() {
    //final cadastroStore = Provider.of<CadastroStore>(context);
    //final cadastroFunctions = Provider.of<CadastroFunctions>(context);

    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  //margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Icon(
                    FontAwesomeIcons.userEdit,
                    color: Colors.green,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.green,
                ),
                Icon(
                  FontAwesomeIcons.chartPie,
                  color: Colors.green,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.green,
                ),
                Icon(
                  FontAwesomeIcons.fileContract,
                  color: Colors.green,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.green,
                ),
                Icon(FontAwesomeIcons.solidGrinStars,
                  color: Colors.green,
                ),
                Icon(Icons.arrow_forward_ios,
                  color: Colors.green,
                ),
                Icon(FontAwesomeIcons.coins,
                  color: StyleGlobals().primaryColor,
                ),
              ],
            ),
          ),

          SizedBox(
            height: 35,
          ),

          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text(
              'Pagamento',
              style: TextStyle(
                fontSize: StyleGlobals().sizeTitulo,
                color: StyleGlobals().textColorForte,
              ),

            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text(
              '\nPague aqui e comece a utilizar o app de licitações da Smart Pública',
              style: TextStyle(
                fontSize: StyleGlobals().sizeSubtitulo,
                color: StyleGlobals().textColorForte,
              ),

            ),
          ),
          SizedBox(
            height: 35,
          ),


          //_tabelaPrecos(),

          SizedBox(
            height: 45,
          ),

          _botaoPago(),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }


  Widget _botaoPago(){

    final cadastroStore = Provider.of<CadastroStore>(context);
    final cadastroFunctions = Provider.of<CadastroFunctions>(context);

    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Observer(
        builder: (_){
          return FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () async {
              print('AAAAAAAAA: ${cadastroStore.listEstados}');
              List value = List();
              value.addAll(cadastroStore.listEstados);
              print('AAAAAAAAA555555555555: ${value}');
              cadastroFunctions.enviaDadosEmpresa(value);
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage())
              );
            },
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: StyleGlobals().colorGradiente,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                  1.0,
                                  1.0,
                                )),
                          ]
                      ),
                      child: Center(
                        child: Text('PRÓXIMO',
                          style: TextStyle(
                              color: StyleGlobals().textColorSecundary,
                              fontSize: StyleGlobals().sizeSubtitulo
                          ),
                        ),
                      ),
                    )
                ),
              ],
            ),
          );
        },
      ),
    );

  }
}