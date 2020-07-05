import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {

  @observable
  bool favorito = false;

  @action
  void setFavorito(value) => favorito = value;

  @observable
  bool visualizado = false;

  @action
  void setVisualizado(value) => visualizado = value;

}