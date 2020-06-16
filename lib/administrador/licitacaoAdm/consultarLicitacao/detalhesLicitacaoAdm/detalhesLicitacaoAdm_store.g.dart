// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalhesLicitacaoAdm_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetalhesLicitacaoAdmStore on _DetalhesLicitacaoAdmStore, Store {
  final _$carregandoAtom = Atom(name: '_DetalhesLicitacaoAdmStore.carregando');

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

  final _$_DetalhesLicitacaoAdmStoreActionController =
      ActionController(name: '_DetalhesLicitacaoAdmStore');

  @override
  void setCarregando(dynamic value) {
    final _$actionInfo = _$_DetalhesLicitacaoAdmStoreActionController
        .startAction(name: '_DetalhesLicitacaoAdmStore.setCarregando');
    try {
      return super.setCarregando(value);
    } finally {
      _$_DetalhesLicitacaoAdmStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carregando: ${carregando}
    ''';
  }
}
