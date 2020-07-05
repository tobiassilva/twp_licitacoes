import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/administrador/relatoriosAdm/relatorios_functions.dart';
import 'package:twp_licitacoes/administrador/relatoriosAdm/relatorios_widget.dart';
import 'package:twp_licitacoes/globals.dart';

class RelatoriosPage extends StatefulWidget {
  @override
  _RelatoriosPageState createState() => _RelatoriosPageState();
}

class _RelatoriosPageState extends State<RelatoriosPage> {

  bool carregando = false;
  bool _lerBanco = true;

  RelatoriosFunctions relatoriosFunctions;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    relatoriosFunctions = Provider.of<RelatoriosFunctions>(context);
    /*homeAdmStore = Provider.of<HomeAdmStore>(context);
    homeAdmAnalytics = Provider.of<HomeAdmAnalytics>(context);*/

    if(_lerBanco){
      //_getAnalytics();
      _getDadosDB();
      //homeAdmAnalytics.criaGrafico();
      _lerBanco = false;
    }

  }

  Future _getDadosDB() async {
    print('SDDDDDD');
    //homeAdmStore.setCarregandoQtde(true);
    await relatoriosFunctions.getDadosBanco();
    //homeAdmStore.setCarregandoQtde(false);

    if(!mounted) return false;
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    RelatoriosWidget relatoriosWidget = RelatoriosWidget(context);
    //final homeAdmStore = Provider.of<HomeAdmStore>(context);
    return SafeArea(
      child: Scaffold(
        //key: homeAdmFunctions.scaffoldKeyHomeAdm,
        backgroundColor: StyleGlobals().secundaryColor,
        body: carregando ? SpinKitThreeBounce(
          color: StyleGlobals().primaryColor,
          size: StyleGlobals().sizeTitulo,
        )
            : relatoriosWidget.relatoriosWidgetPrincipal(),
      ),
    );
  }
}
