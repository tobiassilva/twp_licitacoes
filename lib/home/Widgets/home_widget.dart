import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twp_licitacoes/cadastroOrgao/cadastroOrgao_page.dart';

import '../../globals.dart';


class customDrawer extends StatelessWidget {
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
            new Container(
              margin: EdgeInsets.only(top: 45),
              child: Image.asset('assets/images/smart-publica.png',
                  height: MediaQuery.of(context).size.height / 5),
            ),
            Divider(
              color: Colors.transparent,
            ),
            _botoesMenuPushReplacement(FontAwesomeIcons.plus, "Cadastrar Orgão",
                CadastroOrgaoPage(), context),
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
      child: FlatButton(
        onPressed: null,
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
                      Icon((icone), color: StyleGlobals().tertiaryColor),
                      Text(
                        '  $nome',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: StyleGlobals().tertiaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ),
          ],
        ),
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
