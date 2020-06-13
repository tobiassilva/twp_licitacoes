import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:twp_licitacoes/empresa/cadastro/cadastro_page.dart';

import 'package:twp_licitacoes/home/home.dart';
import 'package:twp_licitacoes/orgao/cadastroOrgao/cadastroOrgao_functions.dart';

import 'login_store.dart';


class LoginFunctions {

  BuildContext context;
  LoginFunctions(context);

  //Variáveis
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  //final GoogleSignIn _googleSignIn = GoogleSignIn();
  //static final FacebookLogin facebookSignIn = new FacebookLogin();
  int empresa_id;

  //Login
  final formKeyLogin = GlobalKey<FormState>();
  final email = TextEditingController();
  final senhaLog = TextEditingController();

  //Cria Conta
  final emailCria = TextEditingController();
  final senhaCria = TextEditingController();
  final senhaConfirma = TextEditingController();


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

  String queryEmpresa(idEmpresa){
    return """
    query MyQuery {
      empresa(where: {id: {_eq: $idEmpresa}}) {
        id
        email
      }
    }
""";
  }


  /// LOGAR COM EMAIL E SENHA
  ///
  Future logarEmail(BuildContext context) async {

    //final loginStore = Provider.of<LoginStore>(context);

    bool cs = await result();
    var snapshot;
    var up;

    print('conexao: $cs');
    print('conexao: ${email.text}');
    print('conexao: ${senhaLog.text}');

    if (cs == false) {
      scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text('Verificando....'),
      ));

      final FirebaseUser user = await auth.signInWithEmailAndPassword(
          email: email.text, password: senhaLog.text);
      print("singd in " + user.email);

      final notesReference = FirebaseDatabase.instance
          .reference()
          .child('userProfile/${user.uid}');

      print('AQUIIIII');

      await notesReference.once().then((DataSnapshot snapshot){
        if(snapshot.value != null){
          up = snapshot.value['up'];
          empresa_id = snapshot.value['id_empresa'];
        }
      });

      snapshot = await hasuraConnect.query(queryEmpresa(empresa_id));


    } else {
      scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('Sem conexão com a internet!')));

      return;
    }

    //loginStore.mudaCarregamento(); //false
    //loginStore.apagaInfos();

    //loginStore.setCarregando();
    //final cadastroFunctions = Provider.of<CadastroFunctions>(context);
    //CadastroFunctions.getDadosBanco();

    if(up == 0){
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => new CadastroPage(),
          settings: RouteSettings(name: 'Cadastro'),
        ),
      );
    } else {
      if(snapshot['data']['empresa'].length == 0){

        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => new CadastroPage(),
            settings: RouteSettings(name: 'Cadastro'),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
            builder: (context) => new HomePage(),
            settings: RouteSettings(name: 'Home'),
          ),
        );
      }
    }



    return;
  }


  /// CRIAR EMAIL
  ///
  Future criarEmai(BuildContext context) async {

    print('ENTROU CRIA');
    //final loginStore = Provider.of<LoginStore>(context);
    print('ENTROU CRIA');
    bool cs = await result();

    if (cs == false) {
      try {
        final FirebaseUser user = await auth.createUserWithEmailAndPassword(
            email: emailCria.text, password: senhaCria.text);
        print("singd in " + user.email);

        final notesReference = FirebaseDatabase.instance
            .reference()
            .child('userProfile/${user.uid}');

        notesReference
            .update({'name': user.displayName, 'email': user.email, 'up': 0});


      } catch (e) {
        print('ERRO00');
        print("e: $e");
        scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(
                'O endereço de email já está sendo usado por outra conta ou é Inválido!')));
        return;
      }
    } else {
      scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('Sem conexão com a internet!')));
    }

    //loginStore.setCarregando(); //false

    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new CadastroPage(),
      ),
    );

    return;
  }


  ///RECUPERAR EMAIL
  ///
  Future Recover(EmailRec) async {

    bool cs = await result();

    if (cs == false) {
      final user = auth.sendPasswordResetEmail(email: EmailRec.text);

    } else {
      scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('Sem conexão com a internet!')));
    }

    return;
  }













  //NAVEGAÇÃO ENTRE AS PÁGINAS
  PageController controllerNavigation =
  new PageController(initialPage: 1, viewportFraction: 1.0);

  gotoSignUp() {
    controllerNavigation.animateToPage(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoLogin() {
    controllerNavigation.animateToPage(
      1,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoRec() {
    //controller_minus1To0.reverse(from: 0.0);
    controllerNavigation.animateToPage(
      2,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

}