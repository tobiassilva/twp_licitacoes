import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../globals.dart';
import '../cadastro_functions.dart';
import '../cadastro_store.dart';

class TermosWidget {
  BuildContext context;
  TermosWidget(this.context);

  Widget termosPage() {
    final cadastroStore = Provider.of<CadastroStore>(context);
    final cadastroFunctions = Provider.of<CadastroFunctions>(context);

    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  //margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Icon(
                    FontAwesomeIcons.userEdit,
                    color: Colors.green,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.green,
                ),
                Icon(
                  FontAwesomeIcons.chartPie,
                  color: Colors.green,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.green,
                ),
                Icon(
                  FontAwesomeIcons.fileContract,
                  color: StyleGlobals().primaryColor,
                ),
                Icon(Icons.arrow_forward_ios),
                Icon(FontAwesomeIcons.solidGrinStars),
                Icon(Icons.arrow_forward_ios),
                Icon(FontAwesomeIcons.coins),
              ],
            ),
          ),

          SizedBox(
            height: 35,
          ),

          _termosCampo(),

          SizedBox(
            height: 15,
          ),

          Observer(
            builder: (_){
              return SwitchListTile(
                title: Text(
                  'Li a Política de Privacidade e Termos de Uso',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: StyleGlobals().primaryColor
                  ),
                ),
                value: cadastroStore.aceitouTermos,
                onChanged: (value) {
                  cadastroStore.setAceitouTermos();
                },
              );
            },
          ),

          SizedBox(
            height: 10,
          ),

          _botaoTermos(),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _termosCampo(){
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                  offset: Offset(
                    3.0,
                    3.0,
                  )),
            ]),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            _politicaPrivacidade(),
          ],
        ),
      ),
    );
  }

  Widget _botaoTermos() {
    //final loginStore = Provider.of<LoginStore>(context);
    final cadastroFunctions = Provider.of<CadastroFunctions>(context);

    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () async {
                print('AAAAAAAAA');
                cadastroFunctions.gotoUser();
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      //height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),

                      ),
                      child: Center(
                        child: Text(
                          'Não Aceitar',
                          style: TextStyle(
                              color: StyleGlobals().textColorMedio,
                              fontSize: StyleGlobals().sizeSubtitulo,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () async {
                print('AAAAAAAAA');
                cadastroFunctions.gotoPlano();
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [StyleGlobals().tertiaryColor, StyleGlobals().tertiaryColor]
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                  1.0,
                                  1.0,
                                )),
                          ]
                      ),
                      child: Center(
                        child: Text(
                          'ACEITAR',
                          style: TextStyle(
                              color: StyleGlobals().textColorSecundary,
                              fontSize: StyleGlobals().sizeSubtitulo),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _politicaPrivacidade(){
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'Política de Privacidade Smart Pública',
            style: TextStyle(
              color: StyleGlobals().textColorForte,
              fontSize: StyleGlobals().sizeTitulo,
            ),
          ),

          TextSpan(
            text: '\n\n'
          ),

          TextSpan(
            text: 'A sua privacidade é importante para nós. É política do Smart Pública respeitar a sua privacidade em relação a qualquer informação sua que possamos coletar no aplicativo Smart Pública, e outros aplicativos/sites que possuímos e operamos.\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),

          TextSpan(
            text: 'Solicitamos informações pessoais apenas quando realmente precisamos delas para lhe fornecer um serviço. Fazemo-lo por meios justos e legais, com o seu conhecimento e consentimento. Também informamos por que estamos coletando e como será usado.\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),

          TextSpan(
            text: 'Apenas retemos as informações coletadas pelo tempo necessário para fornecer o serviço solicitado. Quando armazenamos dados, protegemos dentro de meios comercialmente aceitáveis ​​para evitar perdas e roubos, bem como acesso, divulgação, cópia, uso ou modificação não autorizados.\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),

          TextSpan(
            text: 'Não compartilhamos informações de identificação pessoal publicamente ou com terceiros, exceto quando exigido por lei.\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),

          TextSpan(
            text: 'O nosso aplicativo pode ter links para sites/apps externos que não são operados por nós. Esteja ciente de que não temos controle sobre o conteúdo e práticas desses sites/apps e não podemos aceitar responsabilidade por suas respectivas políticas de privacidade.\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),



          TextSpan(
            text: 'Você é livre para recusar a nossa solicitação de informações pessoais, entendendo que talvez não possamos fornecer alguns dos serviços desejados.\n\n',

            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),

          TextSpan(
            text: 'O uso continuado de nosso aplicativo será considerado como aceitação de nossas práticas em torno de privacidade e informações pessoais. Se você tiver alguma dúvida sobre como lidamos com dados do usuário e informações pessoais, entre em contacto connosco.\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),

          TextSpan(
            text: 'Cookies\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorForte,
              fontSize: StyleGlobals().sizeSubtitulo,
            ),
          ),

          TextSpan(
            text: 'Cookies são arquivos com uma pequena quantidade de dados que são comumente usados ​​como identificadores exclusivos anônimos. Eles são enviados para o navegador a partir dos sites visitados e armazenados na memória interna do dispositivo.\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),

          TextSpan(
            text: 'Este serviço não usa esses "cookies" explicitamente. No entanto, o aplicativo pode usar código e bibliotecas de terceiros que usam "cookies" para coletar informações e melhorar seus serviços. Você tem a opção de aceitar ou recusar esses cookies e saber quando um cookie está sendo enviado para o seu dispositivo. Se você optar por recusar nossos cookies, poderá não conseguir usar algumas partes deste Serviço.\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),

          TextSpan(
            text: 'Provedores de serviço\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorForte,
              fontSize: StyleGlobals().sizeSubtitulo,
            ),
          ),

          TextSpan(
            text: 'Posso empregar empresas e indivíduos de terceiros devido aos seguintes motivos:\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),

          TextSpan(
            text: '\t\t\tPara facilitar nosso serviço;\n',
            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),

          TextSpan(
            text: '\t\t\tFornecer o serviço em nosso nome;\n',
            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),

          TextSpan(
            text: '\t\t\tExecutar serviços relacionados ao serviço; ou\n',
            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),

          TextSpan(
            text: '\t\t\tPara nos ajudar a analisar como nosso Serviço é usado.\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),

          TextSpan(
            text: 'Desejo informar aos usuários deste Serviço que esses terceiros têm acesso às suas Informações Pessoais. O motivo é executar as tarefas atribuídas a eles em nosso nome. No entanto, eles são obrigados a não divulgar ou usar as informações para qualquer outra finalidade.\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),

          TextSpan(
            text: 'Segurança\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorForte,
              fontSize: StyleGlobals().sizeSubtitulo,
            ),
          ),

          TextSpan(
            text: 'Valorizo ​​sua confiança em nos fornecer suas informações pessoais, portanto, estamos nos esforçando para usar meios comercialmente aceitáveis ​​de protegê-las. Mas lembre-se de que nenhum método de transmissão pela Internet ou método de armazenamento eletrônico é 100% seguro e confiável, e não posso garantir sua segurança absoluta.\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),

          TextSpan(
            text: 'Links para outros sites\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorForte,
              fontSize: StyleGlobals().sizeSubtitulo,
            ),
          ),

          TextSpan(
            text: 'Este serviço pode conter links para outros sites. Se você clicar em um link de terceiros, será direcionado para esse site. Observe que esses sites externos não são operados por mim. Portanto, recomendo fortemente que você reveja a Política de Privacidade desses sites. Não tenho controle e não assumo responsabilidade pelo conteúdo, políticas de privacidade ou práticas de sites ou serviços de terceiros.\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),

          TextSpan(
            text: 'Privacidade das crianças\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorForte,
              fontSize: StyleGlobals().sizeSubtitulo,
            ),
          ),

          TextSpan(
            text: 'Esses serviços não tratam de menores de 13 anos. Não coleciono intencionalmente informações de identificação pessoal de crianças menores de 13 anos. No caso de descobrir que uma criança menor de 13 anos me forneceu informações pessoais, eu as excluo imediatamente de nossos servidores. Se você é pai ou mãe ou responsável e sabe que seu filho nos forneceu informações pessoais, entre em contato comigo para que eu possa executar as ações necessárias.\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),

          TextSpan(
            text: 'Alterações a esta Política de Privacidade\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorForte,
              fontSize: StyleGlobals().sizeSubtitulo,
            ),
          ),

          TextSpan(
            text: 'Posso atualizar nossa Política de Privacidade periodicamente. Portanto, é recomendável revisar esta página periodicamente para verificar se há alterações. Eu o notificarei de quaisquer alterações postando a nova Política de Privacidade nesta página. Essas alterações são efetivadas imediatamente após serem publicadas nesta página.\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),

          TextSpan(
            text: 'Contate-Nos\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorForte,
              fontSize: StyleGlobals().sizeSubtitulo,
            ),
          ),

          TextSpan(
            text: 'Se você tiver alguma dúvida ou sugestão sobre nossa Política de Privacidade, não hesite em entrar em contato conosco em tobiasarantes0@gmail.com.\n\n',
            style: TextStyle(
              color: StyleGlobals().textColorMedio,
              fontSize: StyleGlobals().sizeText,
            ),
          ),

        ],
      ),
    );
  }


}
