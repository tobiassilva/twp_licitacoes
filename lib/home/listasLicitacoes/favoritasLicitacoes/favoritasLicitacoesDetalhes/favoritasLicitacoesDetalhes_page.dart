import 'package:flutter/material.dart';

import 'favoritasLicitacoesDetalhes_widget.dart';

class FavoritasLicitacoesDetalhesPage extends StatefulWidget {

  var jsonLicitacao;
  FavoritasLicitacoesDetalhesPage(this.jsonLicitacao);

  @override
  _FavoritasLicitacoesDetalhesPageState createState() => _FavoritasLicitacoesDetalhesPageState(jsonLicitacao);
}

class _FavoritasLicitacoesDetalhesPageState extends State<FavoritasLicitacoesDetalhesPage> {

  var jsonLicitacao;
  _FavoritasLicitacoesDetalhesPageState(this.jsonLicitacao);


  @override
  Widget build(BuildContext context) {
    FavoritasLicitacoesDetalhesWidget favoritasLicitacoesDetalhesWidget = FavoritasLicitacoesDetalhesWidget(context, jsonLicitacao);
    return SafeArea(
      child: Scaffold(
        body: /*carregando ? SpinKitThreeBounce(
          color: StyleGlobals().primaryColor,
          size: StyleGlobals().sizeTitulo,
        )
            :*/ favoritasLicitacoesDetalhesWidget.favoritasLicitacoesPrincipal(),
      ),
    );
  }
}
