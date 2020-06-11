// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editarCadastro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditarCadastroStore on _EditarCadastroStore, Store {
  final _$carregandoEnvioAtom =
      Atom(name: '_EditarCadastroStore.carregandoEnvio');

  @override
  bool get carregandoEnvio {
    _$carregandoEnvioAtom.reportRead();
    return super.carregandoEnvio;
  }

  @override
  set carregandoEnvio(bool value) {
    _$carregandoEnvioAtom.reportWrite(value, super.carregandoEnvio, () {
      super.carregandoEnvio = value;
    });
  }

  final _$_EditarCadastroStoreActionController =
      ActionController(name: '_EditarCadastroStore');

  @override
  void setCarregandoEnvio() {
    final _$actionInfo = _$_EditarCadastroStoreActionController.startAction(
        name: '_EditarCadastroStore.setCarregandoEnvio');
    try {
      return super.setCarregandoEnvio();
    } finally {
      _$_EditarCadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carregandoEnvio: ${carregandoEnvio}
    ''';
  }
}
