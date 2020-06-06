// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroStore on _CadastroStore, Store {
  final _$aceitouTermosAtom = Atom(name: '_CadastroStore.aceitouTermos');

  @override
  bool get aceitouTermos {
    _$aceitouTermosAtom.reportRead();
    return super.aceitouTermos;
  }

  @override
  set aceitouTermos(bool value) {
    _$aceitouTermosAtom.reportWrite(value, super.aceitouTermos, () {
      super.aceitouTermos = value;
    });
  }

  final _$_CadastroStoreActionController =
      ActionController(name: '_CadastroStore');

  @override
  void setAceitouTermos() {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setAceitouTermos');
    try {
      return super.setAceitouTermos();
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
aceitouTermos: ${aceitouTermos}
    ''';
  }
}
