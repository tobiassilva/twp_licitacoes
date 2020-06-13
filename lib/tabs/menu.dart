import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twp_licitacoes/administrador/categoriaAtividadeAdm/cadastrarAtividade/cadastrarAtividade_page.dart';
import 'package:twp_licitacoes/administrador/loginAdm/loginAdm_page.dart';
import 'package:twp_licitacoes/orgao/cadastroOrgao/cadastroOrgao_page.dart';
import 'package:twp_licitacoes/orgao/editarOrgao/consultarOrgao_page.dart';
import 'package:twp_licitacoes/login/login_page.dart';

import '../globals.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: StyleGlobals().primaryColor,
          border: Border.all(
            width: 1.0,
            color: Colors.transparent,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 45),
              width: MediaQuery.of(context).size.height / 5,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/smart-publica.png'),
              ),
            ),
            Divider(
              color: Colors.transparent,
            ),
            _botoesMenuPush(FontAwesomeIcons.plus, "Cadastrar Orgão",
                CadastroOrgaoPage(), context),
            SizedBox(
              height: 5,
            ),
            _botoesMenuPush(FontAwesomeIcons.search, "Consultar Orgãos", ConsultarOrgaoPage(), context),
            SizedBox(
              height: 5,
            ),
            _botoesMenuPush(FontAwesomeIcons.plus, "Cadastrar Atividade", CadastrarAtividadePage(), context),
            SizedBox(
              height: 5,
            ),
            _botoesMenuPush(FontAwesomeIcons.userCog, "Painel do Administrador",
                LoginAdmPage(), context),
            SizedBox(
              height: 5,
            ),
            _botoesMenuPushReplacement(FontAwesomeIcons.doorOpen, "Sair",
                LoginPage(), context),
            /*_botoesMenuPush(FontAwesomeIcons.fileSignature,
                "Criar Autuação", autuacaoPage(), context),
            //_botoesMenuPush(FontAwesomeIcons.times, "CustomWidget", LoginPage(), context),
            _botoesMenuPushReplacement(
                FontAwesomeIcons.times, "Sair", LoginPage(), context),*/
          ],
        ),
      ),
    );
  }

  Widget _botoesMenuPushReplacement(icone, nome, Widget nomePagina, context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 3),
      decoration: BoxDecoration(
          color: StyleGlobals().textColorSecundary,
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => nomePagina));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon((icone),
                      color: StyleGlobals().tertiaryColor,
                      size: StyleGlobals().sizeTextMedio,
                    ),
                    Text(
                      '  $nome',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: StyleGlobals().tertiaryColor,
                          //fontWeight: FontWeight.bold,
                          fontSize: StyleGlobals().sizeTextMedio
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget _botoesMenuPush(icone, nome, Widget nomePagina, context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 3),
      decoration: BoxDecoration(
          color: StyleGlobals().textColorSecundary,
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => nomePagina));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon((icone),
                      color: StyleGlobals().tertiaryColor,
                      size: StyleGlobals().sizeTextMedio,
                    ),
                    Text(
                      '  $nome',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: StyleGlobals().tertiaryColor,
                          //fontWeight: FontWeight.bold,
                          fontSize: StyleGlobals().sizeTextMedio
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

/*Widget _botoesMenuPush(icone, nome, Widget nomePagina, context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 3),
      decoration: BoxDecoration(
          color: coresApp.corClaroSecundaria,
          borderRadius: BorderRadius.circular(30)),
      child: FlatButton(
        onPressed: null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => nomePagina));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon((icone), color: coresIcones.corPrimaria),
                      Text(
                        '  $nome',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: coresTexto.corTextoSecundario,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }*/
}