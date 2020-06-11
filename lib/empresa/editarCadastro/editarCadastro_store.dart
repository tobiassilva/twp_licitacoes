import 'package:mobx/mobx.dart';

part 'editarCadastro_store.g.dart';

class EditarCadastroStore = _EditarCadastroStore with _$EditarCadastroStore;

abstract class _EditarCadastroStore with Store {

  @observable
  bool carregandoEnvio = false;

  @action
  void setCarregandoEnvio() => carregandoEnvio = !carregandoEnvio;

}