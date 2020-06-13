import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../globalsAdm.dart';
import 'loginAdm_functions.dart';
import 'loginAdm_widget.dart';


class LoginAdmPage extends StatefulWidget {
  @override
  _LoginAdmPageState createState() => _LoginAdmPageState();
}

class _LoginAdmPageState extends State<LoginAdmPage> {

  LoginAdmFunctions loginAdmFunctions;
  LoginAdmWidget loginAdmWidget;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    loginAdmFunctions = Provider.of<LoginAdmFunctions>(context);
    loginAdmWidget = LoginAdmWidget(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: loginAdmFunctions.scaffoldKeyLoginAdm,
      body: loginAdmWidget.login(),
    );
  }
}
