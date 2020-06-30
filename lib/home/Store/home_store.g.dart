// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$favoritoAtom = Atom(name: '_HomeStore.favorito');

  @override
  bool get favorito {
    _$favoritoAtom.reportRead();
    return super.favorito;
  }

  @override
  set favorito(bool value) {
    _$favoritoAtom.reportWrite(value, super.favorito, () {
      super.favorito = value;
    });
  }

  final _$visualizadoAtom = Atom(name: '_HomeStore.visualizado');

  @override
  bool get visualizado {
    _$visualizadoAtom.reportRead();
    return super.visualizado;
  }

  @override
  set visualizado(bool value) {
    _$visualizadoAtom.reportWrite(value, super.visualizado, () {
      super.visualizado = value;
    });
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  void setFavorito(dynamic value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setFavorito');
    try {
      return super.setFavorito(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVisualizado(dynamic value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setVisualizado');
    try {
      return super.setVisualizado(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favorito: ${favorito},
visualizado: ${visualizado}
    ''';
  }
}
