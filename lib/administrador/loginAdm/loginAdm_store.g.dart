// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginAdm_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginAdmStore on _LoginAdmStore, Store {
  final _$senhaAtom = Atom(name: '_LoginAdmStore.senha');

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

  final _$verSenhaAtom = Atom(name: '_LoginAdmStore.verSenha');

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

  final _$carregandoAtom = Atom(name: '_LoginAdmStore.carregando');

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

  final _$_LoginAdmStoreActionController =
      ActionController(name: '_LoginAdmStore');

  @override
  void setVerSenha() {
    final _$actionInfo = _$_LoginAdmStoreActionController.startAction(
        name: '_LoginAdmStore.setVerSenha');
    try {
      return super.setVerSenha();
    } finally {
      _$_LoginAdmStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(dynamic value) {
    final _$actionInfo = _$_LoginAdmStoreActionController.startAction(
        name: '_LoginAdmStore.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_LoginAdmStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCarregando() {
    final _$actionInfo = _$_LoginAdmStoreActionController.startAction(
        name: '_LoginAdmStore.setCarregando');
    try {
      return super.setCarregando();
    } finally {
      _$_LoginAdmStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
senha: ${senha},
verSenha: ${verSenha},
carregando: ${carregando}
    ''';
  }
}
