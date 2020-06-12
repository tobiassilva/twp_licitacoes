import 'package:mobx/mobx.dart';

part 'homeAdm_store.g.dart';

class HomeAdmStore = _HomeAdmStore with _$HomeAdmStore;

abstract class _HomeAdmStore with Store {

  @observable
  bool carregandoQtde = true;

  @action
  void setCarregandoQtde(value) {
    carregandoQtde = value;
    print(carregandoQtde);
  }

  /*
  @observable
  bool carregandoQtdeEmpresas = true;

  @observable
  bool carregandoQtdeLicitacoes = true;

  @observable
  bool carregandoQtdeOrgaos = true;

  @observable
  bool carregandoQtdeEstados = true;

  @action
  void setCarregandoQtdeEmpresas(value) => carregandoQtdeEmpresas = value;
  */

}