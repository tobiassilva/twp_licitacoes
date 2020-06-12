// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeAdm_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeAdmStore on _HomeAdmStore, Store {
  final _$carregandoQtdeAtom = Atom(name: '_HomeAdmStore.carregandoQtde');

  @override
  bool get carregandoQtde {
    _$carregandoQtdeAtom.reportRead();
    return super.carregandoQtde;
  }

  @override
  set carregandoQtde(bool value) {
    _$carregandoQtdeAtom.reportWrite(value, super.carregandoQtde, () {
      super.carregandoQtde = value;
    });
  }

  final _$_HomeAdmStoreActionController =
      ActionController(name: '_HomeAdmStore');

  @override
  void setCarregandoQtde(dynamic value) {
    final _$actionInfo = _$_HomeAdmStoreActionController.startAction(
        name: '_HomeAdmStore.setCarregandoQtde');
    try {
      return super.setCarregandoQtde(value);
    } finally {
      _$_HomeAdmStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carregandoQtde: ${carregandoQtde}
    ''';
  }
}
