import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/administrador/homeAdm/homeAdm_functions.dart';
import 'package:twp_licitacoes/administrador/homeAdm/homeAdm_widget.dart';

import '../../globals.dart';
import '../globalsAdm.dart' as globalsAdm;
import 'homeAdm_store.dart';

class HomeAdmPage extends StatefulWidget {
  @override
  _HomeAdmPageState createState() => _HomeAdmPageState();
}

class _HomeAdmPageState extends State<HomeAdmPage> {

  HomeAdmFunctions homeAdmFunctions;
  HomeAdmStore homeAdmStore;
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
    homeAdmStore = Provider.of<HomeAdmStore>(context);

    if(_lerBanco){
      _getDadosDB();
      _lerBanco = false;
    }

  }

  Future _getDadosDB() async {
    print('SDDDDDD');
    homeAdmStore.setCarregandoQtde(true);
    await homeAdmFunctions.getDadosBanco();
    homeAdmStore.setCarregandoQtde(false);

    setState(() {
      carregando = false;
    });

  }


  @override
  Widget build(BuildContext context) {
    HomeAdmWidget homeAdmWidget = HomeAdmWidget(context);
    final homeAdmStore = Provider.of<HomeAdmStore>(context);
    return SafeArea(
      child: Scaffold(
        //key: homeAdmFunctions.scaffoldKeyHomeAdm,
        body: carregando ? SpinKitThreeBounce(
          color: StyleGlobals().primaryColor,
          size: StyleGlobals().sizeTitulo,
        )
            : homeAdmWidget.homeAdmPage(),
      ),
    );
  }
}
