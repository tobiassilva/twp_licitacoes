// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroStore on _CadastroStore, Store {
  final _$nomeCatEscolhidoAtom = Atom(name: '_CadastroStore.nomeCatEscolhido');

  @override
  String get nomeCatEscolhido {
    _$nomeCatEscolhidoAtom.reportRead();
    return super.nomeCatEscolhido;
  }

  @override
  set nomeCatEscolhido(String value) {
    _$nomeCatEscolhidoAtom.reportWrite(value, super.nomeCatEscolhido, () {
      super.nomeCatEscolhido = value;
    });
  }

  final _$selCategoriaAtom = Atom(name: '_CadastroStore.selCategoria');

  @override
  bool get selCategoria {
    _$selCategoriaAtom.reportRead();
    return super.selCategoria;
  }

  @override
  set selCategoria(bool value) {
    _$selCategoriaAtom.reportWrite(value, super.selCategoria, () {
      super.selCategoria = value;
    });
  }

  final _$nomeSubcatEscolhidoAtom =
      Atom(name: '_CadastroStore.nomeSubcatEscolhido');

  @override
  String get nomeSubcatEscolhido {
    _$nomeSubcatEscolhidoAtom.reportRead();
    return super.nomeSubcatEscolhido;
  }

  @override
  set nomeSubcatEscolhido(String value) {
    _$nomeSubcatEscolhidoAtom.reportWrite(value, super.nomeSubcatEscolhido, () {
      super.nomeSubcatEscolhido = value;
    });
  }

  final _$selSubcategoriaAtom = Atom(name: '_CadastroStore.selSubcategoria');

  @override
  bool get selSubcategoria {
    _$selSubcategoriaAtom.reportRead();
    return super.selSubcategoria;
  }

  @override
  set selSubcategoria(bool value) {
    _$selSubcategoriaAtom.reportWrite(value, super.selSubcategoria, () {
      super.selSubcategoria = value;
    });
  }

  final _$temSubcatAtom = Atom(name: '_CadastroStore.temSubcat');

  @override
  bool get temSubcat {
    _$temSubcatAtom.reportRead();
    return super.temSubcat;
  }

  @override
  set temSubcat(bool value) {
    _$temSubcatAtom.reportWrite(value, super.temSubcat, () {
      super.temSubcat = value;
    });
  }

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

  final _$carregandoAtom = Atom(name: '_CadastroStore.carregando');

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

  final _$selecEstadoAtom = Atom(name: '_CadastroStore.selecEstado');

  @override
  bool get selecEstado {
    _$selecEstadoAtom.reportRead();
    return super.selecEstado;
  }

  @override
  set selecEstado(bool value) {
    _$selecEstadoAtom.reportWrite(value, super.selecEstado, () {
      super.selecEstado = value;
    });
  }

  final _$listEstadosAtom = Atom(name: '_CadastroStore.listEstados');

  @override
  ObservableList<EstadoStore> get listEstados {
    _$listEstadosAtom.reportRead();
    return super.listEstados;
  }

  @override
  set listEstados(ObservableList<EstadoStore> value) {
    _$listEstadosAtom.reportWrite(value, super.listEstados, () {
      super.listEstados = value;
    });
  }

  final _$_CadastroStoreActionController =
      ActionController(name: '_CadastroStore');

  @override
  void cadastraCategoria(dynamic value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.cadastraCategoria');
    try {
      return super.cadastraCategoria(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelCategoria(dynamic value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setSelCategoria');
    try {
      return super.setSelCategoria(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cadastraSubcategoria(dynamic value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.cadastraSubcategoria');
    try {
      return super.cadastraSubcategoria(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelSubcategoria(dynamic value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setSelSubcategoria');
    try {
      return super.setSelSubcategoria(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTemSubcat(dynamic value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setTemSubcat');
    try {
      return super.setTemSubcat(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLimpaSubcategoria() {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setLimpaSubcategoria');
    try {
      return super.setLimpaSubcategoria();
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

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
  void setCarregando() {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setCarregando');
    try {
      return super.setCarregando();
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addEmpresas(dynamic nome, dynamic id) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.addEmpresas');
    try {
      return super.addEmpresas(nome, id);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void limpaEmpresas() {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.limpaEmpresas');
    try {
      return super.limpaEmpresas();
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nomeCatEscolhido: ${nomeCatEscolhido},
selCategoria: ${selCategoria},
nomeSubcatEscolhido: ${nomeSubcatEscolhido},
selSubcategoria: ${selSubcategoria},
temSubcat: ${temSubcat},
aceitouTermos: ${aceitouTermos},
carregando: ${carregando},
selecEstado: ${selecEstado},
listEstados: ${listEstados}
    ''';
  }
}
