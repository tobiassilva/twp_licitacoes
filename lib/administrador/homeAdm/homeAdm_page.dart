import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/administrador/homeAdm/homeAdm_functions.dart';
import 'package:twp_licitacoes/administrador/homeAdm/homeAdm_widget.dart';

import '../../globals.dart';
import '../globalsAdm.dart' as globalsAdm;

class HomeAdmPage extends StatefulWidget {
  @override
  _HomeAdmPageState createState() => _HomeAdmPageState();
}

class _HomeAdmPageState extends State<HomeAdmPage> {

  HomeAdmFunctions homeAdmFunctions;
  bool _lerBanco = true;
  bool carregando = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('id: ${globalsAdm.id}');
    print('nome ${globalsAdm.nome}');
    print('login: ${globalsAdm.login}');

    //_getDadosDB();

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    homeAdmFunctions = Provider.of<HomeAdmFunctions>(context);

    if(_lerBanco){
      _getDadosDB();
      _lerBanco = false;
    }

  }

  Future _getDadosDB() async {
    print('SDDDDDD');
    await homeAdmFunctions.getDadosBanco();

    setState(() {
      carregando = false;
    });

  }


  @override
  Widget build(BuildContext context) {
    HomeAdmWidget homeAdmWidget = HomeAdmWidget(context);
    return SafeArea(
      child: Scaffold(
        key: homeAdmFunctions.scaffoldKey,
        body: carregando ? SpinKitThreeBounce(
          color: StyleGlobals().primaryColor,
          size: StyleGlobals().sizeTitulo,
        )
            : homeAdmWidget.homeAdmPage(),
      ),
    );
  }
}
