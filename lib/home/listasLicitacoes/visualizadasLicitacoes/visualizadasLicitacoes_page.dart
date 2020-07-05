import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/globals.dart';
import 'package:twp_licitacoes/home/listasLicitacoes/visualizadasLicitacoes/visualizadasLicitacoes_functions.dart';
import 'package:twp_licitacoes/home/listasLicitacoes/visualizadasLicitacoes/visualizadasLicitacoes_widget.dart';

class VisualizadasLicitacoesPage extends StatefulWidget {
  @override
  _VisualizadasLicitacoesPageState createState() => _VisualizadasLicitacoesPageState();
}

class _VisualizadasLicitacoesPageState extends State<VisualizadasLicitacoesPage> {

  bool carregando = true;
  bool _lerBanco = true;

  VisualizadasLicitacoesFunctions visualizadasLicitacoesFunctions;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    visualizadasLicitacoesFunctions = Provider.of<VisualizadasLicitacoesFunctions>(context);

    if(_lerBanco){
      recebeDados();
      _lerBanco = false;
    }
  }

  Future recebeDados() async {
    await visualizadasLicitacoesFunctions.carregaLicitacoesVisualizadas();

    if(!mounted) return false;
    setState(() {
      carregando = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    VisualizadasLicitacoesWidget favoritasLicitacoesWidget = VisualizadasLicitacoesWidget(context);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(

          body: carregando ? SpinKitThreeBounce(
            color: StyleGlobals().primaryColor,
            size: StyleGlobals().sizeTitulo,
          )
              : favoritasLicitacoesWidget.visualizadasWidgetPrincipal(),
        ),
      ),
    );
  }

}
