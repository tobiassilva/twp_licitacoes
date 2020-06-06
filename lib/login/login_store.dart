import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  _LoginStore(){
    autorun((_){
      print(email);
      print(carregando);
    });
  }

  /// LOGIN
  @observable
  var email = '';

  @observable
  var senha = '';

  @observable
  bool verSenha = false;

  @observable
  bool carregando = false;


  @action
  void setVerSenha() => verSenha = !verSenha;

  @action
  void setEmail(value) => email = value;

  @action
  void setSenha(value) => senha = value;

  @action
  bool validaEmail(value) {
    bool emailValido = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);

    print(emailValido);
    print(value);

    return emailValido;
  }

  @action
  void setCarregando() => carregando = !carregando;


  ///CRIA CONTA
  @observable
  var criaEmail = '';

  @observable
  var criaSenha = '';

  @observable
  var confirmaSenha = '';

  @action
  void setCriaEmail(value) => criaEmail = value;

  @action
  void setCriaSenha(value) => criaSenha = value;

  @action
  void setConfirmaSenha(value) => confirmaSenha = value;

}