import 'package:mobx/mobx.dart';

part 'estado_store.g.dart';

class EstadoStore = _EstadoStore with _$EstadoStore;

abstract class _EstadoStore with Store {

  _EstadoStore(this.nome, this.id);

  @observable
  bool selec = false;

  @observable
  String nome = '';

  @observable
  int id;

  @action
  void setSelec() {

    selec = !selec;
  }

  @action
  void insere(vid, vnome){
    id = vid;
    nome = vnome;
    print('IIIIIDDDDDDDD: $id');
    print('IIIIIDDDDDDDDvnome: $vnome');
  }

}