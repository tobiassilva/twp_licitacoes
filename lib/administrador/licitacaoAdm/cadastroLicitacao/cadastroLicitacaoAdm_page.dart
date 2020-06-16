import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/administrador/licitacaoAdm/cadastroLicitacao/cadastroLicitacaoAdm_widget.dart';

import '../../../globals.dart';
import 'cadastroLicitacaoAdm_functions.dart';

class CadastroLicitacaoAdmPage extends StatefulWidget {
  @override
  _CadastroLicitacaoAdmPageState createState() => _CadastroLicitacaoAdmPageState();
}

class _CadastroLicitacaoAdmPageState extends State<CadastroLicitacaoAdmPage> {

  bool carregando = true;
  bool aux = true;
  //CadastroStore cadastroStore;
  CadastroLicitacaoAdmFunctions cadastroLicitacaoAdmFunctions;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    //cadastroStore = Provider.of<CadastroStore>(context);
    cadastroLicitacaoAdmFunctions = Provider.of<CadastroLicitacaoAdmFunctions>(context);

    if(aux){
      this.iniciaPage();
      aux = false;
    }

  }

  Future iniciaPage() async {
    await cadastroLicitacaoAdmFunctions.getDadosBanco();
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    CadastroLicitacaoAdmWidget cadastroLicitacaoAdmWidget = CadastroLicitacaoAdmWidget(context);
    return SafeArea(
      child: Scaffold(
        body: carregando ? SpinKitThreeBounce(
          color: StyleGlobals().primaryColor,
          size: StyleGlobals().sizeTitulo,
        )
            : cadastroLicitacaoAdmWidget.cadastroLicitacaoPrincipal(),
      ),
    );
  }
}
