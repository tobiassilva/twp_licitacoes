import 'package:mobx/mobx.dart';

part 'consultarLicitacaoAdm_store.g.dart';

class ConsultarLicitacaoAdmStore = _ConsultarLicitacaoAdmStore with _$ConsultarLicitacaoAdmStore;

abstract class _ConsultarLicitacaoAdmStore with Store {

  @observable
  bool searchSelec = false;

  @action
  void setSearchSelec() => searchSelec = !searchSelec;

}