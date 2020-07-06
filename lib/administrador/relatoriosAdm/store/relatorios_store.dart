import 'package:mobx/mobx.dart';

part 'relatorios_store.g.dart';

class RelatoriosStore = _RelatoriosStore with _$RelatoriosStore;

abstract class _RelatoriosStore with Store {

  @observable
  String statusSelecionado;

  @action
  void setStatusSelecionado(value) => statusSelecionado = value;

  @observable
  bool relatStatus = false;

  @action
  void setRelatStatus(value) => relatStatus = value;

}