import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/administrador/categoriaAtividadeAdm/editarAtividade/editarAtividade_functions.dart';
import 'package:twp_licitacoes/administrador/homeAdm/homeAdm_store.dart';
import 'package:twp_licitacoes/administrador/licitacaoAdm/cadastroLicitacao/cadastroLicitacaoAdm_store.dart';
import 'package:twp_licitacoes/administrador/licitacaoAdm/consultarLicitacao/consultarLicitacaoAdm_store.dart';
import 'package:twp_licitacoes/administrador/licitacaoAdm/consultarLicitacao/detalhesLicitacaoAdm/detalhesLicitacaoAdm_store.dart';
import 'package:twp_licitacoes/administrador/loginAdm/loginAdm_store.dart';
import 'package:twp_licitacoes/administrador/relatoriosAdm/relatorioDetalhes/relatorioDetalhes_functions.dart';
import 'package:twp_licitacoes/administrador/relatoriosAdm/relatorios_functions.dart';
import 'package:twp_licitacoes/administrador/relatoriosAdm/store/relatorios_store.dart';
import 'package:twp_licitacoes/administrador/subCategoriaAtividadeAdm/editarSubCategoria/editarSubAtividade_functions.dart';
import 'package:twp_licitacoes/globalsVars.dart';
import 'package:twp_licitacoes/home/Store/home_store.dart';
import 'package:twp_licitacoes/home/listasLicitacoes/favoritasLicitacoes/favoritasLicitacoes_functions.dart';
import 'package:twp_licitacoes/home/listasLicitacoes/visualizadasLicitacoes/visualizadasLicitacoes_functions.dart';

import 'administrador/empresasAdm/detalhesEmpresasAdm/detalhesEmpresasAdm_store.dart';
import 'administrador/empresasAdm/detalhesEmpresasAdm/detalhesEmpresasAdm_functions.dart';
import 'administrador/empresasAdm/empresasAdm_functions.dart';
import 'administrador/homeAdm/HomeAdm_analytics.dart';
import 'administrador/homeAdm/homeAdm_functions.dart';
import 'administrador/licitacaoAdm/cadastroLicitacao/cadastroLicitacaoAdm_functions.dart';
import 'administrador/licitacaoAdm/consultarLicitacao/detalhesLicitacaoAdm/detalhesLicitacaoAdm_functions.dart';
import 'administrador/loginAdm/loginAdm_functions.dart';
import 'empresa/cadastro/Store/cadastro_store.dart';
import 'empresa/cadastro/cadastro_functions.dart';
import 'empresa/editarCadastro/editarCadastro_functions.dart';
import 'empresa/editarCadastro/editarCadastro_store.dart';
import 'home/home_functions.dart';
import 'home/listasLicitacoes/novasLicitacoes/novasLicitacoes_functions.dart';
import 'login/login_functions.dart';
import 'login/login_page.dart';
import 'login/login_store.dart';
import 'orgao/editarOrgao/editarOrgao_functions.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        Provider<HomeAdmFunctions>(create: (_) => HomeAdmFunctions(context)),
        Provider<HomeAdmStore>(create: (_) => HomeAdmStore()),
        Provider<EmpresasAdmFunctions>(create: (_) => EmpresasAdmFunctions(context)),
        Provider<UpdateOrgaoFunctions>(create: (_) => UpdateOrgaoFunctions(context)),
        Provider<UpdateAtividadesFunctions>(create: (_) => UpdateAtividadesFunctions(context)),
        Provider<UpdateSubAtividadesFunctions>(create: (_) => UpdateSubAtividadesFunctions(context)),
        Provider<DetalhesEmpresasAdmFunctions>(create: (_) => DetalhesEmpresasAdmFunctions(context)),
        Provider<DetalhesEmpresasAdmStore>(create: (_) => DetalhesEmpresasAdmStore()),
        Provider<HomeAdmAnalytics>(create: (_) => HomeAdmAnalytics(context)),
        Provider<DetalhesLicitacaoAdmFunctions>(create: (_) => DetalhesLicitacaoAdmFunctions(context)),
        Provider<DetalhesLicitacaoAdmStore>(create: (_) => DetalhesLicitacaoAdmStore()),
        Provider<CadastroLicitacaoAdmFunctions>(create: (_) => CadastroLicitacaoAdmFunctions(context)),
        Provider<CadastroLicitacaoAdmStore>(create: (_) => CadastroLicitacaoAdmStore()),
        Provider<ConsultarLicitacaoAdmStore>(create: (_) => ConsultarLicitacaoAdmStore()),
        Provider<GlobalsVariaveis>(create: (_) => GlobalsVariaveis()),
        Provider<HomeStore>(create: (_) => HomeStore()),
        Provider<FavoritasLicitacoesFunctions>(create: (_) => FavoritasLicitacoesFunctions(context)),
        Provider<VisualizadasLicitacoesFunctions>(create: (_) => VisualizadasLicitacoesFunctions(context)),
        Provider<NovasLicitacoesFunctions>(create: (_) => NovasLicitacoesFunctions(context)),
        Provider<RelatoriosFunctions>(create: (_) => RelatoriosFunctions(context)),
        Provider<RelatoriosStore>(create: (_) => RelatoriosStore()),
        Provider<RelatoriosDetalhesFunctions>(create: (_) => RelatoriosDetalhesFunctions(context)),
      ],
      child: MaterialApp(
        title: 'TWP Licitações',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),//MyHomePage(title: 'Flutter Demo Home Page'),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('pt'),
        ],
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