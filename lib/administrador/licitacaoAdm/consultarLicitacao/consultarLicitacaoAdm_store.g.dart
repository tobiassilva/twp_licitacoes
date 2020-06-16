// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultarLicitacaoAdm_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConsultarLicitacaoAdmStore on _ConsultarLicitacaoAdmStore, Store {
  final _$searchSelecAtom =
      Atom(name: '_ConsultarLicitacaoAdmStore.searchSelec');

  @override
  bool get searchSelec {
    _$searchSelecAtom.reportRead();
    return super.searchSelec;
  }

  @override
  set searchSelec(bool value) {
    _$searchSelecAtom.reportWrite(value, super.searchSelec, () {
      super.searchSelec = value;
    });
  }

  final _$_ConsultarLicitacaoAdmStoreActionController =
      ActionController(name: '_ConsultarLicitacaoAdmStore');

  @override
  void setSearchSelec() {
    final _$actionInfo = _$_ConsultarLicitacaoAdmStoreActionController
        .startAction(name: '_ConsultarLicitacaoAdmStore.setSearchSelec');
    try {
      return super.setSearchSelec();
    } finally {
      _$_ConsultarLicitacaoAdmStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchSelec: ${searchSelec}
    ''';
  }
}
