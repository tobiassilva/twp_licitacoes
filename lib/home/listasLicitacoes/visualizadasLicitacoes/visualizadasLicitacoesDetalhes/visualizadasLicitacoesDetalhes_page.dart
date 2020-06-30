import 'package:flutter/material.dart';
import 'package:twp_licitacoes/home/listasLicitacoes/visualizadasLicitacoes/visualizadasLicitacoesDetalhes/visualizadasLicitacoesDetalhes_widget.dart';
import 'package:twp_licitacoes/home/listasLicitacoes/visualizadasLicitacoes/visualizadasLicitacoes_functions.dart';

class VisualizadasLicitacoesDetalhesPage extends StatefulWidget {

  var jsonLicitacao;
  VisualizadasLicitacoesDetalhesPage(this.jsonLicitacao);

  @override
  _VisualizadasLicitacoesDetalhesPageState createState() => _VisualizadasLicitacoesDetalhesPageState(jsonLicitacao);
}

class _VisualizadasLicitacoesDetalhesPageState extends State<VisualizadasLicitacoesDetalhesPage> {

  var jsonLicitacao;
  _VisualizadasLicitacoesDetalhesPageState(this.jsonLicitacao);

  VisualizadasLicitacoesFunctions visualizadasLicitacoesFunctions;
  bool iniciaInfos = true;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();


    visualizadasLicitacoesFunctions = VisualizadasLicitacoesFunctions(context);

    if(iniciaInfos){
      visualizadasLicitacoesFunctions.verificaVisualizados(jsonLicitacao['id'].toString());
      iniciaInfos = false;
    }

  }

  @override
  Widget build(BuildContext context) {
    VisualizadasLicitacoesDetalhesWidget favoritasLicitacoesDetalhesWidget = VisualizadasLicitacoesDetalhesWidget(context, jsonLicitacao);
    return SafeArea(
      child: Scaffold(
        body: /*carregando ? SpinKitThreeBounce(
          color: StyleGlobals().primaryColor,
          size: StyleGlobals().sizeTitulo,
        )
            :*/ favoritasLicitacoesDetalhesWidget.visualizadasLicitacoesPrincipal(),
      ),
    );
  }
}
