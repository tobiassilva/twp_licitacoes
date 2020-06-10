import 'package:mobx/mobx.dart';

part 'loginAdm_store.g.dart';

class LoginAdmStore = _LoginAdmStore with _$LoginAdmStore;

abstract class _LoginAdmStore with Store {

  @observable
  var senha = '';

  @observable
  bool verSenha = false;

  @observable
  bool carregando = false;

  @action
  void setVerSenha() => verSenha = !verSenha;

  @action
  void setSenha(value) => senha = value;


  @action
  void setCarregando() => carregando = !carregando;

}