import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/administrador/empresasAdm/empresasAdm_widget.dart';

import 'empresasAdm_functions.dart';

class EmpresasAdmPage extends StatefulWidget {
  @override
  _EmpresasAdmPageState createState() => _EmpresasAdmPageState();
}

class _EmpresasAdmPageState extends State<EmpresasAdmPage> {

  EmpresasAdmFunctions empresaAdmFunctions;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    empresaAdmFunctions = Provider.of<EmpresasAdmFunctions>(context);


  }

  @override
  Widget build(BuildContext context) {
    EmpresasAdmWidget empresaAdmWidget = EmpresasAdmWidget(context);
    return SafeArea(
      child: Scaffold(
        //key: empresaAdmFunctions.scaffoldKeyEmp,
        body: /*carregando ? SpinKitThreeBounce(
          color: StyleGlobals().primaryColor,
          size: StyleGlobals().sizeTitulo,
        )
            :*/ empresaAdmWidget.empresasAdmPrincipal(),
      ),
    );
  }
}
