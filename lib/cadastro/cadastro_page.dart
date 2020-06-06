import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/cadastro/cadastro_widget.dart';

import '../globals.dart';
import 'cadastro_functions.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {


  @override
  Widget build(BuildContext context) {
    CadastroWidget cadastroWidget = CadastroWidget(context);
    final cadastroFunctions = Provider.of<CadastroFunctions>(context);
    return MaterialApp(
      home: Scaffold(
        body: Container(
          //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
            color: StyleGlobals().secundaryColor,
          ),
          child: new Container(
              height: MediaQuery.of(context).size.height,
              child: PageView(
                controller: cadastroFunctions.controllerNavigation,
                physics: new NeverScrollableScrollPhysics(),
                children: <Widget>[cadastroWidget.userPage(), cadastroWidget.termosPage()],
                scrollDirection: Axis.horizontal,
              )),
        ),
      ),
    );
  }
}
