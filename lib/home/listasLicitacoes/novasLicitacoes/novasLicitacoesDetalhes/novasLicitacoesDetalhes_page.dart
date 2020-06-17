import 'package:flutter/material.dart';

import '../novasLicitacoes_functions.dart';
import 'novasLicitacoesDetalhes_widget.dart';

class NovasLicitacoesDetalhesPage extends StatefulWidget {

  var jsonLicitacao;
  NovasLicitacoesDetalhesPage(this.jsonLicitacao);

  @override
  _NovasLicitacoesDetalhesPageState createState() => _NovasLicitacoesDetalhesPageState(jsonLicitacao);
}

class _NovasLicitacoesDetalhesPageState extends State<NovasLicitacoesDetalhesPage> {

  var jsonLicitacao;
  _NovasLicitacoesDetalhesPageState(this.jsonLicitacao);

  bool iniciaInfos = true;

  NovasLicitacoesFunctions novasLicitacoesFunctions;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();


    novasLicitacoesFunctions = NovasLicitacoesFunctions(context);

    if(iniciaInfos){
      novasLicitacoesFunctions.verificaFavoritos(jsonLicitacao['id'].toString());
      iniciaInfos = false;
    }

  }

  @override
  Widget build(BuildContext context) {
    NovasLicitacoesDetalhesWidget novasLicitacoesDetalhesWidget = NovasLicitacoesDetalhesWidget(context, jsonLicitacao);
    return SafeArea(
      child: Scaffold(
        body: /*carregando ? SpinKitThreeBounce(
          color: StyleGlobals().primaryColor,
          size: StyleGlobals().sizeTitulo,
        )
            :*/ novasLicitacoesDetalhesWidget.novasLicitacoesPrincipal(),
      ),
    );
  }
}

