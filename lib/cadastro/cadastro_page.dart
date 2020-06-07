import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/cadastro/Widgets/cadastro_widget.dart';

import '../globals.dart';
import 'Widgets/interesses_widget.dart';
import 'Widgets/pagamento_widget.dart';
import 'Widgets/planos_widget.dart';
import 'Widgets/termos_widget.dart';
import 'cadastro_functions.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    CadastroWidget cadastroWidget = CadastroWidget(context);
    InteressesWidget interessesWidget = InteressesWidget(context);
    TermosWidget termosWidget = TermosWidget(context);
    PlanosWidget planosWidget = PlanosWidget(context);
    PagamentoWidget pagamentoWidget = PagamentoWidget(context);
    final cadastroFunctions = Provider.of<CadastroFunctions>(context);
    cadastroFunctions.getDadosBanco();
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
                children: <Widget>[
                  cadastroWidget.userPage(),
                  interessesWidget.interessesPage(),
                  termosWidget.termosPage(),
                  planosWidget.pagamentoPage(),
                  pagamentoWidget.planosPage()
                ],
                scrollDirection: Axis.horizontal,
              )),
        ),
      ),
    );
  }
}
