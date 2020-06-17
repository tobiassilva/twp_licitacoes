import 'package:flutter/material.dart';

import 'novasLicitacoes_widget.dart';

class NovasLicitacoesPage extends StatefulWidget {
  @override
  _NovasLicitacoesPageState createState() => _NovasLicitacoesPageState();
}

class _NovasLicitacoesPageState extends State<NovasLicitacoesPage> {
  @override
  Widget build(BuildContext context) {
    NovasLicitacoesWidget novasLicitacoesWidget = NovasLicitacoesWidget(context);
    return SafeArea(
        child: Scaffold(
        //key: empresaAdmFunctions.scaffoldKeyEmp,
        body: novasLicitacoesWidget.novasWidgetPrincipal(),
      ),
    );
  }
}
