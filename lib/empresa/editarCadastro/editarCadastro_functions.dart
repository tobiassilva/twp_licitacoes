import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:twp_licitacoes/home/home.dart';

class EditarCadastroFunctions{

  BuildContext context;
  EditarCadastroFunctions(this.context);


  HasuraConnect hasuraConnect = HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var user;
  var empresaUserFirebase;
  var empresaUserBD;


  //EditarCadastroUsuárioEmpresa
  final nomeEmpresa = TextEditingController();
  final nomeRepresentante = TextEditingController();
  final email = TextEditingController();
  final telefone = TextEditingController();
  final cnpj = TextEditingController();
  final cep = TextEditingController();
  final logradouro = TextEditingController();
  final numero = TextEditingController();
  final complemento = TextEditingController();
  final cidade = TextEditingController();
  final estado = TextEditingController();

  var maskTextCNPJ = MaskTextInputFormatter(
      mask: "##.###.###/####-##", filter: {"#": RegExp(r'[0-9]')});

  var maskTextCEP = MaskTextInputFormatter(
      mask: "##.###-###", filter: {"#": RegExp(r'[0-9]')});

  var maskTextTel = MaskTextInputFormatter(
      mask: "(##)####-#####", filter: {"#": RegExp(r'[0-9]')});

  String queryEmpresa(id) {
    return """
    query MyQuery {
      empresa(where: {id: {_eq: $id}}) {
        cep
        cidade
        cnpj
        complemento
        email
        estado
        id_categoria
        id_subcategoria
        logradouro
        nome_empresa
        nome_representante
        numero
        id
        plano
        telefone
        termos
      }
    }

    """;
  }


  String updateQueryEmpresa() {
    return """
    mutation MyMutation {
      update_empresa(where: {id: {_eq: ${empresaUserFirebase['id_empresa']}}}, _set: {nome_empresa: "${nomeEmpresa.text}", nome_representante: "${nomeRepresentante.text}"}) {
        returning {
          id
          id_categoria
          id_subcategoria
        }
      }
    }

    """;
  }

  /*String updateQueryEmpresa() {
    return """
    mutation MyMutation {
      update_empresa(where: {id: {_eq: ${empresaUserFirebase['id_empresa']}}, _set: {cep: "${cep.text}", cidade: "${cidade.text}", cnpj: "${cnpj.text}", complemento: "${complemento.text}", email: "${email.text}", estado: "${estado.text}", logradouro: "${logradouro.text}", nome_empresa: "${nomeEmpresa.text}", nome_representante: "${nomeRepresentante.text}", numero: "${numero.text}", telefone: "${telefone.text}"}) {
        returning {
          id
          id_categoria
          id_subcategoria
        }
      }
    }

    """;
  }*/

  Future verificaUser() async {

    await getEmpresaFirebase();

    print("empresaUserFirebase['id_empresa']: ${empresaUserFirebase['id_empresa']}");
    var snapshot = await hasuraConnect.query(queryEmpresa(empresaUserFirebase['id_empresa']));

    //print(snapshot);
    empresaUserBD = snapshot['data']['empresa'][0];
    print('EMPRESA: $empresaUserBD');

    nomeEmpresa.text = empresaUserBD['nome_empresa'];
    nomeRepresentante.text = empresaUserBD['nome_representante'];
    email.text = empresaUserBD['email'];
    telefone.text = empresaUserBD['telefone'];
    cnpj.text = empresaUserBD['cnpj'];
    cep.text = empresaUserBD['cep'];
    logradouro.text = empresaUserBD['logradouro'];
    numero.text = empresaUserBD['numero'];
    complemento.text = empresaUserBD['complemento'];
    cidade.text = empresaUserBD['cidade'];
    estado.text = empresaUserBD['estado'];

  }

  Future getEmpresaFirebase() async {
    user = await _auth.currentUser();

    final notesReference = FirebaseDatabase.instance
        .reference()
        .child('userProfile/${user.uid}');

    print('AQUIIIII');

    await notesReference.once().then((DataSnapshot snapshot){
      if(snapshot.value != null){
        empresaUserFirebase = snapshot.value;
      }
    });
    print('empresaUserFirebase: $empresaUserFirebase');
  }

  Future<bool> updateEmpresa() async {

    print('FFFFFFF');

    var mutations = r"""
    mutation update_empresa($nome: String, $representante: String) {
      update_empresa(where: {id: {_eq: 39}}, _set: {nome_empresa: $nome, nome_representante: $representante}) 
        {
          returning{
            id
          }
        }
      
    }

    """;

    var snapshot = await hasuraConnect.mutation(updateQueryEmpresa());
    /*var snapshot = await hasuraConnect.mutation(mutations, variables: {
      'nome' : nomeEmpresa.text,
      'representante': nomeRepresentante.text
    });*/

    print(snapshot);

    return true;

  }

}