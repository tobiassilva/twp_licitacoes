import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/administrador/licitacaoAdm/cadastroLicitacao/cadastroLicitacaoAdm_page.dart';

import '../../../globals.dart';
import 'consultarLicitacaoAdm_store.dart';
import 'consultarLicitacaoAdm_widget.dart';
import '../../globalsAdm.dart' as globalsAdm;
class ConsultarLicitacaoAdmPage extends StatefulWidget {
  @override
  _ConsultarLicitacaoAdmPageState createState() => _ConsultarLicitacaoAdmPageState();
}

class _ConsultarLicitacaoAdmPageState extends State<ConsultarLicitacaoAdmPage> {

  @override
  Widget build(BuildContext context) {
    ConsultarLicitacaoAdmWidget consultarLicitacaoAdmWidget = ConsultarLicitacaoAdmWidget(context);
    return SafeArea(
      child: Scaffold(
        //key: empresaAdmFunctions.scaffoldKeyEmp,
        body: /*carregando ? SpinKitThreeBounce(
          color: StyleGlobals().primaryColor,
          size: StyleGlobals().sizeTitulo,
        )
            :*/ consultarLicitacaoAdmWidget.consultarLicitacoesAdmPrincipal(),
      ),
    );
  }


  /*void filterSearchResults(String query) {
    List dummySearchList = List();
    dummySearchList.addAll(globalsAdm.dbLicitacoes);
    if(query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        globalsAdm.dbLicitacoesFiltro.clear();
        globalsAdm.dbLicitacoesFiltro.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        globalsAdm.dbLicitacoesFiltro.clear();
        globalsAdm.dbLicitacoesFiltro.addAll(globalsAdm.dbLicitacoes);
      });
    }

  }*/
}
