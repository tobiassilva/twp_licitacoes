import 'package:mobx/mobx.dart';

part 'detalhesEmpresasAdm_store.g.dart';

class DetalhesEmpresasAdmStore = _DetalhesEmpresaAdmStore with _$DetalhesEmpresasAdmStore;

abstract class _DetalhesEmpresaAdmStore with Store {

  @observable
  bool carregando = false;

  @action
  void setCarregando(value) => carregando = value;
}