import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/administrador/relatoriosAdm/relatorioDetalhes/relatorioDetalhes_functions.dart';
import 'package:twp_licitacoes/administrador/relatoriosAdm/relatorioDetalhes/relatorioDetalhes_widget.dart';
import 'package:twp_licitacoes/globals.dart';

class RelatoriosDetalhesPage extends StatefulWidget {
  var statusEsc;
  RelatoriosDetalhesPage(this.statusEsc);
  @override
  _RelatoriosDetalhesPageState createState() => _RelatoriosDetalhesPageState(statusEsc);
}

class _RelatoriosDetalhesPageState extends State<RelatoriosDetalhesPage> {

  var _status;
  _RelatoriosDetalhesPageState(this._status);

  RelatoriosDetalhesFunctions relatoriosDetalhesFunctions;

  bool _lerBanco = true;
  bool carregando = true;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    relatoriosDetalhesFunctions = Provider.of<RelatoriosDetalhesFunctions>(context);
    //relatoriosStore = Provider.of<RelatoriosStore>(context);
    /*homeAdmAnalytics = Provider.of<HomeAdmAnalytics>(context);*/

    if(_lerBanco){
      //_getAnalytics();
      //relatoriosStore.setRelatStatus(false);
      _getDadosDB();
      //homeAdmAnalytics.criaGrafico();
      _lerBanco = false;
    }

  }


  Future _getDadosDB() async {
    print('SDDDDDD');
    //homeAdmStore.setCarregandoQtde(true);
    await relatoriosDetalhesFunctions.getDadosBanco(_status);
    //homeAdmStore.setCarregandoQtde(false);

    if(!mounted) return false;
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    RelatoriosDetalhesWidget relatoriosDetalhesWidget = RelatoriosDetalhesWidget(context);
    //final homeAdmStore = Provider.of<HomeAdmStore>(context);
    return SafeArea(
      child: Scaffold(
        //key: homeAdmFunctions.scaffoldKeyHomeAdm,
        backgroundColor: StyleGlobals().secundaryColor,
        body: carregando ? SpinKitThreeBounce(
          color: StyleGlobals().primaryColor,
          size: StyleGlobals().sizeTitulo,
        )
            : relatoriosDetalhesWidget.relatoriosWidgetPrincipal(),
      ),
    );
  }
}
