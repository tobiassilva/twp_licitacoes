import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:twp_licitacoes/administrador/homeAdm/homeAdm_page.dart';

import '../globalsAdm.dart' as globalsAdm;

class LoginAdmFunctions {

  BuildContext context;
  LoginAdmFunctions(this.context);

  HasuraConnect hasuraConnect = HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

  // Variáveis
  final GlobalKey<ScaffoldState> scaffoldKeyLoginAdm = new GlobalKey<ScaffoldState>();
  final usuario = TextEditingController();
  final senha = TextEditingController();
  List listLoginsBanco = List();

  ///Verifica conexão com a internet
  ///
  Future<bool> result() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return true;
    } else {
      return false;
    }
  }



  /// LOGAR COM EMAIL E SENHA
  ///
  Future logarAdm(BuildContext context) async {



    //final loginStore = Provider.of<LoginStore>(context);

    bool cs = await result();
    var up;

    print('conexao: $cs');
    print('conexao: ${usuario.text}');
    print('conexao: ${senha.text}');

    if (cs == false) {
      /*scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text('Verificando....'),
      ));*/
      await getAdmsBanco();

      for(int i=0; i<listLoginsBanco.length; i++){
        if(listLoginsBanco[i]['usuario'] == usuario.text && listLoginsBanco[i]['senha'] == senha.text){
          print('AAAAAAA');
          //UsuarioGlobals().setUsuario(listLoginsBanco[i]['nome'], listLoginsBanco[i]['id'], listLoginsBanco[i]['usuario']);

          globalsAdm.id = listLoginsBanco[i]['id'];
          globalsAdm.nome = listLoginsBanco[i]['nome'];
          globalsAdm.login = listLoginsBanco[i]['usuario'];


          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => new HomeAdmPage(),
              settings: RouteSettings(name: 'Home Administrador'),
            ),
          );
          return;
        }
      }


    } else {
      scaffoldKeyLoginAdm.currentState
          .showSnackBar(SnackBar(content: Text('Sem conexão com a internet!')));

      return;
    }
    scaffoldKeyLoginAdm.currentState
        .showSnackBar(SnackBar(content: Text('Login Inválido!')));

    return;
  }


  Future getAdmsBanco() async {

    var snapshot = hasuraConnect.query(queryAdm);

    await snapshot.then((data) {
      print(data);
      listLoginsBanco.addAll(data['data']['login_administrador']);
    });

  }

  String queryAdm = """
  query MyQuery {
    login_administrador {
      id
      nome
      senha
      usuario
    }
  }
  """;


}