import 'package:flutter/material.dart';

import 'detalhesLicitacaoAdm_widget.dart';

class DetalhesLicitacaoAdmPage extends StatefulWidget {

  var jsonLicitacao;
  DetalhesLicitacaoAdmPage(this.jsonLicitacao);

  @override
  _DetalhesLicitacaoAdmPageState createState() => _DetalhesLicitacaoAdmPageState(jsonLicitacao);
}

class _DetalhesLicitacaoAdmPageState extends State<DetalhesLicitacaoAdmPage> {

  var jsonLicitacao;
  _DetalhesLicitacaoAdmPageState(this.jsonLicitacao);

  @override
  Widget build(BuildContext context) {
    DetalhesLicitacaoAdmWidget detalhesLicitacaoAdmWidget = DetalhesLicitacaoAdmWidget(context, jsonLicitacao);
    return SafeArea(
      child: Scaffold(
        body: /*carregando ? SpinKitThreeBounce(
          color: StyleGlobals().primaryColor,
          size: StyleGlobals().sizeTitulo,
        )
            :*/ detalhesLicitacaoAdmWidget.detalhesLicitacaoPrincipal(),
      ),
    );
  }
}
