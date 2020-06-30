import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/globals.dart';
import 'package:twp_licitacoes/home/listasLicitacoes/novasLicitacoes/novasLicitacoes_functions.dart';

import 'novasLicitacoes_widget.dart';

class NovasLicitacoesPage extends StatefulWidget {
  @override
  _NovasLicitacoesPageState createState() => _NovasLicitacoesPageState();
}

class _NovasLicitacoesPageState extends State<NovasLicitacoesPage> {

  bool carregando = true;
  bool _lerBanco = true;

  NovasLicitacoesFunctions novasLicitacoesFunctions;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    novasLicitacoesFunctions = Provider.of<NovasLicitacoesFunctions>(context);

    if(_lerBanco){
      recebeDados();
      _lerBanco = false;
    }
  }

  Future recebeDados() async {
    await novasLicitacoesFunctions.carregaLicitacoesNaoVisualizadas();

    if(!mounted) return false;
    setState(() {
      carregando = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    NovasLicitacoesWidget novasLicitacoesWidget = NovasLicitacoesWidget(context);
    return SafeArea(
        child: Scaffold(
        //key: empresaAdmFunctions.scaffoldKeyEmp,
        body: carregando ? SpinKitThreeBounce(
          color: StyleGlobals().primaryColor,
          size: StyleGlobals().sizeTitulo,
        )
            : novasLicitacoesWidget.novasWidgetPrincipal(),
      ),
    );
  }
}
