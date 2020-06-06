import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/cadastro/cadastro_page.dart';

import 'package:twp_licitacoes/globals.dart';

import 'login_functions.dart';
import 'login_store.dart';

class LoginWidget {

  BuildContext context;
  LoginWidget(this.context);


  Widget login() {
    final loginFunctions = Provider.of<LoginFunctions>(context);

    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/smart-publica.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          _formulario_widget(),

          SizedBox(
            height: 40,
          ),

          _botaoLogar(),

          SizedBox(
            height: 40,
          ),

          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: (){
                    loginFunctions.gotoSignUp();
                  },
                  child: Text(
                    'CRIAR CONTA',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: StyleGlobals().sizeTextMedio
                    ),
                  ),
                ),
              ),

              Text(
                '|',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: StyleGlobals().sizeTitulo,
                    fontWeight: FontWeight.bold
                ),
              ),

              Expanded(
                child: FlatButton(
                  onPressed: (){

                  },
                  child: Text(
                    'RECUPERAR SENHA',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: StyleGlobals().sizeTextMedio
                    ),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

  Widget _formulario_widget() {

    final loginStore = Provider.of<LoginStore>(context);
    final loginFunctions = Provider.of<LoginFunctions>(context);

    return Container(
      child: Column(
        children: <Widget>[
          /// CAMPO EMAIL
          Container(
            height: 65,
            //color: Colors.white,
            decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: StyleGlobals().textColorSecundary,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(7))),
                  height: 65,
                  width: 45,
                  padding: EdgeInsets.only(left: 8, right: 8),
                  margin: EdgeInsets.only(right: 7),
                  child: Icon(
                    FontAwesomeIcons.userAlt,
                    color: StyleGlobals().primaryColor,
                    size: 22,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new TextFormField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          controller: loginFunctions.email,
                          onChanged: loginStore.setEmail,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'digite seu email',
                            hintStyle: TextStyle(color: Colors.white70),
                          ),

                        ),

                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 15,
          ),

          /// CAMPO SENHA
          Container(
            height: 65,
            //color: Colors.white,
            decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: StyleGlobals().textColorSecundary,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(7))),
                  height: 65,
                  width: 45,
                  //padding: EdgeInsets.only(left: 8, right: 8),
                  margin: EdgeInsets.only(right: 7),
                  child: Icon(
                    FontAwesomeIcons.lock,
                    color: StyleGlobals().primaryColor,
                    size: 22,
                  ),
                ),
                Expanded(
                  child: Observer(
                    builder: (_) {
                      return Row(
                        children: <Widget>[
                          Expanded(
                            child: new TextFormField(
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.visiblePassword,

                              //enabled: false,
                              controller: loginFunctions.senhaLog,
                              obscureText: !loginStore.verSenha,
                              onChanged: loginStore.setSenha,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'digite sua senha',
                                hintStyle: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ),
                          IconButton(
                            //autofocus: false,
                            padding: EdgeInsets.all(0),
                            icon: Icon(
                              loginStore.verSenha ? Icons.visibility_off : Icons
                                  .visibility, color: Colors.white,),
                            onPressed: () {
                              loginStore.setVerSenha();
                            },
                          ),
                        ],
                      );
                    }
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  
  Widget _botaoLogar(){

    final loginStore = Provider.of<LoginStore>(context);
    final loginFunctions = Provider.of<LoginFunctions>(context);

    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () async {
        print('AAAAAAAAA');
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CadastroPage())
        );
        /*if(!loginStore.carregando){
          loginStore.setCarregando();///TODO: COLOCAR DE VOLTA ESSAS PORRA
          if(loginStore.validaEmail(loginStore.email)){
            if(loginStore.senha.length > 0){
              await loginFunctions.logarEmail(context).then((value){

              }).catchError((e){
                loginFunctions.scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Usuário não encontrado :(')));
              });
            } else {
              loginFunctions.scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Ops! Não esqueça da senha')));
            }
          } else {
            loginFunctions.scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Ops! Esse email não é válido')));
          }
          loginStore.setCarregando();
        }*/
        //loginStore.setCarregando();
      }, 
      child: Row(
        children: <Widget>[
          Expanded(
            child: Observer(
              builder: (_){
                return Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: StyleGlobals().secundaryColor
                  ),
                  child: Center(
                    child: loginStore.carregando ?
                    SpinKitThreeBounce(
                      color: StyleGlobals().primaryColor,
                      size: StyleGlobals().sizeTitulo,
                    )
                        : Text('LOGIN',
                      style: TextStyle(
                          color: StyleGlobals().primaryColor,
                          fontSize: StyleGlobals().sizeSubtitulo
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
