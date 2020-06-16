import 'package:mobx/mobx.dart';

part 'cadastroLicitacaoAdm_store.g.dart';

class CadastroLicitacaoAdmStore = _CadastroLicitacaoAdmStore with _$CadastroLicitacaoAdmStore;

abstract class _CadastroLicitacaoAdmStore with Store {

  @observable
  String nomeCatEscolhido = '';

  @observable
  bool selCategoria = false;

  @observable
  String nomeSubcatEscolhido = '';

  @observable
  bool selSubcategoria = false;

  @observable
  bool temSubcat = false;

  @observable
  String nomeOrgaoEscolhido = '';

  @observable
  bool selOrgao = false;

  @observable
  var dataLimiteCRC = '';

  @observable
  bool seldataLimiteCRC = false;

  @observable
  var dataLimiteEnvioDoc = '';

  @observable
  bool seldataLimiteEnvioDoc = false;

  @observable
  var dataSessaoPublica = '';

  @observable
  bool seldataSessaoPublica = false;

  @observable
  var horaSessaoPublica = '';

  @observable
  bool selhoraSessaoPublica = false;

  @observable
  var modalidade = '';

  @observable
  bool selmodalidade = false;

  @observable
  var situacao = '';

  @observable
  bool selsituacao = false;

  @action
  void cadastraCategoria(value) => nomeCatEscolhido = value;

  @action
  void setSelCategoria(value) => selCategoria = value;

  @action
  void cadastraSubcategoria(value) => nomeSubcatEscolhido = value;

  @action
  void setSelSubcategoria(value) => selSubcategoria = value;

  @action
  void setTemSubcat(value) => temSubcat = value;

  @action
  void cadastraOrgao(value) => nomeOrgaoEscolhido = value;

  @action
  void setSelOrgao(value) => selOrgao = value;

  @action
  void cadastraDataLimiteCRC(value) => dataLimiteCRC = value;

  @action
  void setSelDataLimiteCRC(value) => seldataLimiteCRC = value;

  @action
  void cadastraDataLimiteEnvioDoc(value) => dataLimiteEnvioDoc = value;

  @action
  void setSelDataLimiteEnvioDoc(value) => seldataLimiteEnvioDoc = value;

  @action
  void cadastraDataSessaoPublica(value) => dataSessaoPublica = value;

  @action
  void setSelDataSessaoPublica(value) => seldataSessaoPublica = value;

  @action
  void cadastraHoraSessaoPublica(value) => horaSessaoPublica = value;

  @action
  void setSelHoraSessaoPublica(value) => selhoraSessaoPublica = value;

  @action
  void cadastraModalidade(value) => modalidade = value;

  @action
  void setSelModalidade(value) => selmodalidade = value;

  @action
  void cadastraSituacao(value) => situacao = value;

  @action
  void setSelSituacao(value) => selsituacao = value;

  @action
  void setLimpaSubcategoria() {
    selSubcategoria = false;
    nomeSubcatEscolhido = '';
  }

  @action
  void zeraValores() {
    selSubcategoria = false;
    selsituacao = false;
    selmodalidade = false;
    seldataLimiteCRC = false;
    selOrgao = false;
    selCategoria = false;
    seldataLimiteEnvioDoc = false;
    seldataSessaoPublica = false;
    selhoraSessaoPublica = false;

    nomeSubcatEscolhido = '';
    nomeOrgaoEscolhido = '';
    nomeCatEscolhido = '';
    horaSessaoPublica = '';
    dataSessaoPublica = '';
    dataLimiteEnvioDoc = '';
    dataLimiteCRC = '';
    situacao = '';
    modalidade = '';
  }

  /// envio dos dados
  @observable
  bool carregandoEnvio = false;

  @action
  void setCarregandoEnvio(value) => carregandoEnvio = value;



}