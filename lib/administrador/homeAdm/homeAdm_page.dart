import 'package:flutter/material.dart';

import '../globalsAdm.dart';

class HomeAdmPage extends StatefulWidget {
  @override
  _HomeAdmPageState createState() => _HomeAdmPageState();
}

class _HomeAdmPageState extends State<HomeAdmPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('id: ${UsuarioGlobals().id}');
    print('nome ${UsuarioGlobals().nome}');
    print('login: ${UsuarioGlobals().login}');
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
