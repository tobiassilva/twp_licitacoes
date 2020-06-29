import 'package:twp_licitacoes/administrador/subCategoriaAtividadeAdm/cadastrarSubCategoria/cadastrarSubAtividade_functions.dart';
import 'package:twp_licitacoes/orgao/cadastroOrgao/cadastroOrgao_functions.dart';


class RequisicoesNecessariasNoLogin{
Future requisitaNecessarias() async{
  await RequisicoesSubAtividades().getDadosTiposCategoria();
  await Requisicoes().getDadosTiposOrgaos();
  await Requisicoes().getDadosEstados();
 }
}