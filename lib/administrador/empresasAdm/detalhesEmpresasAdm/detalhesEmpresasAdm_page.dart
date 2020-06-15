import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detalhesEmpresasAdm_functions.dart';
import 'detalhesEmpresasAdm_widget.dart';

class DetalhesEmpresasAdm extends StatefulWidget {
  var jsonEmpresa;

  DetalhesEmpresasAdm(this.jsonEmpresa);
  @override
  _DetalhesEmpresasAdmState createState() => _DetalhesEmpresasAdmState(jsonEmpresa);
}

class _DetalhesEmpresasAdmState extends State<DetalhesEmpresasAdm> {

  var jsonEmpresa;
  _DetalhesEmpresasAdmState(this.jsonEmpresa);

  @override
  Widget build(BuildContext context) {
    DetalhesEmpresasAdmWidget detalhesEmpresaAdmWidget = DetalhesEmpresasAdmWidget(context, jsonEmpresa);
    final detalhesEmpresasAdmFunctions = Provider.of<DetalhesEmpresasAdmFunctions>(context);
    return SafeArea(
      //key: detalhesEmpresasAdmFunctions.scaffoldKey,
      child: Scaffold(
        //key: homeAdmFunctions.scaffoldKeyHomeAdm,
        body: /*carregando ? SpinKitThreeBounce(
          color: StyleGlobals().primaryColor,
          size: StyleGlobals().sizeTitulo,
        )
            :*/ detalhesEmpresaAdmWidget.detalhesEmpresaPrincipal(),
      ),
    );
  }
}
