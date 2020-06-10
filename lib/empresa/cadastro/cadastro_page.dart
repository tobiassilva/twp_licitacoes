import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../globals.dart';
import 'Store/cadastro_store.dart';
import 'Widgets/cadastro_widget.dart';
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

  bool carregando = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  CadastroStore cadastroStore;
  CadastroFunctions cadastroFunctions;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    cadastroStore = Provider.of<CadastroStore>(context);
    cadastroFunctions = Provider.of<CadastroFunctions>(context);

    this.iniciaPage();

  }

  Future iniciaPage() async {
    await cadastroFunctions.getDadosBanco();
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    CadastroWidget cadastroWidget = CadastroWidget(context);
    InteressesWidget interessesWidget = InteressesWidget(context);
    TermosWidget termosWidget = TermosWidget(context);
    PlanosWidget planosWidget = PlanosWidget(context);
    PagamentoWidget pagamentoWidget = PagamentoWidget(context);
    final cadastroFunctions = Provider.of<CadastroFunctions>(context);
    final cadastroStore = Provider.of<CadastroStore>(context);

    return MaterialApp(
      home: Scaffold(
        body: carregando ? SpinKitThreeBounce(
          color: StyleGlobals().primaryColor,
          size: StyleGlobals().sizeTitulo,
        )
        : Container(
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
