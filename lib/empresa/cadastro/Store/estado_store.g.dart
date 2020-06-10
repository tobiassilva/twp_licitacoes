// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estado_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EstadoStore on _EstadoStore, Store {
  final _$selecAtom = Atom(name: '_EstadoStore.selec');

  @override
  bool get selec {
    _$selecAtom.reportRead();
    return super.selec;
  }

  @override
  set selec(bool value) {
    _$selecAtom.reportWrite(value, super.selec, () {
      super.selec = value;
    });
  }

  final _$nomeAtom = Atom(name: '_EstadoStore.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$idAtom = Atom(name: '_EstadoStore.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$_EstadoStoreActionController = ActionController(name: '_EstadoStore');

  @override
  void setSelec() {
    final _$actionInfo = _$_EstadoStoreActionController.startAction(
        name: '_EstadoStore.setSelec');
    try {
      return super.setSelec();
    } finally {
      _$_EstadoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void insere(dynamic vid, dynamic vnome) {
    final _$actionInfo =
        _$_EstadoStoreActionController.startAction(name: '_EstadoStore.insere');
    try {
      return super.insere(vid, vnome);
    } finally {
      _$_EstadoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selec: ${selec},
nome: ${nome},
id: ${id}
    ''';
  }
}
