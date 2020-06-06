import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:twp_licitacoes/globals.dart';
import 'package:twp_licitacoes/login/login_functions.dart';
import 'package:twp_licitacoes/login/Widgets/signUp_widget.dart';
import 'login_store.dart';
import 'Widgets/login_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {

    LoginWidget loginWidget = LoginWidget(context);
    SignUpWidget signUpWidget = SignUpWidget(context);
    final loginStore = Provider.of<LoginStore>(context);
    final loginFunctions = Provider.of<LoginFunctions>(context);

    return Scaffold(
      key: loginFunctions.scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: StyleGlobals().colorGradiente,
        ),
        child: new Container(
            height: MediaQuery.of(context).size.height,
            child: PageView(
              controller: loginFunctions.controllerNavigation,
              physics: new AlwaysScrollableScrollPhysics(),
              children: <Widget>[signUpWidget.signUpPage() ,loginWidget.login()],
              scrollDirection: Axis.horizontal,
            )),
      ),
    );
  }
}
