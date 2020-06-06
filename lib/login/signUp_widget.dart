import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../globals.dart';
import 'login_functions.dart';
import 'login_store.dart';

class SignUpWidget {


  BuildContext context;
  SignUpWidget(this.context);


  Widget signUpPage() {

    final loginFunctions = Provider.of<LoginFunctions>(context);

    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: ListView(
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

          _botaoCriar(),

          SizedBox(
            height: 40,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                onPressed: (){
                  loginFunctions.gotoLogin();
                },
                child: Text(
                  'JÁ POSSUO CONTA',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: StyleGlobals().sizeSubtitulo
                  ),
                ),
              ),
            ],
          ),
        ],
      )
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
                          controller: loginFunctions.emailCria,
                          onChanged: loginStore.setCriaEmail,
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
            height: 25,
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
                    FontAwesomeIcons.userLock,
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
                                controller: loginFunctions.senhaCria,
                                obscureText: true,
                                onChanged: loginStore.setCriaSenha,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'crie uma senha',
                                  hintStyle: TextStyle(color: Colors.white70),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 15,
          ),

          /// CAMPO CONFIRMA SENHA
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
                                controller: loginFunctions.senhaConfirma,
                                obscureText: true,
                                onChanged: loginStore.setConfirmaSenha,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'confirme sua senha',
                                  hintStyle: TextStyle(color: Colors.white70),
                                ),
                              ),
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


  Widget _botaoCriar(){

    final loginStore = Provider.of<LoginStore>(context);
    final loginFunctions = Provider.of<LoginFunctions>(context);

    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () async {
        print('AAAAAAAAA');
        if(!loginStore.carregando){
          loginStore.setCarregando();
          if(loginStore.validaEmail(loginStore.criaEmail)){
            if(loginStore.criaSenha.length >= 8){
              if(loginStore.criaSenha == loginStore.confirmaSenha){
                await loginFunctions.criarEmai(context).then((value){

                }).catchError((e){
                  loginFunctions.scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Erro ao criar conta :(')));
                });
              } else {
                loginFunctions.scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('As senhas devem ser iguais')));
              }
            } else {
              loginFunctions.scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Senha deve ter 8 caracteres ou mais')));
            }
          } else {
            loginFunctions.scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Ops! Esse email não é válido')));
          }
          loginStore.setCarregando();
        }
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
                        : Text('CRIAR CONTA',
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