// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relatorios_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RelatoriosStore on _RelatoriosStore, Store {
  final _$statusSelecionadoAtom =
      Atom(name: '_RelatoriosStore.statusSelecionado');

  @override
  String get statusSelecionado {
    _$statusSelecionadoAtom.reportRead();
    return super.statusSelecionado;
  }

  @override
  set statusSelecionado(String value) {
    _$statusSelecionadoAtom.reportWrite(value, super.statusSelecionado, () {
      super.statusSelecionado = value;
    });
  }

  final _$relatStatusAtom = Atom(name: '_RelatoriosStore.relatStatus');

  @override
  bool get relatStatus {
    _$relatStatusAtom.reportRead();
    return super.relatStatus;
  }

  @override
  set relatStatus(bool value) {
    _$relatStatusAtom.reportWrite(value, super.relatStatus, () {
      super.relatStatus = value;
    });
  }

  final _$_RelatoriosStoreActionController =
      ActionController(name: '_RelatoriosStore');

  @override
  void setStatusSelecionado(dynamic value) {
    final _$actionInfo = _$_RelatoriosStoreActionController.startAction(
        name: '_RelatoriosStore.setStatusSelecionado');
    try {
      return super.setStatusSelecionado(value);
    } finally {
      _$_RelatoriosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRelatStatus(dynamic value) {
    final _$actionInfo = _$_RelatoriosStoreActionController.startAction(
        name: '_RelatoriosStore.setRelatStatus');
    try {
      return super.setRelatStatus(value);
    } finally {
      _$_RelatoriosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
statusSelecionado: ${statusSelecionado},
relatStatus: ${relatStatus}
    ''';
  }
}
