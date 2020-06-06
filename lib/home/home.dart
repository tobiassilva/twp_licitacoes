import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var url = 'http://compras.dados.gov.br/licitacoes/v1/licitacoes.json';

  void initState(){
    super.initState();

    //recebeLicitacoes();
  }

  var licitacoes;

  Future recebeLicitacoes() async {

    var response = await http.get(url);

    setState(() {
      licitacoes = jsonDecode(response.body);
    });

    //var dataLicitacoes = await jsonDecode(response.body);

    print("licitacoes");
    print(licitacoes.length);
    print(licitacoes["_links"]);
    print(licitacoes["_links"]["first"]);



  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(child: Text('APP do TWP')),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 30),
              child: Text('ORGÃOS SOLICITANTES',
                style: TextStyle(color: Colors.blue, fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                child: Text('TEM POHA NENHUMMA NESSA CARALHA. é nois'),/*ListView.builder(
                    itemCount: licitacoes['_embedded']['licitacoes'].length,
                    itemBuilder: (BuildContext cont, int index){
                      return Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('$index - '),
                              Flexible(
                                  child: Text(
                                      '${licitacoes['_embedded']['licitacoes'][index]['_links']['uasg']['title']}'
                                  )
                              )
                            ],
                          ),
                          Divider(),
                        ],
                      );
                    }
                ),*/
              ),
            ),
          ],
        ),
      ),
    );
  }
}
