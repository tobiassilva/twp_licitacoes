// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalhesEmpresasAdm_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetalhesEmpresasAdmStore on _DetalhesEmpresaAdmStore, Store {
  final _$carregandoAtom = Atom(name: '_DetalhesEmpresaAdmStore.carregando');

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

  final _$_DetalhesEmpresaAdmStoreActionController =
      ActionController(name: '_DetalhesEmpresaAdmStore');

  @override
  void setCarregando(dynamic value) {
    final _$actionInfo = _$_DetalhesEmpresaAdmStoreActionController.startAction(
        name: '_DetalhesEmpresaAdmStore.setCarregando');
    try {
      return super.setCarregando(value);
    } finally {
      _$_DetalhesEmpresaAdmStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carregando: ${carregando}
    ''';
  }
}
