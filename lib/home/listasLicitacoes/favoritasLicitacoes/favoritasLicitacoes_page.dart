import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/globals.dart';
import 'package:twp_licitacoes/home/listasLicitacoes/favoritasLicitacoes/favoritasLicitacoes_functions.dart';

import 'favoritasLicitacoes_widget.dart';

class FavoritasLicitacoesPage extends StatefulWidget {
  @override
  _FavoritasLicitacoesPageState createState() => _FavoritasLicitacoesPageState();
}

class _FavoritasLicitacoesPageState extends State<FavoritasLicitacoesPage> {

  bool carregando = true;
  bool _lerBanco = true;

  FavoritasLicitacoesFunctions favoritasLicitacoesFunctions;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    favoritasLicitacoesFunctions = Provider.of<FavoritasLicitacoesFunctions>(context);

    if(_lerBanco){
      recebeDados();
      _lerBanco = false;
    }
  }

  Future recebeDados() async {
    await favoritasLicitacoesFunctions.carregaLicitacoesFavoritas();

    if(!mounted) return false;
    setState(() {
      carregando = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    FavoritasLicitacoesWidget favoritasLicitacoesWidget = FavoritasLicitacoesWidget(context);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(

          body: carregando ? SpinKitThreeBounce(
            color: StyleGlobals().primaryColor,
            size: StyleGlobals().sizeTitulo,
          )
              : favoritasLicitacoesWidget.favoritasWidgetPrincipal(),
        ),
      ),
    );
  }
}
