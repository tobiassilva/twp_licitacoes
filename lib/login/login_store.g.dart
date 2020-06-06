// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  final _$emailAtom = Atom(name: '_LoginStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: '_LoginStore.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$verSenhaAtom = Atom(name: '_LoginStore.verSenha');

  @override
  bool get verSenha {
    _$verSenhaAtom.reportRead();
    return super.verSenha;
  }

  @override
  set verSenha(bool value) {
    _$verSenhaAtom.reportWrite(value, super.verSenha, () {
      super.verSenha = value;
    });
  }

  final _$carregandoAtom = Atom(name: '_LoginStore.carregando');

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  final _$criaEmailAtom = Atom(name: '_LoginStore.criaEmail');

  @override
  String get criaEmail {
    _$criaEmailAtom.reportRead();
    return super.criaEmail;
  }

  @override
  set criaEmail(String value) {
    _$criaEmailAtom.reportWrite(value, super.criaEmail, () {
      super.criaEmail = value;
    });
  }

  final _$criaSenhaAtom = Atom(name: '_LoginStore.criaSenha');

  @override
  String get criaSenha {
    _$criaSenhaAtom.reportRead();
    return super.criaSenha;
  }

  @override
  set criaSenha(String value) {
    _$criaSenhaAtom.reportWrite(value, super.criaSenha, () {
      super.criaSenha = value;
    });
  }

  final _$confirmaSenhaAtom = Atom(name: '_LoginStore.confirmaSenha');

  @override
  String get confirmaSenha {
    _$confirmaSenhaAtom.reportRead();
    return super.confirmaSenha;
  }

  @override
  set confirmaSenha(String value) {
    _$confirmaSenhaAtom.reportWrite(value, super.confirmaSenha, () {
      super.confirmaSenha = value;
    });
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void setVerSenha() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setVerSenha');
    try {
      return super.setVerSenha();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(dynamic value) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(dynamic value) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validaEmail(dynamic value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.validaEmail');
    try {
      return super.validaEmail(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCarregando() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setCarregando');
    try {
      return super.setCarregando();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCriaEmail(dynamic value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setCriaEmail');
    try {
      return super.setCriaEmail(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCriaSenha(dynamic value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setCriaSenha');
    try {
      return super.setCriaSenha(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmaSenha(dynamic value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setConfirmaSenha');
    try {
      return super.setConfirmaSenha(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
senha: ${senha},
verSenha: ${verSenha},
carregando: ${carregando},
criaEmail: ${criaEmail},
criaSenha: ${criaSenha},
confirmaSenha: ${confirmaSenha}
    ''';
  }
}
