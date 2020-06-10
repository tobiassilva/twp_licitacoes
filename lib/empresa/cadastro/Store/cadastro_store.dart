import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'estado_store.dart';

part 'cadastro_store.g.dart';

class CadastroStore = _CadastroStore with _$CadastroStore;

abstract class _CadastroStore with Store {

  _CadastroStore(){
    autorun((_){
      print(selCategoria);
    });
  }

  @observable
  String nomeCatEscolhido = '';

  @observable
  bool selCategoria = false;

  @observable
  String nomeSubcatEscolhido = '';

  @observable
  bool selSubcategoria = false;

  @observable
  bool temSubcat = false;

  @observable
  bool aceitouTermos = false;

  @observable
  bool carregando = false;

  @action
  void cadastraCategoria(value) => nomeCatEscolhido = value;

  @action
  void setSelCategoria(value) => selCategoria = value;

  @action
  void cadastraSubcategoria(value) => nomeSubcatEscolhido = value;

  @action
  void setSelSubcategoria(value) => selSubcategoria = value;

  @action
  void setTemSubcat(value) => temSubcat = value;

  @action
  void setLimpaSubcategoria() {
    selSubcategoria = false;
    nomeSubcatEscolhido = '';
  }

  @action
  void setAceitouTermos() => aceitouTermos = !aceitouTermos;

  @action
  void setCarregando(){
    carregando = !carregando;
    print('CARREGANDO: $carregando');
  }

  @observable
  bool selecEstado = false;

  @observable
  ObservableList<EstadoStore> listEstados = ObservableList<EstadoStore>();



  @action
  void addEmpresas(nome, id){
    //todoList = List.from(todoList..add(newTodoTitle));
    //print('id nome: $id $nome');
    //var value = EstadoStore();

    listEstados.insert(0, EstadoStore(nome, id));

  }

  @action
  void limpaEmpresas(){

    listEstados.clear();

  }

}