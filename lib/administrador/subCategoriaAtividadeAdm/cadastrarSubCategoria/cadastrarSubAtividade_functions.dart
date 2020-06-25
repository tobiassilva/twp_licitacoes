import 'package:connectivity/connectivity.dart';
import 'package:hasura_connect/hasura_connect.dart';

HasuraConnect hasuraConnect =
    HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

class RequisicoesSubAtividades {
  var jsonSubAtividades;
  var jsonTipoCategoria;
  var jsonInfosSubAtividades;

  bool tipoConexao = true; // false =  tem internet, true = sem internet

  String subscriptionSubAtividades = """
  subscription MySubscription {
  subcategorias_de_atividades {
    nome
  }
}
""";

 String subscriptionTipoCategoria = """
subscription {
  categorias_de_atividades {
    id
    nome
  }
}

""";


//verificando internet
  Future<bool> resultadoInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return true;
    } else {
      return false;
    }
  }

  Future buscaArmazenaSubAtividades() async{
    var snapshot = hasuraConnect.subscription(subscriptionSubAtividades);
    snapshot.listen((data) {
      print("Atividade: $data");
      jsonSubAtividades = data;
    });
  }

  // obtendo as subatividades
  Future getDadosSubAtividades() async {
    var resultadoConexao = await resultadoInternet();
    if (resultadoConexao == false) {
      await buscaArmazenaSubAtividades();
    } else {
      //return true;
    }
    print("SSSSSSSSSS: $jsonSubAtividades");
    return jsonSubAtividades;
  }

//obtendo as Atividades
 Future buscaArmazenaTipoCategoria() async{
    var snapshot = hasuraConnect.subscription(subscriptionTipoCategoria);
    snapshot.listen((data){
      print("TIPOSCATEGORIA: $data");
      jsonTipoCategoria = data;
    });
  }
  
  Future getDadosTiposCategoria() async {
    var resultadoConexao = await resultadoInternet();
    if (resultadoConexao == false) {
       await buscaArmazenaTipoCategoria();
    } else {
      //return true;
    }
    print("WWWWWWWWWW: $jsonTipoCategoria");
    return jsonTipoCategoria;
    
  }

  Future carregaDadosSubAtividades() async {
    await getDadosSubAtividades();
    print("SUBATIVIDADES: $jsonSubAtividades");
  }

  Future carregaInfosSubAtividades() async {
    await carregaDadosSubAtividades();
    return jsonInfosSubAtividades;
  }

  Future recebeDadosTipoCategoria() async {
      await getDadosTiposCategoria();
      
    }

    Future carregaInfos()async{
      await RequisicoesSubAtividades().recebeDadosTipoCategoria();
      return jsonInfosSubAtividades;
    }



  Future enviarFormularioSubAtividades(nome, idCategoria) async {
    var resultadoConexao = await resultadoInternet();
    if (resultadoConexao == false) {
      var data = await hasuraConnect.mutation(querySubAtividades(nome, idCategoria));

      print(data);
    } else {}
  }

  String querySubAtividades(nome, idCategoria) {
    return """
    mutation MyMutation {
    insert_subcategorias_de_atividades(objects: {nome: "$nome", id_categoria: "$idCategoria"}) {
    returning {
      id
    }
  }
}""";
  }
}
