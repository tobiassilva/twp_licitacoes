import 'package:mobx/mobx.dart';

part 'detalhesLicitacaoAdm_store.g.dart';

class DetalhesLicitacaoAdmStore = _DetalhesLicitacaoAdmStore with _$DetalhesLicitacaoAdmStore;

abstract class _DetalhesLicitacaoAdmStore with Store {

  @observable
  bool carregando = false;

  @action
  void setCarregando(value) => carregando = value;

}