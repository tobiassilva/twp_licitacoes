import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/administrador/homeAdm/homeAdm_store.dart';

import '../../globals.dart';
import 'loginAdm_functions.dart';
import 'loginAdm_store.dart';

class LoginAdmWidget {

  BuildContext context;
  LoginAdmWidget(this.context);

  Widget login() {
    final loginAdmFunctions = Provider.of<LoginAdmFunctions>(context);

    return Container(
      color: StyleGlobals().secundaryColor,
      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: 150.0,
                    height: 150.0,
                    /*decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/smart-publica.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),*/
                    child: Icon(
                      FontAwesomeIcons.userShield,
                      size: 100,
                      color: StyleGlobals().primaryColor,
                    ),
                  ),
                  Text('Administrador',
                    style: TextStyle(
                      fontSize: StyleGlobals().sizeTitulo,
                      color: StyleGlobals().textColorMedio
                    ),
                  ),
                ],
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

        ],
      ),
    );
  }

  Widget _formulario_widget() {

    //final loginStore = Provider.of<LoginStore>(context);
    final loginAdmFunctions = Provider.of<LoginAdmFunctions>(context);
    final loginAdmStore = Provider.of<LoginAdmStore>(context);

    return Container(
      child: Column(
        children: <Widget>[
          /// CAMPO EMAIL
          Container(
            height: 60,
            //color: Colors.white,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: StyleGlobals().primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(7))),
                  height: 60,
                  width: 43,
                  padding: EdgeInsets.only(left: 8, right: 8),
                  margin: EdgeInsets.only(right: 7),
                  child: Icon(
                    FontAwesomeIcons.userShield,
                    color: StyleGlobals().secundaryColor,
                    size: 22,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new TextFormField(
                          style: TextStyle(
                              color: StyleGlobals().textColorForte
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: loginAdmFunctions.usuario,
                          //onChanged: loginStore.setEmail,
                          enabled: !loginAdmStore.carregando,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'nome de usuário',
                            hintStyle: TextStyle(color: Colors.black38),
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
            height: 60,
            //color: Colors.white,
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: StyleGlobals().primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(7))),
                  height: 60,
                  width: 43,
                  //padding: EdgeInsets.only(left: 8, right: 8),
                  margin: EdgeInsets.only(right: 7),
                  child: Icon(
                    FontAwesomeIcons.lock,
                    color: StyleGlobals().secundaryColor,
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
                                style: TextStyle(
                                    color: StyleGlobals().textColorForte
                                ),
                                keyboardType: TextInputType.visiblePassword,

                                enabled: !loginAdmStore.carregando,
                                controller: loginAdmFunctions.senha,
                                obscureText: !loginAdmStore.verSenha,
                                onChanged: loginAdmStore.setSenha,
                                textAlign: TextAlign.left,

                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'digite sua senha',
                                  hintStyle: TextStyle(color: Colors.black45),
                                ),
                              ),
                            ),
                            IconButton(
                              //autofocus: false,
                              padding: EdgeInsets.all(0),
                              icon: Icon(
                                loginAdmStore.verSenha ? Icons.visibility_off : Icons
                                    .visibility, color: Colors.black45,),
                              onPressed: () {
                                loginAdmStore.setVerSenha();
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


    final loginAdmFunctions = Provider.of<LoginAdmFunctions>(context);
    final loginAdmStore = Provider.of<LoginAdmStore>(context);
    final homeAdmStore = Provider.of<HomeAdmStore>(context);

    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () async {
        print('AAAAAAAAA');
        /*Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CadastroPage())
        );*/
        if(!loginAdmStore.carregando){
          loginAdmStore.setCarregando();///TODO: COLOCAR DE VOLTA ESSAS PORRA
          if(loginAdmFunctions.usuario.text.isNotEmpty){
            if(loginAdmFunctions.senha.text.length > 0){
              homeAdmStore.setCarregandoQtde(true);
              await loginAdmFunctions.logarAdm(context).then((value){

              }).catchError((e){
                loginAdmFunctions.scaffoldKeyLoginAdm.currentState.showSnackBar(SnackBar(content: Text('Usuário não encontrado :(')));
              });
            } else {
              loginAdmFunctions.scaffoldKeyLoginAdm.currentState.showSnackBar(SnackBar(content: Text('Ops! Não esqueça da senha')));
            }
          } else {
            loginAdmFunctions.scaffoldKeyLoginAdm.currentState.showSnackBar(SnackBar(content: Text('Ops! Esse email não é válido')));
          }
          loginAdmStore.setCarregando();
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
                      color: StyleGlobals().primaryColor
                  ),
                  child: Center(
                    child: loginAdmStore.carregando ?
                    SpinKitThreeBounce(
                      color: StyleGlobals().secundaryColor,
                      size: StyleGlobals().sizeTitulo,
                    )
                        : Text('LOGIN',
                      style: TextStyle(
                          color: StyleGlobals().secundaryColor,
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