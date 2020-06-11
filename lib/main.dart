import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/administrador/loginAdm/loginAdm_store.dart';

import 'administrador/loginAdm/loginAdm_functions.dart';
import 'empresa/cadastro/Store/cadastro_store.dart';
import 'empresa/cadastro/cadastro_functions.dart';
import 'empresa/editarCadastro/editarCadastro_functions.dart';
import 'empresa/editarCadastro/editarCadastro_store.dart';
import 'home/home_functions.dart';
import 'login/login_functions.dart';
import 'login/login_page.dart';
import 'login/login_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginStore>(create: (_) => LoginStore()),
        Provider<LoginFunctions>(create: (_) => LoginFunctions(context)),
        Provider<CadastroStore>(create: (_) => CadastroStore()),
        Provider<CadastroFunctions>(create: (_) => CadastroFunctions(context)),
        Provider<HomeFunctions>(create: (_) => HomeFunctions(context)),
        Provider<LoginAdmFunctions>(create: (_) => LoginAdmFunctions(context)),
        Provider<LoginAdmStore>(create: (_) => LoginAdmStore()),
        Provider<EditarCadastroFunctions>(create: (_) => EditarCadastroFunctions(context)),
        Provider<EditarCadastroStore>(create: (_) => EditarCadastroStore()),
      ],
      child: MaterialApp(
        title: 'TWP Licitações',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),//MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

/*
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'botao',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => homePage())
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
*/