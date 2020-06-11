import 'package:flutter/material.dart';

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
    return SafeArea(
      child: Scaffold(
        //key: empresaAdmFunctions.scaffoldKey,
        body: /*carregando ? SpinKitThreeBounce(
          color: StyleGlobals().primaryColor,
          size: StyleGlobals().sizeTitulo,
        )
            :*/ detalhesEmpresaAdmWidget.detalhesEmpresaPrincipal(),
      ),
    );
  }
}
