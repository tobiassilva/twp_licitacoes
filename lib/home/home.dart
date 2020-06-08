import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:twp_licitacoes/cadastroOrgao/cadastroOrgao_functions.dart';

import '../globals.dart';

import 'Widgets/home_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  var url;
  HasuraConnect hasuraConnect = HasuraConnect('https://twplicitacoes.herokuapp.com/v1/graphql');

  void initState(){
    requisicoesDropdown().getDadosOrgaos();
    requisicoesDropdown().getDadosTiposOrgaos();
    requisicoesDropdown().getDadosEstados();
    super.initState();

    //recebeLicitacoes();

    //this.convertJson(); ///CHAMAR APENAS QUANDO FOR PRA ADICIONAR OS DADOS NO GRAPHQL
    ///FORA ISSO, IGNORA
  }

  /// IGUINORE DAQUI
  ///
  ///
  Future convertJson() async {
    print('json: ${StringJson().jsonBase}');
    var jsonData = await jsonDecode(StringJson().jsonBase);

    bool cs = await result();

    print('conexao: $cs');

    if (cs == false) {

    } else {
      print('NAO TEM NET CARALHO');
    }

    print('json: ${jsonData['Banco de Dados de Licitações'].length}');
    createState(jsonData);
  }

  ///Verifica conexão com a internet
  ///
  Future<bool> result() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return true;
    } else {
      return false;
    }
  }


  Future<void> createState(jsonData) async {
    print('aaaDDDDDDD');
    for(int i=0; i<jsonData['Banco de Dados de Licitações'].length; i++){
      print('Licitação: $i');
      var data = await hasuraConnect.mutation(
        /*"""
        mutation MyMutation {
          insert_licitacoes(objects: {categoria_de_atividade: "asd", data_e_hora_da_sessao_publica: "asd", data_limite_envio_de_documentos: "asd"}) {
            returning {
              id
            }
          }
        }

      """*/
          query(
              "${jsonData['Banco de Dados de Licitações'][i]['Categoria de Atividade']}",
              "${jsonData['Banco de Dados de Licitações'][i]['Data e hora da sessão pública']}",
              "${jsonData['Banco de Dados de Licitações'][i]['Data limite envio de documentos']}",
              "${jsonData['Banco de Dados de Licitações'][i]['Data limite para CRC órgão']}",
              "${jsonData['Banco de Dados de Licitações'][i]['Edital']}",
              "${jsonData['Banco de Dados de Licitações'][i]['Link']}",
              "${jsonData['Banco de Dados de Licitações'][i]['Modalidade de licitação']}",
              "${jsonData['Banco de Dados de Licitações'][i]['Objeto resumido']}",
              "${jsonData['Banco de Dados de Licitações'][i]['Observações']}",
              "${jsonData['Banco de Dados de Licitações'][i]['Órgão']}",
              "${jsonData['Banco de Dados de Licitações'][i]['Preço estimado']}",
              "${jsonData['Banco de Dados de Licitações'][i]['Situação']}",
              "${jsonData['Banco de Dados de Licitações'][i]['Subcategoria de Atividade']}",
          )
      );


      print(data);
    }

  }

  String query(categoria, dataHora, dataEnvio, dataCRC, edital, link, modalidade, objeto, observacoes, orgao, preco, situacao, subcategoria) {
    return (
        """
        mutation MyMutation {
          insert_licitacoes(objects: {categoria_de_atividade: "$categoria", data_e_hora_da_sessao_publica: "$dataHora", data_limite_envio_de_documentos: "$dataEnvio", data_limite_para_crc_orgao: "$dataCRC", edital: "$edital", link: "$link", modalidade_de_licitacao: "$modalidade", objeto_resumido: "$objeto", observacoes: "$observacoes", orgao: "$orgao", preco_estimado: "$preco", situacao: "$situacao", subcategoria_de_atividade: "$subcategoria"}) {
            returning {
              id
            }
          }
        }

      """
    );
  }

  ///
  /// ATÉ AQUI !!!!!!$$$$$$$$$$$$$44

  var licitacoes;

  Future recebeLicitacoes() async {

    var response = await http.get(url);

    setState(() {
      licitacoes = jsonDecode(response.body);
    });

    //var dataLicitacoes = await jsonDecode(response.body);

    print("licitacoes");
    print(licitacoes.length);
    print(licitacoes["_links"]);
    print(licitacoes["_links"]["first"]);



  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: StyleGlobals().primaryColor,
          title: Text(
            "HOME",
            style: TextStyle(color: StyleGlobals().textColorSecundary),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: StyleGlobals().colorGradiente,
            ),
          ),
          iconTheme: IconThemeData(
            color: StyleGlobals().secundaryColor,
          ),
          centerTitle: true,
        ),
        drawer: customDrawer(),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 30),
                  child: Text('AQUI VAI FICAR A DASHBOARD',
                    style: TextStyle(color: Colors.blue, fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
           
                
                /*ListView.builder(
                    itemCount: licitacoes['_embedded']['licitacoes'].length,
                    itemBuilder: (BuildContext cont, int index){
                      return Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('$index - '),
                              Flexible(
                                  child: Text(
                                      '${licitacoes['_embedded']['licitacoes'][index]['_links']['uasg']['title']}'
                                  )
                              )
                            ],
                          ),
                          Divider(),
                        ],
                      );
                    }
                ),*/
              
          ],
        ),
      ),
    );
  }
}

class StringJsonOrgaos{


  String jsonListaorgaos = '''
  [
 {
   "Órgão": "1",
   "FIELD2": "Câmara Municipal de Baependi/MG"
 },
 {
   "Órgão": "2",
   "FIELD2": "Câmara Municipal de Brazópolis/MG"
 },
 {
   "Órgão": "3",
   "FIELD2": "Câmara Municipal de Cachoeira de Minas/MG"
 },
 {
   "Órgão": "4",
   "FIELD2": "Câmara Municipal de Cambuí/MG "
 },
 {
   "Órgão": "5",
   "FIELD2": "Câmara Municipal de Carmo de Minas/MG"
 },
 {
   "Órgão": "6",
   "FIELD2": "Câmara Municipal de Caxambu /MG"
 },
 {
   "Órgão": "7",
   "FIELD2": "Câmara Municipal de Conceição das Pedras/MG"
 },
 {
   "Órgão": "8",
   "FIELD2": "Câmara Municipal de Conceição dos Ouros/MG"
 },
 {
   "Órgão": "9",
   "FIELD2": "Câmara Municipal de Cristina/MG"
 },
 {
   "Órgão": "10",
   "FIELD2": "Câmara Municipal de Delfim Moreira/MG"
 },
 {
   "Órgão": "11",
   "FIELD2": "Câmara Municipal de Dom Viçoso/MG"
 },
 {
   "Órgão": "12",
   "FIELD2": "Câmara Municipal de Heliodora/MG"
 },
 {
   "Órgão": "13",
   "FIELD2": "Câmara Municipal de Itajubá/MG"
 },
 {
   "Órgão": "14",
   "FIELD2": "Câmara Municipal de Itamonte/MG"
 },
 {
   "Órgão": "15",
   "FIELD2": "Câmara Municipal de Itanhandu/MG"
 },
 {
   "Órgão": "16",
   "FIELD2": "Câmara Municipal de Jaceaba/MG"
 },
 {
   "Órgão": "17",
   "FIELD2": "Câmara Municipal de Lavras/MG"
 },
 {
   "Órgão": "18",
   "FIELD2": "Câmara Municipal de Maria da Fé/MG"
 },
 {
   "Órgão": "19",
   "FIELD2": "Câmara Municipal de Marmelópolis/MG"
 },
 {
   "Órgão": "20",
   "FIELD2": "Câmara Municipal de Natércia  - MG"
 },
 {
   "Órgão": "21",
   "FIELD2": "Câmara Municipal de Ouro Fino/MG"
 },
 {
   "Órgão": "22",
   "FIELD2": "Câmara Municipal de Paraisópolis/MG"
 },
 {
   "Órgão": "23",
   "FIELD2": "Câmara Municipal de Passa Quatro/MG"
 },
 {
   "Órgão": "24",
   "FIELD2": "Câmara Municipal de Pedralva/MG"
 },
 {
   "Órgão": "25",
   "FIELD2": "Câmara Municipal de Piranguçu/MG"
 },
 {
   "Órgão": "26",
   "FIELD2": "Câmara Municipal de Piranguinho/MG"
 },
 {
   "Órgão": "27",
   "FIELD2": "Câmara Municipal de Poços de Caldas - MG"
 },
 {
   "Órgão": "28",
   "FIELD2": "Câmara Municipal de Pouso Alegre/MG"
 },
 {
   "Órgão": "29",
   "FIELD2": "Câmara Municipal de Pouso Alto/MG"
 },
 {
   "Órgão": "30",
   "FIELD2": "Câmara Municipal de Santa Rita do Sapucaí/MG"
 },
 {
   "Órgão": "31",
   "FIELD2": "Câmara Municipal de São José do Alegre/MG"
 },
 {
   "Órgão": "32",
   "FIELD2": "Câmara Municipal de São Lourenço/MG"
 },
 {
   "Órgão": "33",
   "FIELD2": "Câmara Municipal de São Sebastião da Bela Vista/MG"
 },
 {
   "Órgão": "34",
   "FIELD2": "Câmara Municipal de São Sebastião do Rio Verde/MG"
 },
 {
   "Órgão": "35",
   "FIELD2": "Câmara Municipal de São Tomé das Letras/MG"
 },
 {
   "Órgão": "36",
   "FIELD2": "Câmara Municipal de Uberaba/MG"
 },
 {
   "Órgão": "37",
   "FIELD2": "Câmara Municipal de Varginha/MG"
 },
 {
   "Órgão": "38",
   "FIELD2": "Câmara Municipal de Virgínia/MG"
 },
 {
   "Órgão": "39",
   "FIELD2": "Câmara Municipal de Wenceslau Braz/MG"
 },
 {
   "Órgão": "40",
   "FIELD2": "CODANORTE - Consórcio Intermunicipal para o Desenvolvimento Sustentável do Norte de Minas "
 },
 {
   "Órgão": "41",
   "FIELD2": "DNIT - Departamento Nacional de Infra-Estrutura de Transportes"
 },
 {
   "Órgão": "42",
   "FIELD2": "Jaceaba/MG (Prefeitura)"
 },
 {
   "Órgão": "43",
   "FIELD2": "João Pinheiro/MG (Câmara)"
 },
 {
   "Órgão": "44",
   "FIELD2": "Natércia - MG (Prefeitura)"
 },
 {
   "Órgão": "45",
   "FIELD2": "Prefeitura Municipal de  Cambuí/MG"
 },
 {
   "Órgão": "46",
   "FIELD2": "Prefeitura Municipal de Baependi/MG"
 },
 {
   "Órgão": "47",
   "FIELD2": "Prefeitura Municipal de Borda da Mata/MG"
 },
 {
   "Órgão": "48",
   "FIELD2": "Prefeitura Municipal de Brazópolis/MG"
 },
 {
   "Órgão": "49",
   "FIELD2": "Prefeitura Municipal de Cachoeira de Minas/MG"
 },
 {
   "Órgão": "50",
   "FIELD2": "Prefeitura Municipal de Carmo de Minas/MG"
 },
 {
   "Órgão": "51",
   "FIELD2": "Prefeitura Municipal de Caxambu/íMG "
 },
 {
   "Órgão": "52",
   "FIELD2": "Prefeitura Municipal de Conceição das Pedras/MG"
 },
 {
   "Órgão": "53",
   "FIELD2": "Prefeitura Municipal de Conceição dos Ouros/MG"
 },
 {
   "Órgão": "54",
   "FIELD2": "Prefeitura Municipal de Congonhal/M"
 },
 {
   "Órgão": "55",
   "FIELD2": "Prefeitura Municipal de Cristina/MG"
 },
 {
   "Órgão": "56",
   "FIELD2": "Prefeitura Municipal de Delfim Moreira/MG"
 },
 {
   "Órgão": "57",
   "FIELD2": "Prefeitura Municipal de Dom Viçoso/MG"
 },
 {
   "Órgão": "58",
   "FIELD2": "Prefeitura Municipal de Heliodora/MG"
 },
 {
   "Órgão": "59",
   "FIELD2": "Prefeitura Municipal de Itajubá/MG"
 },
 {
   "Órgão": "60",
   "FIELD2": "Prefeitura Municipal de Itamonte/MG"
 },
 {
   "Órgão": "61",
   "FIELD2": "Prefeitura Municipal de Itanhandu/MG"
 },
 {
   "Órgão": "62",
   "FIELD2": "Prefeitura Municipal de João Pinheiro/MG"
 },
 {
   "Órgão": "63",
   "FIELD2": "Prefeitura Municipal de Lavras/MG"
 },
 {
   "Órgão": "64",
   "FIELD2": "Prefeitura Municipal de Maria da Fé/MG"
 },
 {
   "Órgão": "65",
   "FIELD2": "Prefeitura Municipal de Marmelópolis/MG"
 },
 {
   "Órgão": "66",
   "FIELD2": "Prefeitura Municipal de Ouro Fino/MG"
 },
 {
   "Órgão": "67",
   "FIELD2": "Prefeitura Municipal de Paraisópolis/MG"
 },
 {
   "Órgão": "68",
   "FIELD2": "Prefeitura Municipal de Passa Quatro/MG"
 },
 {
   "Órgão": "69",
   "FIELD2": "Prefeitura Municipal de Pedralva/MG"
 },
 {
   "Órgão": "70",
   "FIELD2": "Prefeitura Municipal de Piranguçu/MG"
 },
 {
   "Órgão": "71",
   "FIELD2": "Prefeitura Municipal de Piranguinho/MG"
 },
 {
   "Órgão": "72",
   "FIELD2": "Prefeitura Municipal de Poços de Caldas/MG"
 },
 {
   "Órgão": "73",
   "FIELD2": "Prefeitura Municipal de Pouso Alegre/MG"
 },
 {
   "Órgão": "74",
   "FIELD2": "Prefeitura Municipal de Pouso Alto/MG"
 },
 {
   "Órgão": "75",
   "FIELD2": "Prefeitura Municipal de Santa Rita do Sapucaí/MG (Câmara)"
 },
 {
   "Órgão": "76",
   "FIELD2": "Prefeitura Municipal de Santa Vitória/MG"
 },
 {
   "Órgão": "77",
   "FIELD2": "Prefeitura Municipal de São José do Alegre/MG"
 },
 {
   "Órgão": "78",
   "FIELD2": "Prefeitura Municipal de São Lourenço/MG"
 },
 {
   "Órgão": "79",
   "FIELD2": "Prefeitura Municipal de São Sebastião da Bela Vista/MG"
 },
 {
   "Órgão": "80",
   "FIELD2": "Prefeitura Municipal de São Sebastião do Rio Verde"
 },
 {
   "Órgão": "81",
   "FIELD2": "Prefeitura Municipal de São Tomé das Letras/MG"
 },
 {
   "Órgão": "82",
   "FIELD2": "Prefeitura Municipal de Uberaba/MG"
 },
 {
   "Órgão": "83",
   "FIELD2": "Prefeitura Municipal de Varginha/MG"
 },
 {
   "Órgão": "84",
   "FIELD2": "Prefeitura Municipal de Virgínia/MG"
 },
 {
   "Órgão": "85",
   "FIELD2": "Prefeitura Municipal de Wenceslau Braz/MG "
 },
 {
   "Órgão": "86",
   "FIELD2": "Secretaria de Infraestrutura e Meio Ambiente da Prefeitura de São Paulo"
 }
]
  ''';

}
class StringJson{


  String jsonBase = '''
  {
    "Banco de Dados de Licitações": [
        {
            "Categoria de Atividade": "Agricultura Familiar e Produtos Rurais",
            "Subcategoria de Atividade": "Serviços Veterinári",
            "Órgão": "Cristina/MG (Prefeitura)",
            "Objeto resumido": "O objeto do presente edital é a seleção de propostas para credenciamento de Associações ou Cooperativas da Agricultura Familiar ou Produtores enquadrados na Agricultura Familiar visando a posterior aquisição de gêneros alimentícios para atender aos alunos matriculados na Rede Pública de Ensino, em conformidade com o Programa Nacional de Alimentação Escolar PNAE e Programa de Alimentação Escolar da Prefeitura Municipal de Cristina.",
            "Data e hora da sessão pública ": "19/12 às 9:30 horas",
            "Modalidade de licitação": "Dispensa",
            "Edital": "25/19",
            "Link": "https://www.cristina.mg.gov.br/docs/anexos_licitacao/9975dcc63714f91d1f37efbf86409395.pdf",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's"
        },
        {
            "Categoria de Atividade": "Papelaria, Material de Escritório e Material Escolar",
            "Órgão": "Cristina/MG (Prefeitura)",
            "Objeto resumido": "Contratação de Microempresas ME, empresas de pequeno porte – EPP ou equiparadas, para aquisição de Materiais escolares e de Escritório, com fornecimento de amostras, em atendimento a Secretaria Municipal de Educação da Prefeitura.",
            "Data e hora da sessão pública ": "17/12 às 9:30 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "38/19",
            "Link": "https://www.cristina.mg.gov.br/licitacoes",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's"
        },
        {
            "Categoria de Atividade": "Pavimentação e Qualificação Urbana",
            "Órgão": "Cristina/MG (Prefeitura)",
            "Objeto resumido": "Prestação de Serviços de Engenharia, por empreitada por preço global, para a realização de Calçamento em Bloquete e=8cm fck 35mpa de 1.554,00 m2, execução de 835,00m de meio fio de concreto pré moldado tipo A e 740,00m de sarjeta de concreto tipo 1 – 40x8cm i=15%, em trecho da estrada Vicinal de ligação ao bairro beleza, em atendimento ao Convênio de Saída nº 1491 000 278/2019/SEGOV/PADEM, conforme solicitado pela Secretaria de Obras, Viação e Serviços Urbanos.",
            "Data e hora da sessão pública ": "12/12 às 9:30 horas",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "03/2019",
            "Link": "https://www.cristina.mg.gov.br/licitacao/edital/405",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Pavimentação e Qualificação Urbana",
            "Órgão": "Itajubá/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA PARA PRESTAÇÃO DE SERVIÇOS DE PAVIMENTAÇÃO E QUALIFICAÇÃO VIÁRIA DE VIAS PÚBLICAS NO MUNICIPIO DE ITAJUBA/MG,",
            "Data e hora da sessão pública ": "12/12 às 14 horas",
            "Modalidade de licitação": "Concorrência",
            "Edital": "06/19",
            "Link": "http://www.itajuba.mg.gov.br/wp-content/uploads/2019/11/CP_06-_19.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Veículos Automóveis, Peças, Manutenção de Automóveis e Motocicletas",
            "Órgão": "Marmelópolis/MG (Prefeitura)",
            "Objeto resumido": "Aquisição de combustível - óleo diesel S10 e gasolina automotiva comum para eventual e futura entrega, com fornecimentos parcelados para atender aos serviços da administração municipal, para inscrição em ATA DE REGISTRO DE PREÇOS",
            "Data e hora da sessão pública ": "17/12 às 10:00 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "71/19",
            "Link": "http://www.marmelopolis.mg.gov.br/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Veículos Automóveis, Peças, Manutenção de Automóveis e Motocicletas",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "Aquisição de óleo lubrificante, fluidos e graxa.",
            "Data e hora da sessão pública ": "09/12 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "111/19",
            "Link": "http://www.pousoalegre.mg.gov.br/licitacao_downloads.asp?id=1117&idusuario=1&ida=2889&nomearq=Pregao%20111-2019%20-%20Aquisi%C3%A7%C3%A3o%20de%20oleo%20lubrificantes,%20fluidos%20e%20graxas.pdf&numarq=111/2019",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Material de Construção",
            "Órgão": "Marmelópolis/MG (Prefeitura)",
            "Objeto resumido": "Aquisição de materiais de construção para doação às famílias carentes do município",
            "Data e hora da sessão pública ": "11/12 às 10 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "73/19",
            "Link": "http://www.marmelopolis.mg.gov.br/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Veículos Automóveis, Peças, Manutenção de Automóveis e Motocicletas",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "LOCAÇÃO DE CAMINHÃO BASCULANTE COM CAPACIDADE DA CAÇAMBA DE NO MÍNIMO 14M³, COM MOTORISTA",
            "Data e hora da sessão pública ": "02/12 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "106/19",
            "Link": "http://www.pousoalegre.mg.gov.br/licitacao_downloads.asp?id=1106&idusuario=1&ida=2865&nomearq=Pregao%20106-2019%20-%20Loca%C3%A7ao%20de%20caminhao%20basculante.pdf&numarq=106/2019",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Veículos Automóveis, Peças, Manutenção de Automóveis e Motocicletas",
            "Órgão": "Pedralva/MG (Prefeitura)",
            "Objeto resumido": "aquisição de um veículo ônibus e um veículo micro-ônibus usados para atender o Transporte Escolar do Ensino Fundamental.",
            "Data e hora da sessão pública ": "13/12 às 9 horas",
            "Modalidade de licitação": "Carta convite",
            "Edital": "03/19",
            "Link": "https://www.pedralva.mg.gov.br/docs/anexos_licitacao/3b4d6cf8e82d34ca2cf13dd87771d58b.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Material e Serviços Médicos-Hospitalares",
            "Órgão": "Piranguçu/MG (Prefeitura)",
            "Objeto resumido": "Registro de preços para futura e eventual aquisição de material medico hospitalar para atender as necessidades da secretaria de saúde desta Prefeitura, conforme descrição, especificação e condições previstas neste edital e seus anexos.",
            "Data e hora da sessão pública ": "12/12 às 8:30 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "54/19",
            "Link": "https://www.pirangucu.mg.gov.br/portal/editais/1",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Papelaria, Material de Escritório e Material Escolar",
            "Órgão": "Maria da Fé/MG (Prefeitura)",
            "Objeto resumido": "melhor proposta para aquisição de Sistema Estruturado de Ensino para professores e alunos da Educação Infantil, Ensino Fundamental I (Anos Iniciais) e Ensino Fundamental II (Anos Finais)",
            "Data e hora da sessão pública ": "07/01/2020 às 9 horas",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "06/19",
            "Link": "https://www.mariadafe.mg.gov.br/docs/anexos_licitacao/de9b5fbd1a0edae894fb20b0ea1b80af.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Obras e Material de Construção",
            "Órgão": "Maria da Fé/MG (Prefeitura)",
            "Objeto resumido": "Futuras e eventuais locações de caminhões e máquinas para uso geral da Secretaria Municipal de Obras e Vias Públicas",
            "Data e hora da sessão pública ": "18/12 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "29/19",
            "Link": "https://www.mariadafe.mg.gov.br/docs/anexos_licitacao/32cc017b212fd69aa7b2febe1c977d22.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Vestuário e Uniformes",
            "Órgão": "Itajubá/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇOS PARA AQUISIÇÃO DE UNIFORMES PARA ATENDER AO DEPARTAMENTO DE TRÂNSITO DE ITAJUBÁ - SEMDS",
            "Data e hora da sessão pública ": "12/12 às 14 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "131/19",
            "Link": "http://www.itajuba.mg.gov.br/wp-content/uploads/2019/11/pp_131_19_srp_aq_uniformes_semds.pdf",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's"
        },
        {
            "Categoria de Atividade": "Veterinário e Rações",
            "Órgão": "Itajubá/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇOS PARA AQUISIÇÃO DE RAÇÃO PARA CÃES - SEMDS E SEMSA",
            "Data e hora da sessão pública ": "11/12 às 14 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "130/19",
            "Link": "http://diariooficial.itajuba.mg.gov.br/upload/res%20pp%20130%2019%20-%20srp%20aq%20racao%20-%20semds%20e%20semsa.pdf",
            "Situação": "Cancelada",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Posto de Gasolina",
            "Órgão": "Cristina/MG (Prefeitura)",
            "Objeto resumido": "aquisição de Combustíveis para a abastecimento da frota de veículos e maquinários",
            "Data e hora da sessão pública ": "18/12 às 9:30 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "39/19",
            "Link": "https://www.cristina.mg.gov.br/docs/anexos_licitacao/1ae275ce90f8c9eee7157718247f2394.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Aluguel de Som e Palco para Festa",
            "Órgão": "Cambuí/MG (Prefeitura)",
            "Objeto resumido": "Registro de preços para contratação de empresa para locação de palco, som, iluminação, tendas e estrutura para atender a demanda de eventos do Município de Cambuí - MG",
            "Data e hora da sessão pública ": "12/12 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "118/19",
            "Link": "http://www.prefeituradecambui.mg.gov.br/wp-content/uploads/2019/12/Preg118_RP_Som_Palco_Tenda_Banheiros.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Aluguel de Som e Palco para Festa",
            "Órgão": "Wenceslau Braz/MG (Prefeitura)",
            "Objeto resumido": "AQUISIÇÃO DE FOGOS DE ARTIFÍCIOS",
            "Data e hora da sessão pública ": "10/12 às 14 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "46/19",
            "Link": "http://www.wenceslaubraz.mg.gov.br/upload_files/282_EDITAL.pdf",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's"
        },
        {
            "Categoria de Atividade": "Informática e Manutenção de Computadores",
            "Órgão": "Wenceslau Braz/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA EM SERVIÇOS DE LOCAÇÃO DE MÁQUINAS COPIADORAS, COM SERVIÇOS DE MANUTENÇÃO TÉCNICA CORRETIVA, FORNECIMENTO E REPOSIÇÃO DE PEÇAS E TONERS",
            "Data e hora da sessão pública ": "12/12 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "47/19",
            "Link": "http://www.wenceslaubraz.mg.gov.br/upload_files/283_Edital.pdf",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's"
        },
        {
            "Categoria de Atividade": "Material e Serviços Médicos-Hospitalares",
            "Órgão": "Wenceslau Braz/MG (Prefeitura)",
            "Objeto resumido": "AQUISIÇÃO DE MEDICAMENTOS",
            "Data e hora da sessão pública ": "17/12 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "48/19",
            "Link": "http://www.wenceslaubraz.mg.gov.br/upload_files/286_EDITAL.pdf",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's"
        },
        {
            "Categoria de Atividade": "Veículos Automóveis, Peças, Manutenção de Automóveis e Motocicletas",
            "Órgão": "São José do Alegre/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇOS PARA FUTURA E EVENTUAL AQUISIÇÃO DE PNEUS, ÓLEOS LUBRIFICANTES, GRAXA, FILTROS E PRODUTOS DE LIMPEZA PARA MANUTENÇÃO DOS VEÍCULOS E MÁQUINAS DA FROTA DA PREFEITURA MUNICIPAL E CONVENIADOS - EXCLUSIVAMENTE PARA ME E EPP.",
            "Data e hora da sessão pública ": "16/12/2019 às 14h e 15min.",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "30/19",
            "Link": "https://www.saojosedoalegre.mg.gov.br/docs/anexos_licitacao/3db3c67844245c6e81f419190207bf6c.pdf?1575605260",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's"
        },
        {
            "Categoria de Atividade": "Alimentação, Coffee Break e Buffet",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "AQUISIÇÃO DE GÊNEROS ALIMENTÍCIOS PARA ATENDER AS NECESSIDADES DE TODOS OS SETORES DA PREFEITURA MUNICIPAL DE POUSO ALEGRE",
            "Data e hora da sessão pública ": "18/12/2019|09:00",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "126/2019",
            "Link": "http://www.pousoalegre.mg.gov.br/licitacao_downloads.asp?id=1131&idusuario=1&ida=3107&nomearq=Pregao%20126-2019%20-%20G%C3%AAneros%20aliment%C3%ADcios%20SGRM.pdf&numarq=126/2019",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Veículos Automóveis, Peças, Manutenção de Automóveis e Motocicletas",
            "Órgão": "Itajubá/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇOS PARA AQUISIÇÃO DE VEÍCULO SEDAN PARA ATENDER A SECRETARIA MUNICIPAL DE PLANEJAMENTO",
            "Data e hora da sessão pública ": "20/12 das 15 às 16 horas",
            "Modalidade de licitação": "Pregão eletrônico",
            "Edital": "135/19",
            "Link": "http://diariooficial.itajuba.mg.gov.br/upload/res%20pe%20135%2019%20-%20srp%20aq%20VEICULO%20SEDAN.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA NA PRESTAÇÃO DE SERVIÇOS DE ENGENHARIA PARA A EXECUÇÃO DE OBRA DE REFORMA E AMPLIAÇÃO NO IMÓVEL DA PREFEITURA MUNICIPAL DE POUSO ALEGRE ONDE FUNCIONA A PRÉ-ESCOLA MUNICIPAL MONSENHOR MENDONÇA, LOCALIZADA NA PRAÇA",
            "Data e hora da sessão pública ": "19/12/2019|14:00",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "11/12",
            "Link": "http://www.pousoalegre.mg.gov.br/arquivos/licitacao/TOMADA%20DE%20PRE%C3%87OS%20N%C2%BA%2011-19%20MONSENHOR%20MENDON%C3%87A.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Obras e Material de Construção",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA NA PRESTAÇÃO DE SERVIÇOS DE ENGENHARIA PARA A EXECUÇÃO DE OBRA DE REFORMA E AMPLIAÇÃO NO IMÓVEL DA PREFEITURA MUNICIPAL DE POUSO ALEGRE ONDE FUNCIONA A PRÉ-ESCOLA MUNICIPAL MONSENHOR MENDONÇA, LOCALIZADA NA PRAÇA",
            "Data e hora da sessão pública ": "19/12/2019|14:00",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "11/12",
            "Link": "http://www.pousoalegre.mg.gov.br/arquivos/licitacao/TOMADA%20DE%20PRE%C3%87OS%20N%C2%BA%2011-19%20MONSENHOR%20MENDON%C3%87A.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Obras e Material de Construção",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESAS ESPECIALIZADAS PARA REFORMAS E AMPLIAÇÕES NAS ESCOLAS MUNICIPAIS: DOUTOR ÂNGELO CÔNSOLI E TEREZINHA BARROSO HARDY E AS CRECHES MUNICIPAIS: LÁZARA DIANI CASARINI E MEYRE APARECIDA DE PINHO",
            "Data e hora da sessão pública ": "20/12/2019|09:00",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "12/19",
            "Link": "http://www.pousoalegre.mg.gov.br/arquivos/licitacao/TOMADA%20DE%20PRE%C3%87OS%20N%2012-2019%20ANGELO%20TEREZINHA%20LAZARA%20MEYRE.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Obras e Material de Construção",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "Contratação de empresa especializada na prestação de serviços de engenharia para a execução de obra de ampliação de 04 (quatro) salas no imóvel da Prefeitura Municipal de Pouso Alegre onde funciona a escola Jandyra Tosta de Souza",
            "Data e hora da sessão pública ": "19/12/2019|09:00",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "10/19",
            "Situação": "Suspenso",
            "Observações": "Suspenso"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "Contratação de empresa especializada na prestação de serviços de engenharia para a execução de obra de ampliação de 04 (quatro) salas no imóvel da Prefeitura Municipal de Pouso Alegre onde funciona a escola Jandyra Tosta de Souza",
            "Data e hora da sessão pública ": "19/12/2019|09:00",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "10/19",
            "Situação": "Suspenso",
            "Observações": "Suspenso"
        },
        {
            "Categoria de Atividade": "Obras e Material de Construção",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "AQUISIÇÃO DE PRODUTOS PARA A MANUTENÇÃO DAS PISCINAS DA PRAÇA DE ESPORTES MUNICIPAL (PREFEITO ALVARIM VIEIRA RIOS)",
            "Data e hora da sessão pública ": "17/12/2019|09:00",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "115/2019",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Material e Serviços Médicos-Hospitalares",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "AQUISIÇÃO DE EQUIPAMENTOS PARA SUPRIR AS NECESSIDADES DO LABORATÓRIO MUNICIPAL DA SECRETARIA MUNICIPAL DE SAÚDE DE POUSO ALEGRE",
            "Data e hora da sessão pública ": "17/12/2019|14:00",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "117/2019",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Alimentação, Coffee Break e Buffet",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "AQUISIÇÃO DE REFEIÇÕES EM MARMITEX",
            "Data e hora da sessão pública ": "17/12/2019|09:00",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "125/2019",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Material e Serviços Médicos-Hospitalares",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "AQUISIÇÃO DE PRODUTOS, EQUIPAMENTOS E INSUMOS MÉDICO-HOSPITALARES",
            "Data e hora da sessão pública ": "17/12/2019|14:00",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "131/2019",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Publicidade e Propaganda",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "Contratação de empresa especializada para fornecimento de sistema de geração, transmissão e gravação de imagens, incluindo os serviços de instalação, treinamento de usuários e configurações necessárias, manutenção e suporte técnico",
            "Data e hora da sessão pública ": "19/12/2019|14:00",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "116/2019",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Papelaria, Material de Escritório e Material Escolar",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "AQUISIÇÃO DE MATERIAL PEDAGÓGICO PARA OS CEIM´S (CENTROS DE EDUCACÃO INFANTIL MUNICIPAL) E UNIDADES DE ENSINO FUNDAMENTAL (PERÍODO INTEGRAL) PERTENCENTES À SECRETARIA MUNICIPAL DE EDUCAÇÃO E CULTURA DE POUSO ALEGRE/MG",
            "Data e hora da sessão pública ": "18/12/2019|09:00",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "122/2019",
            "Link": "http://www.pousoalegre.mg.gov.br/licitacao_downloads.asp?id=1130&idusuario=1&ida=3106&nomearq=Pregao%20122-2019%20-%20Aquisi%C3%A7%C3%A3o%20de%20Material%20Pedag%C3%B3gico.pdf&numarq=122/2019",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Segurança",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA EM SEGURANÇA ELETRÔNICA E MONITORAMENTO DE ALARMES PARA IMPLANTAÇÃO DE SISTEMA DE VIGILÂNCIA ELETRÔNICA MEDIANTE REGIME DE COMODATO, 24(VINTE E QUATRO) HORAS POR DIA, 07(SETE) DIAS POR SEMANA, CONTÍNUO, INCLUINDO",
            "Data e hora da sessão pública ": "19/12/2019|09:00",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "123/2019",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Eletrodomésticos",
            "Órgão": "Piranguinho/MG (Prefeitura)",
            "Objeto resumido": "A presente licitação tem por objeto a AQUISIÇÃO DE EQUIPAMENTOS/MATERIAIS PERMANENTES PARA ATENDER A SECRETARIA MUNICIPAL DE SAÚDE DO MUNICIPIO DE PIRANGUINHO – RECURSO ORIUNDO DE EMENDA PARLAMENTAR NÚMERO 27550008 CONFORME PROPOSTA 11398.023000/1190 – 01 – MINISTÉRIO DA SAÚDE – EXCLUSIVO PARA ME e EPP- conforme especificações constantes dos Anexos que integram este Edital.",
            "Data e hora da sessão pública ": "12/12/2019 às 13h00",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "67/2019",
            "Link": "https://www.piranguinho.mg.gov.br/portal/editais/1",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para empresas da região"
        },
        {
            "Categoria de Atividade": "Marcenaria e Móveis",
            "Órgão": "Piranguinho/MG (Prefeitura)",
            "Objeto resumido": "A presente licitação tem por objeto a AQUISIÇÃO DE EQUIPAMENTOS/MATERIAIS PERMANENTES PARA ATENDER A SECRETARIA MUNICIPAL DE SAÚDE DO MUNICIPIO DE PIRANGUINHO – RECURSO ORIUNDO DE EMENDA PARLAMENTAR NÚMERO 27550008 CONFORME PROPOSTA 11398.023000/1190 – 01 – MINISTÉRIO DA SAÚDE – EXCLUSIVO PARA ME e EPP- conforme especificações constantes dos Anexos que integram este Edital.",
            "Data e hora da sessão pública ": "12/12/2019 às 13h01",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "67/2019",
            "Link": "https://www.piranguinho.mg.gov.br/portal/editais/1",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para empresas da região"
        },
        {
            "Categoria de Atividade": "Papelaria, Material de Escritório e Material Escolar",
            "Órgão": "Piranguinho/MG (Prefeitura)",
            "Objeto resumido": "A presente licitação tem por objeto a AQUISIÇÃO DE EQUIPAMENTOS/MATERIAIS PERMANENTES PARA ATENDER A SECRETARIA MUNICIPAL DE SAÚDE DO MUNICIPIO DE PIRANGUINHO – RECURSO ORIUNDO DE EMENDA PARLAMENTAR NÚMERO 27550008 CONFORME PROPOSTA 11398.023000/1190 – 01 – MINISTÉRIO DA SAÚDE – EXCLUSIVO PARA ME e EPP- conforme especificações constantes dos Anexos que integram este Edital.",
            "Data e hora da sessão pública ": "12/12/2019 às 13h02",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "67/2019",
            "Link": "https://www.piranguinho.mg.gov.br/portal/editais/1",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para empresas da região"
        },
        {
            "Categoria de Atividade": "Marcenaria e Móveis",
            "Órgão": "Piranguinho/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇOS PARA EVENTUAL E FUTURA AQUISIÇÃO DE EQUIPAMENTOS PERMANENTES E MÓVEIS DE ESCRITÓRIO PARA ATENDER A SECRETARIA DE EDUCAÇÃO, TURISMO, ESPORTE E JUVENTUDE E A DEMANDA DAS UNIDADES DE SAÚDE E O CENTRO DE CONVIVÊNCIA DO MUNICÍPIO DE PIRANGUINHO – EXCLUSIVO PARA ME, EPP - conforme especificações constantes dos Anexos que integram este Edital.",
            "Data e hora da sessão pública ": "16/12/2019 às 13h00",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "70/19",
            "Link": "https://www.piranguinho.mg.gov.br/portal/editais/1",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Eletrodomésticos",
            "Órgão": "Piranguinho/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇOS PARA EVENTUAL E FUTURA AQUISIÇÃO DE EQUIPAMENTOS PERMANENTES E MÓVEIS DE ESCRITÓRIO PARA ATENDER A SECRETARIA DE EDUCAÇÃO, TURISMO, ESPORTE E JUVENTUDE E A DEMANDA DAS UNIDADES DE SAÚDE E O CENTRO DE CONVIVÊNCIA DO MUNICÍPIO DE PIRANGUINHO – EXCLUSIVO PARA ME, EPP - conforme especificações constantes dos Anexos que integram este Edital.",
            "Data e hora da sessão pública ": "16/12/2019 às 13h01",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "70/19",
            "Link": "https://www.piranguinho.mg.gov.br/portal/editais/1",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Papelaria, Material de Escritório e Material Escolar",
            "Órgão": "Piranguinho/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇOS PARA EVENTUAL E FUTURA AQUISIÇÃO DE EQUIPAMENTOS PERMANENTES E MÓVEIS DE ESCRITÓRIO PARA ATENDER A SECRETARIA DE EDUCAÇÃO, TURISMO, ESPORTE E JUVENTUDE E A DEMANDA DAS UNIDADES DE SAÚDE E O CENTRO DE CONVIVÊNCIA DO MUNICÍPIO DE PIRANGUINHO – EXCLUSIVO PARA ME, EPP - conforme especificações constantes dos Anexos que integram este Edital.",
            "Data e hora da sessão pública ": "16/12/2019 às 13h02",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "70/19",
            "Link": "https://www.piranguinho.mg.gov.br/portal/editais/1",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Material e Serviços Médicos-Hospitalares",
            "Órgão": "Piranguinho/MG (Prefeitura)",
            "Objeto resumido": "A presente licitação tem por objeto EDITAL DE REGISTRO DE PREÇOS PARA EVENTUAIS E FUTURAS AQUISIÇÕES DE MEDICAMENTOS PARA MANUTENÇÃO DO DISPENSÁRIO DAS UNIDADES BÁSICAS DE SAÚDE DO MUNICÍPIO DE PIRANGUINHO, com observância das resoluções CMED nº 02/2004, 04/2006 e 03/2011 no que tange ao preço de fábrica – PF, para compras públicas. conforme especificações constantes dos Anexos que integram este Edital.",
            "Data e hora da sessão pública ": "07/01/20",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "68/19",
            "Link": "https://www.piranguinho.mg.gov.br/portal/editais/1",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Obras e Material de Construção",
            "Órgão": "Brazópolis/MG (Câmara)",
            "Objeto resumido": "egistro de preços para futura e eventual contratação de empresa especializada em serviços de mão de obra de pedreiro, servente, pintor, jardineiro, carpinteiro, eletricista e outros, conforme descrito no termo de referência do edital",
            "Data e hora da sessão pública ": "12/12 às 13:30 horas",
            "Modalidade de licitação": "Pregão eletrônico",
            "Edital": "70/19",
            "Link": "https://www.brazopolis.mg.gov.br/pdf/Licitacao/pregaoPresencial/2019/processo_licitatorio_106_2019.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Publicidade e Propaganda",
            "Órgão": "Brazópolis/MG (Câmara)",
            "Objeto resumido": "contratação de empresa especializada em multimídia, produção autovisual, gestão do site e das redes sociais (Instagram e Facebook) do Municipio, conforme termo de referencia do edital.",
            "Data e hora da sessão pública ": "12/12 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "71/19",
            "Link": "https://www.brazopolis.mg.gov.br/pdf/Licitacao/pregaoPresencial/2019/processo_licitatorio_107_2019.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Consultoria Empresarial, Auditoria ou Assessoria Jurídica",
            "Órgão": "Brazópolis/MG (Câmara)",
            "Objeto resumido": "contratação de empresa especializada em multimídia, produção autovisual, gestão do site e das redes sociais (Instagram e Facebook) do Municipio, conforme termo de referencia do edital.",
            "Data e hora da sessão pública ": "12/12 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "71/19",
            "Link": "https://www.brazopolis.mg.gov.br/pdf/Licitacao/pregaoPresencial/2019/processo_licitatorio_107_2019.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Filmagem e Fotografia",
            "Órgão": "Brazópolis/MG (Câmara)",
            "Objeto resumido": "contratação de empresa especializada em multimídia, produção autovisual, gestão do site e das redes sociais (Instagram e Facebook) do Municipio, conforme termo de referencia do edital.",
            "Data e hora da sessão pública ": "12/12 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "71/19",
            "Link": "https://www.brazopolis.mg.gov.br/pdf/Licitacao/pregaoPresencial/2019/processo_licitatorio_107_2019.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Internet e Telefonia",
            "Órgão": "Brazópolis/MG (Câmara)",
            "Objeto resumido": "ontratação de empresa especializada para fornecimento de equipamentos, materiais, acessórios, infraestrutura e serviços para implantação de sistema de repetição de sinal de celular wcdma em atendimento ao bairro Cruz Vera, conforme termo de referência do edital",
            "Data e hora da sessão pública ": "13/12 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "72/19",
            "Link": "https://www.brazopolis.mg.gov.br/pdf/Licitacao/pregaoPresencial/2019/processo_licitatorio_108_2019.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Papelaria, Material de Escritório e Material Escolar",
            "Órgão": "Brazópolis/MG (Câmara)",
            "Objeto resumido": "registro de preços para futura e eventual aquisição de materiais didático pedagógicos e de expediente para uso das diversas secretarias do município de Brazópolis/MG",
            "Data e hora da sessão pública ": "16/12 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "73/19",
            "Link": "https://www.brazopolis.mg.gov.br/pdf/Licitacao/pregaoPresencial/2019/processo_licitatorio_109_2019.pdf",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's"
        },
        {
            "Categoria de Atividade": "Limpeza, Faxina e Higiene",
            "Órgão": "Itajubá/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA PARA PRESTAÇÃO DE SERVIÇOS DE CONSERVAÇÃO, MANUTENÇÃO, LIMPEZA E REPARAÇÃO DAS EDIFICAÇÕES DOS PRÉDIOS PÚBLICOS ESCOLARES - SEMED",
            "Data e hora da sessão pública ": "até 17/01/20 às 13:45 horas",
            "Modalidade de licitação": "Concorrência",
            "Edital": "07/19",
            "Link": "http://diariooficial.itajuba.mg.gov.br/upload/cp%2007%2019%20-%20MANUTENCAO%20DE%20PREDIOS%20ESCOLARES%20-%20SEMED.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Segurança",
            "Órgão": "Itajubá/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇO PARA AQUISIÇÃO DE COLETES BALISTICOS E CAPAS DE COLETES PARA ATENDER A GUARDA MUNICIPAL – SEMDS.",
            "Data e hora da sessão pública ": "09/01/20 às 14 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "123/19",
            "Link": "http://www.itajuba.mg.gov.br/wp-content/uploads/2019/11/pp_123_19_srp_aq_coletes_balisticos_semds.pdf",
            "Situação": "Suspenso",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Alimentação, Coffee Break e Buffet",
            "Órgão": "Cambuí/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇOS, OBJETIVANDO A FUTURA OU EVENTUAL AQUISIÇÃO DE MARMITEX PARA ATENDER A DEMANDA DE DIVERSAS REPARTIÇÕES MUNICIPAIS, EM CONFORMIDADE COM O TERMO DE REFERÊNCIA",
            "Data e hora da sessão pública ": "18/12 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "117/19",
            "Link": "http://www.prefeituradecambui.mg.gov.br/wp-content/uploads/2019/11/Preg117_RP_Marmitex.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Alimentação, Coffee Break e Buffet",
            "Órgão": "Wenceslau Braz/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇOS PARA AQUISIÇÃO DE GÊNEROS ALIMENTÍCIOS PARA A MERENDA DAS ESCOLAS MUNICIPAIS E CRECHE MUNICIPAL, PARTICIPAÇÃO EXCLUSIVA DE MICROEMPRESAS – ME, EMPRESAS DE PEQUENO PORTE – EPP E MICROEMPREENDEDOR INDIVIDUAL – MEI.",
            "Data e hora da sessão pública ": "08/01/20 às 09 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "49/12",
            "Link": "http://www.wenceslaubraz.mg.gov.br/upload_files/287_PREG%C3%83O.pdf",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's"
        },
        {
            "Categoria de Atividade": "Rádio, Jornal e Televisão",
            "Órgão": "Wenceslau Braz/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE MICROEMPRESAS – ME, EMPRESAS DE PEQUENO PORTE – EPP OU MICROEMPREENDEDOR INDIVIDUAL – ME, PARA PUBLICAÇÕES EM JORNAL DE CIRCULAÇÃO REGIONAL DE MATÉRIAS LEGAIS DO MUNICÍPIO DE WENCESLAU BRAZ/MG",
            "Data e hora da sessão pública ": "10/01 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "50/29",
            "Link": "http://www.wenceslaubraz.mg.gov.br/upload_files/288_EDITAL.pdf",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's e para empresas da região"
        },
        {
            "Categoria de Atividade": "Arquitetura e Urbanismo",
            "Órgão": "Maria da Fé/MG (Prefeitura)",
            "Objeto resumido": "Prestação de serviços de confecção de mosaico, com fornecimento total de material e mão de obra, em atendimento a Secretaria Municipal de Cultura e Turismo",
            "Data e hora da sessão pública ": "20/12 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "30/19",
            "Link": "https://www.mariadafe.mg.gov.br/transparencia/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "Maria da Fé/MG (Prefeitura)",
            "Objeto resumido": "Prestação de serviços de confecção de mosaico, com fornecimento total de material e mão de obra, em atendimento a Secretaria Municipal de Cultura e Turismo",
            "Data e hora da sessão pública ": "20/12 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "30/19",
            "Link": "https://www.mariadafe.mg.gov.br/transparencia/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Veículos Automóveis, Peças, Manutenção de Automóveis e Motocicletas",
            "Órgão": "Maria da Fé/MG (Prefeitura)",
            "Objeto resumido": "futura e eventual aquisição de COMBUSTÍVEIS AUTOMOTIVOS, sendo eles: diesel S-10, diesel S-500, gasolina comum e etanol comum, para os veículos da frota da Prefeitura Municipal, para o exercício de 2019,",
            "Data e hora da sessão pública ": "06/01 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "31/19",
            "Link": "https://www.mariadafe.mg.gov.br/transparencia/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Alimentação, Coffee Break e Buffet",
            "Órgão": "Maria da Fé/MG (Prefeitura)",
            "Objeto resumido": "O objeto da presente Chamada Pública é a aquisição de gêneros alimentícios da Agricultura Familiar e do Empreendedor Familiar Rural para o atendimento ao Programa Nacional de Alimentação Escolar – PNAE, conforme especificações e quantidades relacionadas no Anexo I, que faz parte integrante deste Edital.",
            "Data e hora da sessão pública ": "15/01 às 9 horas",
            "Modalidade de licitação": "Dispensa",
            "Edital": "51/19",
            "Link": "https://www.mariadafe.mg.gov.br/transparencia/licitacoes",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para Agricultura Familiar e Empreendedor Rural"
        },
        {
            "Categoria de Atividade": "Veículos Automóveis, Peças, Manutenção de Automóveis e Motocicletas",
            "Órgão": "Piranguinho/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇOS PARA EVENTUAL E FUTURA CONTRATAÇÃO DE SERVIÇO DE BORRACHARIA E REMOÇÃO DE VEÍCULOS DA FROTA MUNICIPAL NO PERÍMETRO URBANO E RURAL PARA ATENDER A SECRETARIA DE GOVERNO E AGRICULTURA – EXCLUSIVO PARA ME, EPP e MEI, conforme especificações constantes dos Anexos que integram este Edital.",
            "Data e hora da sessão pública ": "09/01/2020 às 13h00",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "71/19",
            "Link": "https://www.piranguinho.mg.gov.br/portal/editais/1",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Papelaria, Material de Escritório e Material Escolar",
            "Órgão": "Piranguinho/MG (Prefeitura)",
            "Objeto resumido": "EDITAL DE REGISTRO DE PREÇOS PARA EVENTUAL E FUTURA AQUISIÇÃO DE EQUIPAMENTOS PERMANENTES PARA ATENDER A SECRETARIA DE EDUCAÇÃO, TURISMO, ESPORTE E JUVENTUDE REFERENTE COMPRA PARA CENTRO DE ATENDIMENTO ESPECIALIZADO MULTIPROFISSIONAL BENEDITO LISBOA MOTA DO MUNICÍPIO DE PIRANGUINHO – EXCLUSIVO PARA ME, EPP - conforme especificações constantes dos Anexos que integram este Edital.",
            "Data e hora da sessão pública ": "20/12/2019 às 10h00",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "72/19",
            "Link": "https://www.piranguinho.mg.gov.br/portal/editais/1",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's e para empresas da região"
        },
        {
            "Categoria de Atividade": "Marcenaria e Móveis",
            "Órgão": "Piranguinho/MG (Prefeitura)",
            "Objeto resumido": "EDITAL DE REGISTRO DE PREÇOS PARA EVENTUAL E FUTURA AQUISIÇÃO DE EQUIPAMENTOS PERMANENTES PARA ATENDER A SECRETARIA DE EDUCAÇÃO, TURISMO, ESPORTE E JUVENTUDE REFERENTE COMPRA PARA CENTRO DE ATENDIMENTO ESPECIALIZADO MULTIPROFISSIONAL BENEDITO LISBOA MOTA DO MUNICÍPIO DE PIRANGUINHO – EXCLUSIVO PARA ME, EPP - conforme especificações constantes dos Anexos que integram este Edital.",
            "Data e hora da sessão pública ": "20/12/2019 às 10h00",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "72/19",
            "Link": "https://www.piranguinho.mg.gov.br/portal/editais/1",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's e para empresas da região"
        },
        {
            "Categoria de Atividade": "Farmácia e Manipulação",
            "Órgão": "Piranguinho/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇOS PARA EVENTUAL E FUTURA CONTRATAÇÃO DE FARMÁCIA PARA FORNECIMENTO DE MEDICAMENTOS AOS SERVIDORES PUBLICOS DO MUNICÍPIO DE PIRANGUINHO PARA ATENDER A LEI MUNICIPAL 1.158/2010 E O DECRETO nº 068/2018 – PARA MEDICAMENTOS CONSTANTES NA TABELA CMED – GENÉRICOS, SIMILARES E REFERÊNCIA - EXCLUSIVO PARA ME E EPP. conforme especificações constantes dos Anexos que integram este Edital.",
            "Data e hora da sessão pública ": "20/12/2019 às 09h00",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "74/19",
            "Link": "https://www.piranguinho.mg.gov.br/portal/editais/1",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's e para empresas da região"
        },
        {
            "Categoria de Atividade": "Farmácia e Manipulação",
            "Órgão": "Piranguinho/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇOS PARA CONTRATAÇÃO E FARMÁCIA PARA FORNECIMENTO DE MEDICAMENTOS GENÉRICOS – COM MAIOR DESCONTO NA TABELA CMED PREÇO FÁBRICA - DESTINADOS EXCLUSIVAMENTE A USUÁRIOS DO SUS DA CIDADE DE PIRANGUINHO, SENDO PACIENTES EM SITUAÇÃO GRAVE, RISCO DE VIDA, EMERGENCIAIS ASSISTIDOS OU COM LAUDO DA ASSISTÊNCIA SOCIAL OU POR ORDEM JUDICIAL. PARA MEDICAMENTOS QUE NÃO CONSTAM NO PROCESSO LICITATÓRIO DA SECRETARIA DE SAÚDE OU NÃO POSSUA EM ESTOQUE, NEM EM ATAS DE REGISTRO DE PREÇOS – EXCLUSIVO PARA ME, EPP e MEI. conforme especificações constantes dos Anexos que integram este Edital.",
            "Data e hora da sessão pública ": "20/12/2019 às 08h00",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "73/19",
            "Link": "https://www.piranguinho.mg.gov.br/portal/editais/1",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's e para empresas da região"
        },
        {
            "Categoria de Atividade": "Gás e Energia",
            "Órgão": "Piranguinho/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇOS PARA EVENTUAL E FUTURA AQUISIÇÃO DE RECARGA DE GÁS DE COZINHA 13KG E GÊNEROS ALIMENTÍCIOS PARA ATENDER AS DIVERSAS SECRETARIAS DO MUNICÍPIO DE PIRANGUINHO - EXCLUSIVO PARA ME, EPP E MEI, conforme especificações constantes dos Anexos que integram este Edital.",
            "Data e hora da sessão pública ": "18/12/2019 às 13h00",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "69/19",
            "Link": "https://www.piranguinho.mg.gov.br/portal/editais/1",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's e para empresas da região"
        },
        {
            "Categoria de Atividade": "Farmácia e Manipulação",
            "Órgão": "Brazópolis/MG (Câmara)",
            "Objeto resumido": "registro de preços para futura e eventual aquisição de material de esterilização, com comodato no item 18, materiais diversos para saúde e os medicamentos enoxaparina e omeprazol, conforme descrito no termo de referências.",
            "Data e hora da sessão pública ": "18/12 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "74/19",
            "Link": "https://www.brazopolis.mg.gov.br/pdf/Licitacao/pregaoPresencial/2019/processo_licitatorio_110_2019.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Material e Serviços Médicos-Hospitalares",
            "Órgão": "Brazópolis/MG (Câmara)",
            "Objeto resumido": "registro de preços para futura e eventual aquisição de material de esterilização, com comodato no item 18, materiais diversos para saúde e os medicamentos enoxaparina e omeprazol, conforme descrito no termo de referências.",
            "Data e hora da sessão pública ": "18/12 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "74/19",
            "Link": "https://www.brazopolis.mg.gov.br/pdf/Licitacao/pregaoPresencial/2019/processo_licitatorio_110_2019.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "Pedralva/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA PARA MELHORAMENTO DE VIAS PÚBLICAS COM EXECUÇÃO DE OBRAS DE INFRAESTRUTURA URBANA - PAVIMENTAÇÃO EM BLOQUETE DE TRECHOS DAS RUAS BELA VISTA, ESTRADA JABOTICABAL, DOUTOR MACEDO, ESTRADA USINA E “D”, COM FORNECIMENTO DE MATERIAIS E MÃO DE OBRA, CONFORME PROJETO BÁSICO E PLANILHA ORÇAMENTÁRIA.",
            "Data e hora da sessão pública ": "07/01/20 às 9:45 horas",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "04/19",
            "Link": "https://www.pedralva.mg.gov.br/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Pavimentação e Qualificação Urbana",
            "Órgão": "Pedralva/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA PARA MELHORAMENTO DE VIAS PÚBLICAS COM EXECUÇÃO DE OBRAS DE INFRAESTRUTURA URBANA - PAVIMENTAÇÃO EM BLOQUETE DE TRECHOS DAS RUAS BELA VISTA, ESTRADA JABOTICABAL, DOUTOR MACEDO, ESTRADA USINA E “D”, COM FORNECIMENTO DE MATERIAIS E MÃO DE OBRA, CONFORME PROJETO BÁSICO E PLANILHA ORÇAMENTÁRIA.",
            "Data e hora da sessão pública ": "07/01/20 às 9:45 horas",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "04/19",
            "Link": "https://www.pedralva.mg.gov.br/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Veículos Automóveis, Peças, Manutenção de Automóveis e Motocicletas",
            "Órgão": "Pedralva/MG (Prefeitura)",
            "Objeto resumido": "aquisição de 01 (um) veículo micro-ônibus usado",
            "Data e hora da sessão pública ": "19/12 às 9:31 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "75/19",
            "Link": "https://www.pedralva.mg.gov.br/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Transporte e Transporte Escolar",
            "Órgão": "Pedralva/MG (Prefeitura)",
            "Objeto resumido": "contratação de empresa para aquisição de um veículo ônibus e um veículo micro-ônibus usados para atender o Transporte Escolar do Ensino Fundamental",
            "Data e hora da sessão pública ": "13/12 às 9:30 horas",
            "Modalidade de licitação": "Carta convite",
            "Edital": "03/19",
            "Link": "https://www.pedralva.mg.gov.br/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Veículos Automóveis, Peças, Manutenção de Automóveis e Motocicletas",
            "Órgão": "Pedralva/MG (Prefeitura)",
            "Objeto resumido": "contratação de empresa para aquisição de um veículo ônibus e um veículo micro-ônibus usados para atender o Transporte Escolar do Ensino Fundamental",
            "Data e hora da sessão pública ": "13/12 às 9:30 horas",
            "Modalidade de licitação": "Carta convite",
            "Edital": "03/19",
            "Link": "https://www.pedralva.mg.gov.br/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Alimentação, Coffee Break e Buffet",
            "Órgão": "Pedralva/MG (Prefeitura)",
            "Objeto resumido": "Registro de preço para aquisição de cestas básicas para distribuição gratuita aos servidores públicos, nos termos da Lei Municipal nº 1.355/06, de 28/04/06",
            "Data e hora da sessão pública ": "23/12/2019, às 09h31",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "73/19",
            "Link": "https://www.pedralva.mg.gov.br/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Material e Serviços Médicos-Hospitalares",
            "Órgão": "São José do Alegre/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇOS PARA LOCAÇÃO DE CONCENTRADOR DE OXIGÊNIO E RESPIRADOR TRILOGY COM ASPIRADOR DE SECREÇÃO, OXÍMETRO E AMBU (TODOS COM SEUS RESPECTIVOS ACESSÓRIOS) PARA OXIGENOTERAPIA DOMICILIAR",
            "Data e hora da sessão pública ": "20/12/2019 às 14h.",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "29/19",
            "Link": "https://www.saojosedoalegre.mg.gov.br/licitacao/edital/312",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Veículos Automóveis, Peças, Manutenção de Automóveis e Motocicletas",
            "Órgão": "São José do Alegre/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇOS PARA FUTURA E EVENTUAL AQUISIÇÃO DE PNEUS, ÓLEOS LUBRIFICANTES, GRAXA, FILTROS E PRODUTOS DE LIMPEZA PARA MANUTENÇÃO DOS VEÍCULOS E MÁQUINAS DA FROTA DA PREFEITURA MUNICIPAL E CONVENIADOS - EXCLUSIVAMENTE PARA ME E EPP.",
            "Data e hora da sessão pública ": "16/12/2019 às 14h e 15min",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "30/19",
            "Link": "https://www.saojosedoalegre.mg.gov.br/licitacoes",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's"
        },
        {
            "Categoria de Atividade": "Material e Serviços Médicos-Hospitalares",
            "Órgão": "São José do Alegre/MG (Prefeitura)",
            "Objeto resumido": "LOCAÇÃO DE CONCENTRADOR DE OXIGÊNIO, RESPIRADOR TRILOGY, ASPIRADOR DE SECREÇÃO, OXÍMETRO E AMBU (TODOS COM SEUS RESPECTIVOS ACESSÓRIOS) PARA OXIGENOTERAPIA DOMICILIAR, CONFORME PRESCRIÇÃO MÉDICA, COM INSCRIÇÃO EM ATA DE REGISTRO DE PREÇOS - EXCLUSIVAMENTE PARA ME E EPP",
            "Data e hora da sessão pública ": "06/12/2019 às 14h e 15min.",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "29/19",
            "Link": "https://www.saojosedoalegre.mg.gov.br/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Rádio, Jornal e Televisão",
            "Órgão": "São Lourenço/MG (Prefeitura)",
            "Objeto resumido": "Contratação de empresa para prestação de serviço de veiculação de mídia em emissoras de rádio com canal aberto, que sejam geradoras - comerciais e/ou propagandas - com abrangência de frequência FM no município de São Lourenço, para veiculação de peças institucionais do",
            "Data e hora da sessão pública ": "26/12/2019",
            "Modalidade de licitação": "Pregão eletrônico",
            "Edital": "167/19",
            "Link": "https://saolourenco.mg.gov.br/plicitacao.php",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Aluguel de Som e Palco para Festa",
            "Órgão": "São Lourenço/MG (Prefeitura)",
            "Objeto resumido": "Permissão onerosa de espaço público de uso comum, a título precário, por tempo determinado, localizado na Praça Ismael de Souza - Bairro da Estação, para fins de instalação e exploração de brinquedos, para ofertar a Administração Municipal, pela Diretora de Cultura, atividades",
            "Data e hora da sessão pública ": "06/01",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "15/19",
            "Link": "https://saolourenco.mg.gov.br/plicitacao.php",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "São Lourenço/MG (Prefeitura)",
            "Objeto resumido": "Concessão de bem e serviço público, com confecção de projetos de Arquitetura, Estrutural, Eletromecânica e Complementares de Engenharia para recuperação e operação do teleférico da cidade de São Lourenço",
            "Data e hora da sessão pública ": "10/01",
            "Modalidade de licitação": "Concorrência",
            "Edital": "02/19",
            "Link": "https://saolourenco.mg.gov.br/plicitacao.php",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Transporte e Transporte Escolar",
            "Órgão": "São Lourenço/MG (Prefeitura)",
            "Objeto resumido": "selecionar a melhor proposta para a exploração e prestação do Serviço de Transporte Público Coletivo do Município de São Lourenço, mediante concessão",
            "Data e hora da sessão pública ": "14/01/2020",
            "Modalidade de licitação": "Concorrência",
            "Edital": "01/19",
            "Link": "https://saolourenco.mg.gov.br/plicitacao.php",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Posto de Gasolina",
            "Órgão": "São Lourenço/MG (Prefeitura)",
            "Objeto resumido": "Aquisição de combustível para atender aos trabalhos da Administração Municipal durante o exercício de 2020.",
            "Data e hora da sessão pública ": "15/01/2020",
            "Modalidade de licitação": "Pregão eletrônico",
            "Edital": "01/20",
            "Link": "https://saolourenco.mg.gov.br/arquivos/licitacao/03012020134724EditalPE01.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Alimentação, Coffee Break e Buffet",
            "Órgão": "São Lourenço/MG (Câmara)",
            "Objeto resumido": "Fornecimento de Gêneros Alimentícios, Produtos de Padaria, Lanches para os alunos do Projeto Parlamento Jovem e Água Mineral com e sem gás e galão de 20 litros",
            "Data e hora da sessão pública ": "13 de janeiro de 2020 às: 13:00h",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "07/19",
            "Link": "http://www.camarasl.mg.gov.br/v1/download/processos_licitatorios_-_2019/edital_072019.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Veículos Automóveis, Peças, Manutenção de Automóveis e Motocicletas",
            "Órgão": "Marmelópolis/MG (Prefeitura)",
            "Objeto resumido": "Registro de Preços para futura e eventual aquisição de veículos 0 km tipo Van para o transporte escolar, para atender a Secretaria Municipal de Educação.",
            "Data e hora da sessão pública ": "20/12 às 12 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "74/19",
            "Link": "http://www.marmelopolis.mg.gov.br/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Alimentação, Coffee Break e Buffet",
            "Órgão": "Conceição das Pedras/MG (Prefeitura)",
            "Objeto resumido": "Aquisição de pães de sal, pão de queijo, biscoito pipoca de polvilho, pão de hot dog, broa, bolo de ovo, rosca doce,bolo recheado e salgados, para atender diversos setores da Prefeitura de Conceição das Pedras/MG.",
            "Data e hora da sessão pública ": "20/12 às 8 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "41/19",
            "Link": "http://www.conceicaodaspedras.mg.gov.br/docs/anexos_licitacao/32cdcac4188479e17d42ad585f8e2468.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Posto de Gasolina",
            "Órgão": "Conceição das Pedras/MG (Prefeitura)",
            "Objeto resumido": "Aquisição de Gasolina, Etanol e Óleo Diesel S10, para atender as necessidades da frota de veículos da Prefeitura Municipal de Conceição das Pedras e Conveniados, para o exercício 2020.",
            "Data e hora da sessão pública ": "18/12 às 13 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "40/19",
            "Link": "http://www.conceicaodaspedras.mg.gov.br/docs/anexos_licitacao/a9d46f12605bf8980915204381fcf234.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Alimentação, Coffee Break e Buffet",
            "Órgão": "Conceição das Pedras/MG (Prefeitura)",
            "Objeto resumido": "Aquisição de refeições prontas para atender as necessidades da Prefeitura de Conceição das Pedras/MG.",
            "Data e hora da sessão pública ": "18/12/2019 às 08:30h",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "39/19",
            "Link": "http://www.conceicaodaspedras.mg.gov.br/docs/anexos_licitacao/e2912f62d77b36da0596a6ba0d39bf36.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "Piranguinho/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA EM ENGENHARIA  PARA CONSTRUÇÃO DE SALA DE AULA E SANITÁRIOS NO CMEI - NILMARA RENÓ CARNEIRO DO MUNICÍPIO DE PIRANGUINHO",
            "Data e hora da sessão pública ": "08/01 às 13 horas",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "07/19",
            "Link": "www.piranguinho.mg.gov.br",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Papelaria, Material de Escritório e Material Escolar",
            "Órgão": "Varginha - MG (Prefeitura)",
            "Objeto resumido": "Aquisição de divisórias de eucatex",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "208/19",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Material de Construção",
            "Órgão": "Varginha - MG (Prefeitura)",
            "Objeto resumido": "Aquisição de Materiais de uso da construção civil",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "207/19",
            "Link": "http://www.varginha.mg.gov.br/editais-llnovo-gg/688-2019/28500-2019-12-11-18-56-37?format=pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Papelaria, Material de Escritório e Material Escolar",
            "Órgão": "Varginha - MG (Prefeitura)",
            "Objeto resumido": "contratação de programa educacional de reforço escolar incluindo fornecimento de Material Didático específico para alunos com dificuldades na aprendizagem da leitura e da escrita (livro didático do Aluno e do Professor), Assessoria Pedagógica, Avaliações (de entrada e de saída), Animações com Áudios para o aluno ouvir e acompanhar a leitura dos textos, Vídeos com informações sobre conteúdos diversos de alfabetização e Manual Digital do Professor, mediante as condições estabelecidas em Edital.",
            "Data e hora da sessão pública ": "03/01/2020 às 08h30",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "13/19",
            "Link": "http://www.varginha.mg.gov.br/Pdfs_e_arquivos_de_leis/article/28444/EDITAL%20TOMADA%20DE%20PRE%C3%87OS%20013%20-%202019%20-%20Programa%20Educacional.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "Cristina/MG (Prefeitura)",
            "Objeto resumido": "Prestação de Serviços de Engenharia, por empreitada por preço global, para a Construção de 01 (uma) Quadra Poliesportiva Coberta com Estrutura Metálica, com fornecimento de materiais e mão de obra, afeta ao uso e administração da Secretaria Municipal de Educação através da Escola Municipal Dep. Euclides Pereira Cintra no bairro Lambari conforme Lei Autorizativa nº 2.124/2017, em atendimento à solicitação da Secretaria Municipal de Educação.",
            "Data e hora da sessão pública ": "09/01 às 9:30 horas",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "04/19",
            "Link": "https://www.cristina.mg.gov.br/docs/anexos_licitacao/c295e0170d52d452aa7e83f14668d8ef.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Alimentação, Coffee Break e Buffet",
            "Órgão": "Cambuí/MG (Câmara)",
            "Objeto resumido": "Fornecimento de gêneros alimentícios, atendendo as necessidades da Câmara Municipal de Cambuí",
            "Data e hora da sessão pública ": "13/01 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "07/19",
            "Link": "https://www.camaracambui.mg.gov.br/temp/20122019003410arquivo_0007-2019.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Informática e Manutenção de Computadores",
            "Órgão": "Cambuí/MG (Câmara)",
            "Objeto resumido": "Contratação de pessoa física ou jurídica, para prestação de serviços de horas técnicas de informática, visando dar suporte aos trabalhos legislativos e administrativos desta Câmara Municipal de Cambuí.",
            "Data e hora da sessão pública ": "13/01 às 14 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "06/19",
            "Link": "https://www.camaracambui.mg.gov.br/temp/20122019003547arquivo_0006-2019.pdf",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's e para empresas da região"
        },
        {
            "Categoria de Atividade": "Agricultura Familiar e Produtos Rurais",
            "Órgão": "Conceição das Pedras/MG (Prefeitura)",
            "Objeto resumido": "sição de pães de sal, pão de queijo, biscoito pipoca de polvilho, pão de hot dog, broa, bolo de ovo, rosca doce, bolo recheado e salgados, para atender diversos setores da Prefeitura de Conceição das Pedras/MG, em conformidade com as especificações descritas no Anexo I deste Edital",
            "Data e hora da sessão pública ": "20/12 às 8 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "58/19",
            "Link": "http://www.conceicaodaspedras.mg.gov.br/docs/anexos_licitacao/32cdcac4188479e17d42ad585f8e2468.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Agricultura Familiar e Produtos Rurais",
            "Órgão": "Poços de Caldas - MG  (Prefeituras)",
            "Objeto resumido": "FORNECIMENTO DE ALIMENTO A BASE DE PROTEÍNA ISOLADA DE SOJA PARA MANUTENÇÃO DA ALIMENTAÇÃO ESCOLAR NA EDUCAÇÃO INFANTIL - SECRETARIA MUNICIPAL DE EDUCAÇÃO",
            "Data e hora da sessão pública ": "43617",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "360/19",
            "Link": "https://services.pocosdecaldas.mg.gov.br/editais/",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Material e Serviços Médicos-Hospitalares",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "AQUISIÇÃO DE REAGENTES PARA REALIZAÇÃO DE EXAMES DE QUÍMICA CLÍNICA E SOROLOGIA COM CESSÃO DE EQUIPAMENTO ANALISADOR AUTOMÁTICO DE BIOQUÍMICA COM IMPRESSÃO GRÁFICA DOS RESULTADOS",
            "Data e hora da sessão pública ": "15/01 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "130/19",
            "Link": "http://www.pousoalegre.mg.gov.br/arquivos/licitacao/Pregao%20130-2019%20-%20Aquisi%C3%A7%C3%A3o%20de%20reagentes%20para%20exames.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇOS PARA CONTRATAÇÃO DE EMPRESA PARA EXECUÇÃO DE SERVIÇOS DE EXTENSÃO E MANUTENÇÃO DE REDE, AMPLIAÇÃO E SUBSTITUIÇÃO DE TECNOLOGIA DO PARQUE I.P., COM FORNECIMENTO DE MATERIAL E MÃO DE OBRA, NO MUNICÍPIO DE POUSO ALEGRE/MG.",
            "Data e hora da sessão pública ": "13/02",
            "Modalidade de licitação": "Concorrência",
            "Edital": "05/19",
            "Link": "http://www.pousoalegre.mg.gov.br/arquivos/licitacao/Edital%20Concorr%C3%AAncia%20P%C3%BAblica%2005-2019%20-%20Parque%20IP%20finalizado%20(1).pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Veterinário e Rações",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "AQUISIÇÃO DE RAÇÃO SECA E ÚMIDA PARA CÃES E GATOS ADULTOS E FILHOTES PARA ATENDER AS NECESSIDADES DO CENTRO DE BEM ESTAR ANIMAL DA PREFEITURA DE POUSO ALEGRE",
            "Data e hora da sessão pública ": "30/01 às 9 hpras",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "114/19",
            "Link": "http://www.pousoalegre.mg.gov.br/arquivos/licitacao/Pregao%20114-2019%20-%20Aquisicao%20de%20ra%C3%A7ao%20umida%20e%20seca%20para%20caes%20e%20gatos.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "Piranguinho/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA EM ENGENHARIA PARA CONSTRUÇÃO DE SALA DE AULA E SANITÁRIOS NO CMEI - NILMARA RENÓ CARNEIRO DO MUNICÍPIO DE PIRANGUINHO",
            "Data e hora da sessão pública ": "08/01/2020 às 13h00",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "07/19",
            "Link": "https://www.piranguinho.mg.gov.br/portal/editais/1",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Alimentação, Coffee Break e Buffet",
            "Órgão": "São José do Alegre/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇOS PARA FUTURA E EVENTUAL AQUISIÇÃO DE GÊNEROS ALIMENTÍCIOS PARA OS LANCHES A SEREM OFERECIDOS AOS SERVIDORES MUNICIPAIS - EXCLUSIVAMENTE PARA ME E EPP.",
            "Data e hora da sessão pública ": "07/01/2020 às 14:15 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "31/19",
            "Link": "https://www.saojosedoalegre.mg.gov.br/licitacoes",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's"
        },
        {
            "Categoria de Atividade": "Informática e Manutenção de Computadores",
            "Órgão": "Varginha - MG (Prefeitura)",
            "Objeto resumido": "Aquisição de suprimentos de informática",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "214/19",
            "Link": "http://www.varginha.mg.gov.br/Pdfs_e_arquivos_de_leis/article/28518/Edital%20Preg%C3%A3o%20214%20%20-%202019%20-%20Aquisi%C3%A7%C3%A3o%20de%20Suprimentos%20de%20Inform%C3%A1tica.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Veículos Automóveis, Peças, Manutenção de Automóveis e Motocicletas",
            "Órgão": "Poços de Caldas - MG  (Prefeituras)",
            "Objeto resumido": "FORNECIMENTO DE PNEUS PARA VEÍCULOS LEVES, PESADOS E MÁQUINAS DA FROTA MUNICIPAL - SECRETARIA MUNICIPAL DE ADMINISTRAÇÃO E GESTÃO DE PESSOAS",
            "Data e hora da sessão pública ": "17/01/2020",
            "Modalidade de licitação": "Pregão eletrônico",
            "Edital": "381/19",
            "Link": "https://services.pocosdecaldas.mg.gov.br/editais/",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Transporte e Transporte Escolar",
            "Órgão": "Poços de Caldas - MG  (Prefeituras)",
            "Objeto resumido": "LOCAÇÃO DE VEÍCULOS PARA TRANSPORTE DE ALUNOS E PROFESSORES DA REDE MUNICIPAL DE ENSINO - SECRETARIA MUNICIPAL DE EDUCAÇÃO",
            "Data e hora da sessão pública ": "44105",
            "Modalidade de licitação": "Inexibilidade",
            "Edital": "89/19",
            "Link": "https://services.pocosdecaldas.mg.gov.br/editais/",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Alimentação, Coffee Break e Buffet",
            "Órgão": "Maria da Fé/MG (Prefeitura)",
            "Objeto resumido": "aquisições de HORTIFRUTIGRANJEIROS, para o Gabinete e Escolas Municipais, em atendimento ao Gabinete e Secretaria Municipal de Educação,",
            "Data e hora da sessão pública ": "23/01/2020 Às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "03/2020 PREGÃO PRESENCIAL – REGISTRO DE PREÇOS - N",
            "Link": "https://www.mariadafe.mg.gov.br/transparencia/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Alimentação, Coffee Break e Buffet",
            "Órgão": "Poços de Caldas - MG  (Prefeituras)",
            "Objeto resumido": "AQUISICÃO DE LEITE PASTEURIZADO INTEGRAL HOMOGENEIZADO PARA MANUTENÇÃO DA ALIMENTAÇÃO ESCOLAR NAS UNIDADES DE EDUCAÇÃO INFANTIL - SECRETARIA MUNICIPAL DE EDUCAÇÃO",
            "Data e hora da sessão pública ": "16/01",
            "Modalidade de licitação": "Dispensa",
            "Edital": "03/19",
            "Link": "https://services.pocosdecaldas.mg.gov.br/editais/",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Eletrodomésticos",
            "Órgão": "Poços de Caldas - MG  (Prefeituras)",
            "Objeto resumido": "FORNECIMENTO DE ELETRODOMÉSTICOS E EQUIPAMENTOS PARA COZINHAS DAS UNIDADES ESCOLARES - SECRETARIA MUNICIPAL DE EDUCAÇÃO",
            "Data e hora da sessão pública ": "17/01",
            "Modalidade de licitação": "Pregão eletrônico",
            "Edital": "395/19",
            "Link": "https://services.pocosdecaldas.mg.gov.br/editais/",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Agricultura Familiar e Produtos Rurais",
            "Órgão": "Poços de Caldas - MG  (Prefeituras)",
            "Objeto resumido": "AQUISICÃO DE LEITE PASTEURIZADO INTEGRAL HOMOGENEIZADO PARA MANUTENÇÃO DA ALIMENTAÇÃO ESCOLAR NAS UNIDADES DE EDUCAÇÃO INFANTIL - SECRETARIA MUNICIPAL DE EDUCAÇÃO",
            "Data e hora da sessão pública ": "16/01",
            "Modalidade de licitação": "Dispensa",
            "Edital": "03/19",
            "Link": "https://services.pocosdecaldas.mg.gov.br/editais/",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Locação e Venda de Equipamentos e Máquinas Pesados, e Caçambas",
            "Órgão": "Poços de Caldas - MG  (Prefeituras)",
            "Objeto resumido": "LOCAÇÃO DE CAÇAMBAS - SECRETARIA MUNICIPAL DE SERVIÇOS PÚBLICOS",
            "Data e hora da sessão pública ": "17/01",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "388/19",
            "Link": "https://services.pocosdecaldas.mg.gov.br/editais/",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Material e Serviços Médicos-Hospitalares",
            "Órgão": "Poços de Caldas - MG  (Prefeituras)",
            "Objeto resumido": "FORNECIMENTO DE DISPOSITIVO INTRA-UTERINO PARA UTILIZAÇÃO NO HOSPITAL DA ZONA LESTE - SECREETARIA MUNICIPAL DE SAÚDE",
            "Data e hora da sessão pública ": "17/01",
            "Modalidade de licitação": "Pregão eletrônico",
            "Edital": "390/19",
            "Link": "https://services.pocosdecaldas.mg.gov.br/editais/",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Limpeza, Faxina e Higiene",
            "Órgão": "Poços de Caldas - MG  (Prefeituras)",
            "Objeto resumido": "PRESTAÇÃO DE SERVIÇO DE DESTINAÇÃO FINAL DE RESÍDUOS SÓLIDOS URBANOS E RURAIS COLETADOS NO MUNICÍPIO DE POÇOS DE CALDAS, COM TRANSPORTE DOS RESÍDUOS DA ESTAÇÃO DE TRANSBORDO ATÉ ATERRO SANITÁRIO CLASSE II – A - SECRETARIA MUNICIPAL DE SERVIÇOS PÚBLICOS",
            "Data e hora da sessão pública ": "23/01",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "406/19",
            "Link": "https://services.pocosdecaldas.mg.gov.br/editais/",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Aluguel de Som e Palco para Festa",
            "Órgão": "Poços de Caldas - MG  (Prefeituras)",
            "Objeto resumido": "LOCAÇÃO DE SISTEMAS DE SONORIZAÇÃO E DE ILUMINAÇÃO PARA USO EM EVENTOS PROMOVIDOS PELA SECRETARIA MUNICIPAL DE TURISMO, SECRETARIA MUNICIPAL DE CULTURA E SECRETARIA MUNICIPAL DE EDUCAÇÃO",
            "Data e hora da sessão pública ": "23/01",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "394/19",
            "Link": "https://services.pocosdecaldas.mg.gov.br/editais/",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Papelaria, Material de Escritório e Material Escolar",
            "Órgão": "Poços de Caldas - MG  (Prefeituras)",
            "Objeto resumido": "Aquisição de materiais para o Kit do Aluno para atendimento da demanda da Secretaria Municipal de Educação no exercício 2020.",
            "Data e hora da sessão pública ": "27/01",
            "Modalidade de licitação": "Pregão eletrônico",
            "Edital": "03/20",
            "Link": "https://saolourenco.mg.gov.br/plicitacao.php",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Alimentação, Coffee Break e Buffet",
            "Órgão": "Marmelópolis/MG (Prefeitura)",
            "Objeto resumido": "Aquisição de gêneros alimentícios para merenda escolar.",
            "Data e hora da sessão pública ": "28/01/2020 às 13 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "01/20",
            "Link": "http://www.marmelopolis.mg.gov.br/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Pavimentação e Qualificação Urbana",
            "Órgão": "Itajubá/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA PARA PRESTAÇÃO DE SERVIÇOS DE PAVIMENTAÇÃO E QUALIFICAÇÃO VIÁRIA DE VIAS PÚBLICAS NO MUNICÍPIO DE ITAJUBÁ/MG. (PROGRAMA AVANÇAR C)",
            "Data e hora da sessão pública ": "28/02/2020 às 14:00 horas",
            "Modalidade de licitação": "Concorrência",
            "Edital": "01/20",
            "Link": "http://diariooficial.itajuba.mg.gov.br/upload/cp%20001%202020.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Veículos Automóveis, Peças, Manutenção de Automóveis e Motocicletas",
            "Órgão": "Itajubá/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇOS PARA CONTRATAÇÃO DE EMPRESA PARA FORNECIMENTO DE MÃO DE OBRA ESPECIALIZADA EM LUBRIFICADOR, NIVELADOR, HIDROJATO, MECÂNICO E LABORATORISTA VISANDO ATENDER A SECRETARIA MUNICIPAL DE OBRAS - SEMOB",
            "Data e hora da sessão pública ": "07/02/2020 às 14 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "02/20",
            "Link": "http://diariooficial.itajuba.mg.gov.br/upload/res%20pp%20002%2020%20MAO%20DE%20OBRA.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Pavimentação e Qualificação Urbana",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA PARA EXECUÇÃO DE SERVIÇOS DE REQUALIFICAÇÃO VIÁRIA DAS AVENIDAS IRMÃ MARIA JOSÉ TOSTA/ VEREADOR DOUTOR ARGENTINO DE PAULA E POLYCARPO GONÇALVES CAMPOS NO MUNICÍPIO DE POUSO ALEGRE/MG COM FORNECIMENTO DE MATERIAL E MÃO DE OBRA.",
            "Data e hora da sessão pública ": "20-Feb",
            "Modalidade de licitação": "Concorrência",
            "Edital": "01/20",
            "Link": "https://pousoalegre.mg.gov.br/arquivos/licitacao/Edital%2001-2020.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Sistemas e Tecnologia da Informação",
            "Órgão": "Poços de Caldas - MG  (Prefeituras)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA PARA LOCAÇÃO DE SISTEMA INTEGRADO DE GESTÃO DA ADMINISTRAÇÃO DO PODER EXECUTIVO DO MUNICÍPIO DE POÇOS DE CALDAS, COMPREENDENDO INSTALAÇÃO DE LICENÇAS DE USO, CONFIGURAÇÃO, PARAMETRIZAÇÃO, CONVERSÃO DE DADOS, MANUTENÇÃO PREVENTIVA E CORRETIVA, IMPLANTAÇÃO E DESENVOLVIMENTO DE SOFTWARE COM SUPORTE TÉCNICO E TREINAMENTO - SECRETARIA MUNICIPAL DE ADMINISTRAÇÃO E GESTÃO DE PESSOAS",
            "Data e hora da sessão pública ": "11-Feb",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "400/19",
            "Link": "https://services.pocosdecaldas.mg.gov.br/editais/",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Internet e Telefonia",
            "Órgão": "Poços de Caldas - MG  (Prefeituras)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA EM PRESTAÇÃO DE SERVIÇOS DE CONEXÃO E ACESSO PERMANENTE A INTERNET EM BANDA LARGA - SECRETARIA MUNICIPAL DE ADMINISTRAÇÃO E GESTÃO DE PESSOAS",
            "Data e hora da sessão pública ": "2/4/20",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "401/19",
            "Link": "https://services.pocosdecaldas.mg.gov.br/editais/",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "São Lourenço/MG (Prefeitura)",
            "Objeto resumido": "Concessão de bem e serviço público, com confecção de projetos de Arquitetura, Estrutural, Eletromecânica e Complementares de Engenharia para recuperação e operação do teleférico da cidade de São Lourenço",
            "Data e hora da sessão pública ": "1/23/20",
            "Modalidade de licitação": "Concorrência",
            "Edital": "01/20",
            "Link": "https://saolourenco.mg.gov.br/arquivos/licitacao/12112019171251EditalConcorr%C3%AAncia001-Telef%C3%A9ricoII.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "São Lourenço/MG (Prefeitura)",
            "Objeto resumido": "Contrataçãode empresasespecializadasem diversasprestações de serviços para o evento denominado Carnaval de São Lourenço2020, atendendoa solicitação da Secretaria Municipalde Turismoe Cultura",
            "Data e hora da sessão pública ": "28/01/2020,com incício às 15:30",
            "Modalidade de licitação": "Pregão eletrônico",
            "Edital": "360/19",
            "Link": "https://saolourenco.mg.gov.br/arquivos/licitacao/15012020173613EditalPE189.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Aluguel de Som e Palco para Festa",
            "Órgão": "São Lourenço/MG (Prefeitura)",
            "Objeto resumido": "Contrataçãode empresasespecializadasem diversasprestações de serviçosparao evento denominado Carnaval de São Lourenço2020, atendendoa solicitação da Secretaria Municipalde Turismoe Cultura",
            "Data e hora da sessão pública ": "28/01/2020,com incício às 15:30",
            "Modalidade de licitação": "Pregão eletrônico",
            "Edital": "360/19",
            "Link": "https://saolourenco.mg.gov.br/arquivos/licitacao/15012020173613EditalPE189.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "São José do Alegre/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA PARA EXECUÇÃO DE OBRA DE CONSTRUÇÃO DE CONCHA ACÚSTICA E BANHEIRO NO MUNICÍPIO DE SÃO JOSÉ DO ALEGRE/MG.",
            "Data e hora da sessão pública ": "43871",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "01/20",
            "Link": "https://www.saojosedoalegre.mg.gov.br/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Sistemas e Tecnologia da Informação",
            "Órgão": "Poços de Caldas - MG  (Prefeituras)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA PARA LOCAÇÃO DE SISTEMA INTEGRADO DE GESTÃO DA ADMINISTRAÇÃO DO PODER EXECUTIVO DO MUNICÍPIO DE POÇOS DE CALDAS, COMPREENDENDO INSTALAÇÃO DE LICENÇAS DE USO, CONFIGURAÇÃO, PARAMETRIZAÇÃO, CONVERSÃO DE DADOS, MANUTENÇÃO PREVENTIVA E CORRETIVA, IMPLANTAÇÃO E DESENVOLVIMENTO DE SOFTWARE COM SUPORTE TÉCNICO E TREINAMENTO - SECRETARIA MUNICIPAL DE ADMINISTRAÇÃO E GESTÃO DE PESSOAS",
            "Data e hora da sessão pública ": "2/11/20",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "400/19",
            "Link": "https://services.pocosdecaldas.mg.gov.br/editais/",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Internet e Telefonia",
            "Órgão": "Poços de Caldas - MG  (Prefeituras)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA EM PRESTAÇÃO DE SERVIÇOS DE CONEXÃO E ACESSO PERMANENTE A INTERNET EM BANDA LARGA - SECRETARIA MUNICIPAL DE ADMINISTRAÇÃO E GESTÃO DE PESSOAS",
            "Data e hora da sessão pública ": "2/4/20",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "401/19",
            "Link": "https://services.pocosdecaldas.mg.gov.br/editais/",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Sistemas e Tecnologia da Informação",
            "Órgão": "São Lourenço/MG (Prefeitura)",
            "Objeto resumido": "Contratação de empresa para prestação de serviço técnico especializado em assessoria e consultoria para Sistema de Controle Interno da Prefeitura de São Lourenço",
            "Data e hora da sessão pública ": "02/03/2020",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "02/20",
            "Link": "https://saolourenco.mg.gov.br/plicitacao.php",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Consultoria Empresarial, Auditoria ou Assessoria Jurídica",
            "Órgão": "São Lourenço/MG (Prefeitura)",
            "Objeto resumido": "Contratação de empresa para prestação de serviço técnico especializado em assessoria e consultoria para Sistema de Controle Interno da Prefeitura de São Lourenço",
            "Data e hora da sessão pública ": "02/03/2020",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "02/20",
            "Link": "https://saolourenco.mg.gov.br/plicitacao.php",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Consultoria Empresarial, Auditoria ou Assessoria Jurídica",
            "Órgão": "Pedralva/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA PARA PRESTAÇÃO DE SERVIÇO DE ASSESSORIA E CONSULTORIA TÉCNICA À SECRETARIA MUNICIPAL DE EDUCAÇÃO COM DISPONIBILIZAÇÃO DE SISTEMA.",
            "Data e hora da sessão pública ": "14/02/2020 às 14h01min",
            "Modalidade de licitação": "Pregão eletrônico",
            "Edital": "13/2020",
            "Link": "https://www.pedralva.mg.gov.br/licitacoes",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "São José do Alegre/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA PARA EXECUÇÃO DE OBRA DE CONSTRUÇÃO DE CONCHA ACÚSTICA E BANHEIRO NO MUNICÍPIO DE SÃO JOSÉ DO ALEGRE/MG",
            "Data e hora da sessão pública ": " 10, 11 e 12/02/2020",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "01/20",
            "Link": "https://www.saojosedoalegre.mg.gov.br/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Sistemas e Tecnologia da Informação",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA PARA FORNECIMENTO, IMPLANTAÇÃO, CAPACITAÇÃO, TREINAMENTO E SUPORTE TÉCNICO DE SISTEMA INTEGRADO DE ADMINISTRAÇÃO DE BENS MÓVEIS MOTORIZADOS",
            "Data e hora da sessão pública ": "28/02/2020",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "137/19",
            "Link": "https://pousoalegre.mg.gov.br/licitacao_downloads.asp?id=1179&idusuario=1&ida=3291&nomearq=Pregao%20137-2019%20-%20Monitoramento%20de%20bens%20m%C3%B3veis.pdf&numarq=137/2019",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Sistemas e Tecnologia da Informação",
            "Órgão": "Cambuí/MG (Prefeitura)",
            "Objeto resumido": "Contratação de empresa especializada visando a prestação de serviços de manutenção preventiva, corretiva, adaptativa, evolutiva e atualização do sistema de especializado em Gestão Pública utilizado pelo município de Cambuí, de acordo com o Termo de Referência anexo ao presente edital.",
            "Data e hora da sessão pública ": "19/02 às 9 hoars",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "10/20",
            "Link": "http://www.prefeituradecambui.mg.gov.br/wp-content/uploads/2020/01/Preg010_Sistema.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Sistemas e Tecnologia da Informação",
            "Órgão": "Ouro Fino - MG (Câmara)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA PARA A CESSÃO DE DIREITO DE USO TEMPORÁRIO (LOCAÇÃO) DE SOFTWARE INTEGRADO PARA GESTÃO ORÇAMENTÁRIA, FINANCEIRA, ADMINISTRATIVA E CONTRATAÇÃO DE TREINAMENTO E ASSESSORIA TÉCNICA (CONFORME O TERMO DE REFERÊNCIA) ",
            "Data e hora da sessão pública ": "14/02 às 9 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "01/20",
            "Link": "http://camaraourofino.mg.gov.br/assets/frontend/pdf/licitacoes/ed5645bd2ef869634cf345614b2009ea.pdf",
            "Situação": "Encerrado",
            "Observações": "Exclusivo para MEi e MPE's"
        },
        {
            "Categoria de Atividade": "Sistemas e Tecnologia da Informação",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA PARA FORNECIMENTO, IMPLANTAÇÃO, CAPACITAÇÃO, TREINAMENTO E SUPORTE TÉCNICO DE SISTEMA INTEGRADO DE ADMINISTRAÇÃO DE BENS MÓVEIS MOTORIZADOS.",
            "Data e hora da sessão pública ": "10/03",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "137/19",
            "Link": "https://pousoalegre.mg.gov.br/arquivos/licitacao/Pregao%20137-2019%20-%20Monitoramento%20de%20bens%20m%C3%B3veis.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Locação e Venda de Equipamentos e Máquinas Pesados, e Caçambas",
            "Órgão": "Brazópolis/MG (Prefeitura)",
            "Objeto resumido": "AQUISIÇÃO DE MOTONIVELADORA ZERO KM, EM ATENDIMENTO A SECRETÁRIA MUNICIPAL DE AGRICULTURA, PECUÁRIA, ABASTECIMENTO E MEIO AMBIENTE, REFERENTE AO CONVENIO Nº 892027/2019 PROCESSO 21000.092785/2019-27 – MINISTERIO DA AGRICULTURA, PECUARIA, ABASTECIMENTO – MAPA, CONFORME ESPECIFICAÇÕES DO ANEXO I, TERMO DE REFERENCIA DESTE EDITAL.",
            "Data e hora da sessão pública ": "2/17/20",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "09/20",
            "Link": "https://www.brazopolis.mg.gov.br/pdf/Licitacao/pregaoPresencial/2020/processo_licitatorio_15_2020.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Sistemas e Tecnologia da Informação",
            "Órgão": "Itajubá/MG (Prefeitura)",
            "Objeto resumido": "REGISTRO DE PREÇOS PARA CONTRATAÇÃO DE EMPRESA ESPECIALIZADA NO RAMO DE TECNOLOGIA, OBJETIVANDO O FORNECIMENTO DE SISTEMA ESTRUTURADOR DE INFORMAÇÃO E INTELIGÊNCIA APLICÁVEL - SEMINS E PRÉDIOS PUBLICOS DO MUNICIPO DE ITAJUBÁ – SEMED, SEMAD, SEMDES, SEMDS E SEMSA",
            "Data e hora da sessão pública ": "02/03 às 14 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "14/20",
            "Link": "http://www.itajuba.mg.gov.br/wp-content/uploads/2020/02/pp_014_2020_srp_cont_emp_inteligencia_aplicavel.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Informática e Manutenção de Computadores",
            "Órgão": "Varginha  - MG (Câmara)",
            "Objeto resumido": "aquisição de equipamentos de informática,",
            "Data e hora da sessão pública ": "05/03/2020 às 14h00min",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "04/20",
            "Link": "http://www.camaravarginha.mg.gov.br/downloads/transparencia/licitacoes/2020/edital0042020.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "Itajubá/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA PARA PRESTAÇÃO DE SERVIÇOS DE OBRAS DE QUALIFICAÇÃO VIÁRIA, NO ÂMBITO DO PROGRAMA FINISA – FINANCIAMENTO À INFRAESTRUTURA E AO SANEAMENTO",
            "Data e hora da sessão pública ": "ATÉ ÀS 13:45 DO DIA 09/03/2020",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "01/2020",
            "Link": "http://diariooficial.itajuba.mg.gov.br/upload/tp%2001%2020-%20%20Const%20de%20passarelas%20de%20pedestres%20e%20aduelas%20no%20parque%20municipal%20-%20SEMOB.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": " CONTRATAÇÃO DE EMPRESA PARA EXECUÇÃO DAS OBRAS DE URBANIZAÇÃO NO ENTORNO DA UNIDADE DE PRONTO ATENDIMENTO – UPA 24h, NO MUNICÍPIO DE POUSO ALEGRE/MG.",
            "Data e hora da sessão pública ": "06/03/2020|09:00",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "09/2020",
            "Link": "https://pousoalegre.mg.gov.br/arquivos/licitacao/Pregao%20Presencial%2009-2020%20-%20Obras%20do%20Entorno%20da%20UPA%20final.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "Pouso Alegre/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA PARA CONSTRUÇÃO DA UBS DO BAIRRO ALGODÃO, NA ESTRADA MUNICIPAL DO ALGODÃO, PERTENCENTE AO MUNICIPIO DE POUSO ALEGRE/MG",
            "Data e hora da sessão pública ": "16/03/2020|09:00",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "01/2020",
            "Link": "https://pousoalegre.mg.gov.br/arquivos/licitacao/EDITAL%20TOMADA%20DE%20PRE%C3%87OS%2001-2020%20UBS%20ALGOD%C3%83O.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Filmagem e Fotografia",
            "Órgão": "Varginha  - MG (Câmara)",
            "Objeto resumido": "contratação de empresa para prestação de serviços de transmissão de áudio e imagem das Sessões Ordinárias, Extraordinárias, Solenes, Audiências Públicas, projetos como Câmara nos Bairros e Câmara nas Escolas e demais eventos promovidos pela Câmara Municipal de Varginha e Escola do Legislativo da Câmara Municipal de Varginha, em canal de transmissão de TV aberta em Varginha/MG,mediante as condições estabelecidas em Edital.",
            "Data e hora da sessão pública ": "03/03/2020 às 09h00min",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "01/2020",
            "Link": "http://www.camaravarginha.mg.gov.br/downloads/transparencia/licitacoes/2020/edital0012020.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Informática e Manutenção de Computadores",
            "Órgão": "Santa Rita do Sapucaí/MG (Prefeitura)",
            "Objeto resumido": " CONTRATAÇÃO DE EMPRESA PARA FORNECIMENTO DE MATERIAL DE CONSUMO DE INFORMÁTICA, DESTINADO A MANUTENÇÃO DAS SECRETARIAS SOLICITANTES DO MUNICÍPIO DE SANTA RITA DO SAPUCAÍ / MG.",
            "Data e hora da sessão pública ": "16/03/2002 às 08h30min",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "19/2020",
            "Link": "http://pmsrs.mg.gov.br/wordpress/wp-content/uploads/2020/02/EDITAL-Material-de-Consumo-de-Informatica.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "Santa Rita do Sapucaí/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA EM EXECUÇÃO DE SERVIÇOS DE ENGENHARIA E ARQUITETURA PARA CONSTRUÇÃO DE PRÉDIO ESCOLAR NO MUNICÍPIO DE SANTA RITA DO SAPUCAÍ / MG.",
            "Data e hora da sessão pública ": "30/03/2020 às 8h30",
            "Modalidade de licitação": "Concorrência",
            "Edital": "01/2020",
            "Link": "http://pmsrs.mg.gov.br/wordpress/wp-content/uploads/2020/02/EDITAL-RETIFICADO-III-Escola-Parque.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Informática e Manutenção de Computadores",
            "Órgão": "Maria da Fé/MG (Prefeitura)",
            "Objeto resumido": "FUTURAS E EVENTUAIS AQUISIÇÕES DE MATERIAIS DE EXPEDIENTE E INFORMÁTICA, em atendimento à Fundação Municipal de Saúde de Maria da Fé (entidade mantenedora do Hospital Municipal Ferraz e Torres).",
            "Data e hora da sessão pública ": "06/03/2020 às 9 h",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "04/2020",
            "Link": "https://www.mariadafe.mg.gov.br/transparencia/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "Pedralva/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA PARA REFORMA E AMPLIAÇÃO DO ESTÁDIO MUNICIPAL MONTI, COM FORNECIMENTO DE MATERIAIS E MÃO DE OBRA, CONFORME PROJETO BÁSICO E PLANILHAS.",
            "Data e hora da sessão pública ": "17 de março de 2020 às 14:15 horas.",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "03/2020",
            "Link": "https://www.pedralva.mg.gov.br/licitacao/edital/680",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Informática e Manutenção de Computadores",
            "Órgão": "Caxambu - MG (Prefeitura)",
            "Objeto resumido": "AQUISIÇÃO DE EQUIPAMENTOS E COMPONENTES DE INFORMÁTICA ATENDENDO AS NECESSIDADES DE SETORES DA PREFEITURA MUNICIPAL DE CAXAMBU, ",
            "Data e hora da sessão pública ": "13/03/2020 às 14 horas",
            "Modalidade de licitação": "Pregão eletrônico",
            "Edital": "28/2020",
            "Link": "http://170.254.192.66:8080/portalcidadao/#075f539f0b7223f116d2c85c4ce1b1752fccb0db1fd92284312b33310fb199ef6050e9373e0f36365cbb7737a0e49e582e657146a648fd13d54aa9e4338df879e807578fb1eeafd74fd88474128cf6c0fb7fab1a614a99046f48ee5adad5fea9dd6ffce871d776c51663f7fa03b362af",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "São Paulo (Prefeirura - Sec Infraestrutura e Meio Ambiente)",
            "Objeto resumido": "Serviço técnico profissional especializado para revisão/atualização de planos municipais dos serviços de abastecimento de água e esgotamento sanitário, dos municípios regulados e fiscalizados pela ARSESP",
            "Data e hora da sessão pública ": "16/03/2020 às 09h00.",
            "Modalidade de licitação": "Concorrência",
            "Edital": "01/2020",
            "Link": "https://www.infraestruturameioambiente.sp.gov.br/editais/2020/01/concorrencia-no-01-2020-gs/",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Agropecuária",
            "Órgão": "Itajubá/MG (Prefeitura)",
            "Objeto resumido": "AQUISIÇÃO DE MÁQUINAS E IMPLEMENTOS AGRÍCOLAS PARA PRESTAÇÃO DE SERVIÇOS A PRODUTORES RURAIS DE BAIXA RENDA DA AGRICULTURA FAMILIAR DO MUNICÍPIO - SEMAG.",
            "Data e hora da sessão pública ": "18/03/2020 às 15h",
            "Modalidade de licitação": "Pregão eletrônico",
            "Edital": "19/2020",
            "Link": "http://diariooficial.itajuba.mg.gov.br/upload/res%20pe%20019%2020%20AQ%20MAQUINAS%20AGRICOLAS%20-%20SEMAG.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Agropecuária",
            "Órgão": "Ouro Fino - MG (Prefeitura)",
            "Objeto resumido": "Registro de Preço para futura e eventual prestação de serviços de manutenção de equipamentos agrícolas, com fornecimento de peças, conforme descrição, especificação e condições previstas neste edital e seus anexos.",
            "Data e hora da sessão pública ": "11/03 às 14 horas",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "13/2020",
            "Link": "http://www.ourofino.mg.gov.br/licitacoes.php?id=8",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "Prefeitura Municipal de Balneário de Piçarras",
            "Objeto resumido": "contratação de empresa de consultoria para realizar o licenciamento ambiental (obtenção de Licença ambiental Prévia - LAP, Licença ambiental de Instalação - LAI, Licença ambiental de Operação - LAO) de uma Unidade de Compostagem de resíduos sólidos urbanos segregados na fonte, de pequeno porte (cerca de 1,7 toneladas de resíduos / dia), situada na Rua Maria Fermina Ribeiro, S/N, bairro Nossa Senhora da Paz, município de Balneário Piçarras/SC, contemplando assessoria técnica, elaboração de Relatório ambiental Prévio (RAP), Planos e Programas Ambientais detalhados a nível executivo, Projeto Hidrossanitário de um banheiro com Projeto Executivo de Sistema de Tratamento Individual de Esgoto Sanitário, Relatório Técnico Fotográfico comprovando efetivo cumprimento das exigências e condicionantes estabelecidas na LAI, todos os documentos atendendo ao conteúdo da Instrução Normativa n° 75 do IMA, serviços abrangendo a realização de protocolos no órgão ambiental competente, o acompanhamento dos processos, bem como o atendimento de demais exigências solicitadas (como a apresentação de complementações), conforme especificações e quantitativos",
            "Data e hora da sessão pública ": "11/03 às 14 horas",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "01/20",
            "Link": "http://www.in.gov.br/web/dou/-/aviso-de-licitacao-tomada-de-precos-n-7/2020-pmbp-244625005",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "Petrobrás",
            "Objeto resumido": "Serviço de apoio às atividades de licenciamento, auditoria e gestão ambiental",
            "Data e hora da sessão pública ": "20/03 às 10 horas",
            "Modalidade de licitação": "Modo de Disputa Aberto ",
            "Edital": "7003016910",
            "Link": "http://www.in.gov.br/web/dou/-/aviso-de-licitacao-n-7003016910-245224924",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "Morro Agudo de Goiás - GO",
            "Objeto resumido": "A PRESENTE LICITAÇÃO TEM POR OBJETO A CONTRATAÇÃO DE EMPRESA ESPECIALIZADA EM CONSULTORIA ambiental PARA CONFECÇÃO DE PROJETOS E REALIZAÇÃO DE ESTUDOS, TENDENTES À EMISSÃO DA LICENÇA DE INSTALAÇÃO E FUNCIONAMENTO DO ATERRO SANITÁRIO SIMPLIFICADO NO MUNICÍPIO DE MORRO AGUDO DE GOIÁS/GO, JUNTO À SEMAD/GO OU ÓRGÃO ambiental COMPETENT",
            "Data e hora da sessão pública ": "05/03 às 9h30 ",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Consultoria Empresarial, Auditoria ou Assessoria Jurídica",
            "Órgão": "Itajubá/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESAS PARA PRESTAÇÃO DE SERVIÇOS TECNICOS ESPECIALIZADA PARA DIGITAÇÃO E GERENCIAMENTO DE DOCUMENTOS – SEMAD",
            "Data e hora da sessão pública ": "17/03/2020 às 14 horas.",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "12/2020",
            "Link": "http://diariooficial.itajuba.mg.gov.br/upload/res%20pp%20012%2020%20cont%20emp%20digitalizacao.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Sistemas e Tecnologia da Informação",
            "Órgão": "Itajubá/MG (Prefeitura)",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESAS PARA PRESTAÇÃO DE SERVIÇOS TECNICOS ESPECIALIZADA PARA DIGITAÇÃO E GERENCIAMENTO DE DOCUMENTOS – SEMAD",
            "Data e hora da sessão pública ": "17/03/2020 às 14 horas.",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "12/2020",
            "Link": "http://diariooficial.itajuba.mg.gov.br/upload/res%20pp%20012%2020%20cont%20emp%20digitalizacao.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Gráfica e Impressão",
            "Órgão": "Delfim Moreira/MG (Prefeitura)",
            "Objeto resumido": "Registro de preços para futura e eventual Contratação de empresa para o fornecimento de serviço gráfico, para todas as secretarias da Prefeitura Municipal de Delfim Moreira – MG.",
            "Data e hora da sessão pública ": "11/03 às 9h",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "05/2020",
            "Link": "https://delfimmoreira.mg.gov.br/licitacao/pregao-presencial-05-2020-processo-05-2020/",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Informática e Manutenção de Computadores",
            "Órgão": "Maria da Fé/MG (Prefeitura)",
            "Objeto resumido": "FUTURAS E EVENTUAIS AQUISIÇÕES DE MATERIAIS DE EXPEDIENTE E INFORMATICA,",
            "Data e hora da sessão pública ": "06/03 às 9h",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "04/2020",
            "Link": "https://www.mariadafe.mg.gov.br/docs/anexos_licitacao/90fd8681c76ef74ac71aa6094dddf7f5.pdf?1583789490",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Ambiental, Hídrica, Elétrica e Acústica)",
            "Órgão": "Passa Quatro - MG (Prefeitura)",
            "Objeto resumido": "Contratação de empresa para prestação de serviços de consultoria ambiental.",
            "Data e hora da sessão pública ": "26/03 às 9h",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "04/2020",
            "Link": "https://www.passaquatro.mg.gov.br/upfiles/contas-publicas/relatorios-de-licitacoes/2020/tp-004-2020/edital-tp-004-2020.pdf",
            "Situação": "Cancelada",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Informática e Manutenção de Computadores",
            "Órgão": "Varginha - MG (Prefeitura)",
            "Objeto resumido": "Aquisição de Suprimentos de Informática, mediante as condições estabelecidas neste Edital.",
            "Data e hora da sessão pública ": "12/03 Às 8h30",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "29/2020",
            "Link": "http://www.varginha.mg.gov.br/Pdfs_e_arquivos_de_leis/article/28881/Edital%20Preg%C3%A3o%20029-2020%20-%20Aquisi%C3%A7%C3%A3o%20de%20Suprimentos%20de%20Inform%C3%A1tica.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Informática e Manutenção de Computadores",
            "Órgão": "Caxambu - MG (Prefeitura)",
            "Objeto resumido": "AQUISIÇÃO DE EQUIPAMENTOS E COMPONENTES DE INFORMÁTICA ATENDENDO AS NECESSIDADES DE SETORES DA PREFEITURA MUNICIPAL DE CAXAMBU, ",
            "Data e hora da sessão pública ": "43903.58333",
            "Modalidade de licitação": "Pregão eletrônico",
            "Edital": "08/2020",
            "Link": "http://170.254.192.66:8080/portalcidadao/#075f539f0b7223f116d2c85c4ce1b1752fccb0db1fd92284312b33310fb199ef6050e9373e0f36365cbb7737a0e49e582e657146a648fd13d54aa9e4338df879e807578fb1eeafd74fd88474128cf6c0fb7fab1a614a99046f48ee5adad5fea9dd6ffce871d776c51663f7fa03b362af",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Sistemas e Tecnologia da Informação",
            "Órgão": "São Paulo (Prefeirura - Sec Infraestrutura e Meio Ambiente)",
            "Objeto resumido": "contratação de serviços de desenvolvimento, manutenção, sustentação e documentação de sistemas informatizados ",
            "Data e hora da sessão pública ": "19/03/2020 às 09h00",
            "Modalidade de licitação": "Pregão eletrônico",
            "Edital": "04/2020",
            "Link": "https://www.infraestruturameioambiente.sp.gov.br/editais/2020/03/pregao-eletronico-no-04-2020-fpbrn/",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Gráfica e Impressão",
            "Órgão": "Poços de Caldas - MG  (Prefeituras)",
            "Objeto resumido": "CONFECÇÃO DE IMPRESSOS PARA O DST/AIDS - SECRETARIA MUNICIPAL DE SAÚDE",
            "Data e hora da sessão pública ": "27/04 às 12h30",
            "Modalidade de licitação": "Pregão eletrônico",
            "Edital": "12/20",
            "Link": "https://services.pocosdecaldas.mg.gov.br/editais/editais.xhtml",
            "Situação": "Em aberto",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Filmagem e Fotografia",
            "Órgão": "PODER JUDICIÁRIO - Tribunal Superior do Trabalho- 2 ª região/SP",
            "Objeto resumido": "Serviço de filmagem, com edição e sonorização das imagens registradas",
            "Data e hora da sessão pública ": "03/04/2020 às 14:00 horas",
            "Modalidade de licitação": "Pregão Eletrônico",
            "Edital": "12/20",
            "Link": "Comprasnet.gov.br",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Material Elétrico e Serviços Elétricos",
            "Órgão": "São Lourenço/MG (Prefeitura)",
            "Objeto resumido": "Aquisição de material elétrico para a Coordenação de Iluminação Pública",
            "Data e hora da sessão pública ": "4/3/20",
            "Modalidade de licitação": "Pregão eletrônico",
            "Edital": "46/20",
            "Link": "https://saolourenco.mg.gov.br/arquivos/licitacao/17032020121831EditalPE46.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Hídrica, Elétrica e Acústica)",
            "Órgão": "São Lourenço/MG (Prefeitura)",
            "Objeto resumido": "Contratação de empresa especializada para a prestação de serviços de consultoria e assessoria em área de engenharia, para atender a Administração Municipal",
            "Data e hora da sessão pública ": "06/04/2020 às 09h30",
            "Modalidade de licitação": "Carta convite",
            "Edital": "04/20",
            "Link": "https://www.pedralva.mg.gov.br/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Locação e Venda de Equipamentos e Máquinas Pesados, e Caçambas",
            "Órgão": "Marmelópolis/MG (Prefeitura)",
            "Objeto resumido": "Registro de preços para futura e eventual contratação de empresa especializada na prestação de serviço de locação de caminhão basculante para a Secretaria Municipal de Obras e Serviços Urbanos",
            "Data e hora da sessão pública ": "03/04/2020 às 10h",
            "Modalidade de licitação": "Pregão Presencial",
            "Edital": "24/20",
            "Link": "http://www.marmelopolis.mg.gov.br/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Alimentação, Coffee Break e Buffet",
            "Órgão": "Ouro Fino - MG (Prefeitura)",
            "Objeto resumido": "Registro de Preços nº 019/20 do tipo menor preço por item, para futura e eventual aquisição de carnes e derivados para merenda escolar e para as ações do Departameno de Ação Social, conforme edital",
            "Data e hora da sessão pública ": "07/04 Às 9h",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "19/20",
            "Link": "http://www.ourofino.mg.gov.br/licitacoes.php?id=8",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Gráfica e Impressão",
            "Órgão": "Borda da Mata - MG (Prefeitura)",
            "Objeto resumido": "Registro de preço para futura contratação de microempresa, empresa de pequeno porte ou equiparada especializada, para prestação de serviço gráfico e fornecimento de material, para atender as necessidades do Gabinete do Prefeito, Departamentos Municipais e Secretaria Municipal de Saúde.",
            "Data e hora da sessão pública ": "ATÉ AS 09:00 DE 07/04/2020",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "23/20",
            "Link": "http://www.bordadamata.mg.gov.br/index.php/publicacoes/editais-de-licitacao?download=2840:prc-061-preg-023-regpreco-017-2020-material-grafico",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Locação e Venda de Equipamentos e Máquinas Pesados, e Caçambas",
            "Órgão": "Borda da Mata - MG (Prefeitura)",
            "Objeto resumido": "PRESTAÇÃO DE SERVIÇO DE MAQUINÁRIOS",
            "Data e hora da sessão pública ": "09:00 DE 06/04/2020",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "22/20",
            "Link": "http://www.bordadamata.mg.gov.br/index.php/publicacoes/editais-de-licitacao?download=2776:prc-060-preg-022-regpreco-016-2020-prestacao-de-servico-de-maquinarios",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Locação e Venda de Equipamentos e Máquinas Pesados, e Caçambas",
            "Órgão": "Varginha - MG (Prefeitura)",
            "Objeto resumido": "Aquisição de máquinas pesadas mediante as condições estabelecidas neste Edital e aquelas que compõem seus anexos.",
            "Data e hora da sessão pública ": "06 / 04 / 2.020, às 13h30 (treze horas e trinta minutos)",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "47/20",
            "Link": "http://www.varginha.mg.gov.br/Pdfs_e_arquivos_de_leis/article/29157/Edital%20Preg%C3%A3o%20047%20-%202020%20-%20Aquisi%C3%A7%C3%A3o%20de%20m%C3%A1quinas%20pesadas.pdf",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia Ambiental",
            "Órgão": "Santa Vitória (MG)",
            "Objeto resumido": "Contratação de empresa para prestação de serviço técnico ambiental para elaboração do processo de regularização ambiental, por meio do licenciamento ambiental junto aos órgãos competentes para a obra de Barramento e Canalização do Córrego Santa Vitória, com o Documento Autorizativo de Intervenção Ambiental (DAIA) em APP - Área de Preservação Permanente junto ao IEF, outorga d'água junto ao IGAM e o licenciamento ambiental junto à SUPRAM Triângulo Mineiro e Alto Paranaíba",
            "Data e hora da sessão pública ": "14/04 às 13h",
            "Modalidade de licitação": "Concorrência",
            "Edital": "01/20",
            "Link": "http://www.in.gov.br/web/dou/-/aviso-de-licitacao-concorrencia-publica-n-1/2020-247342072",
            "Situação": "Encerrado",
            "Observações": "(34) 3251-8508 das 12:00h às 18:00h, e-mail licitacao@santavitoria.mg.gov.br"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Hídrica, Elétrica e Acústica)",
            "Órgão": "Maria da Fé/MG (Prefeitura)",
            "Objeto resumido": "contratação de empresa para prestação de serviços especializados de Engenharia para elaboração dos Projetos de Segurança contra Incêndio e Pânico (PSCIP) das edificações de valor cultural, relacionadas na Recomendação 01/2018 do Ministério Público do Estado de Minas Gerais, tendo como finalidade a obtenção do Auto de Vistoria do Corpo de Bombeiros (AVCB)",
            "Data e hora da sessão pública ": "06/04 às 9h",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "14/20",
            "Link": "https://www.mariadafe.mg.gov.br/transparencia/licitacoes",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Sustentabilidade",
            "Órgão": "São Paulo (Prefeirura - Sec Infraestrutura e Meio Ambiente)",
            "Objeto resumido": "Processo de contratação de serviços técnicos especializados de engenharia consultiva de apoio à otimização da gestão de energia no âmbito da Secretaria de Infraestrutura e Meio Ambiente.",
            "Data e hora da sessão pública ": "27/04/2020 às 09h00.",
            "Modalidade de licitação": "Concorrência",
            "Edital": "02/2020",
            "Link": "https://smastr16.blob.core.windows.net/editais/sites/41/2020/03/edital-concorrencia-02-2020-gs.pdf",
            "Situação": "Em aberto",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Locação e Venda de Equipamentos e Máquinas Pesados, e Caçambas",
            "Órgão": "Poços de Caldas - MG  (Prefeituras)",
            "Objeto resumido": "LOCAÇÃO DE TRATOR DE ESTEIRA - SECRETARIA MUNICIPAL DE PROJETOS E OBRAS PÚBLICAS",
            "Data e hora da sessão pública ": "23/04/20 às 12h30 ",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "15/20",
            "Link": "https://services.pocosdecaldas.mg.gov.br/editais/editais.xhtml",
            "Situação": "Em aberto",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Locação e Venda de Equipamentos e Máquinas Pesados, e Caçambas",
            "Órgão": "Varginha - MG (Prefeitura)",
            "Objeto resumido": "contratação de empresa para a prestação de serviços de Máquinas Pesadas",
            "Data e hora da sessão pública ": "23/04/20 às 13h30",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "56/20",
            "Link": "http://www.varginha.mg.gov.br/Pdfs_e_arquivos_de_leis/article/29297/Edital%20Preg%C3%A3o%20056-2020%20-%20%20Contrata%C3%A7%C3%A3o%20dos%20Servi%C3%A7os%20de%20M%C3%A1quinas%20Pesadas.pdf",
            "Situação": "Em aberto",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia Ambiental",
            "Órgão": "Prefeitura Rio Bonito - RJ",
            "Objeto resumido": "Contratação de empresa de engenharia para serviços de Complementação da Instalação Predial do Sistema de Incêndio do Prédio do Centro Administrativo Municipal – Bloco B",
            "Data e hora da sessão pública ": "13/04/20 às 10h",
            "Modalidade de licitação": "sem modalidade definida",
            "Edital": "_",
            "Link": "http://riobonito.rj.gov.br/licitacoes/documento.php?doc=1244",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia e Obras (Civil, Hídrica, Elétrica e Acústica)",
            "Órgão": "Prefeitura Rio Bonito - RJ",
            "Objeto resumido": "Contratação de empresa de engenharia para serviços de Complementação da Instalação Predial do Sistema de Incêndio do Prédio do Centro Administrativo Municipal – Bloco B",
            "Data e hora da sessão pública ": "13/04/20 às 10h",
            "Modalidade de licitação": "sem modalidade definida",
            "Edital": "_",
            "Link": "http://riobonito.rj.gov.br/licitacoes/documento.php?doc=1244",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Sustentabilidade",
            "Órgão": "Belo Horizonte - MG",
            "Objeto resumido": "Serviços de elaboração de Relatório de Avaliação de Impacto ao Patrimônio Imaterial nos municípios mineiros de Almenara, Salto da Divisa e Jacinto, visando atender a demanda do Iphan, realizada no âmbito do processo de licenciamento ambiental da Implantação e Pavimentação da rodovia BR-367/MG; Trecho: Divisa BA/MG (Salto da Divisa) Entr. BR-259 (B) (Gouveia); Subtrecho: Divisa BA/MG (Salto da Divisa) Entr. MG-406 (Almenara);Segmento: km 0,00 km 61,60; Extensão:61,60 km.,",
            "Data e hora da sessão pública ": "09/04/2020 – 10:00 h",
            "Modalidade de licitação": "Pregão eletrônico",
            "Edital": "97/2020",
            "Link": "http://comprasnet.gov.br/ConsultaLicitacoes/download/download_editais_detalhe.asp?coduasg=393031&modprp=5&numprp=972020",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Gráfica e Impressão",
            "Órgão": "Barra Mansa/RJ - Fundo Municipal de Saúde de Barra Mansa/RJ",
            "Objeto resumido": "CONTRATAÇÃO DE EMPRESA ESPECIALIZADA EM CONFECÇÃO DE MATERIAL gráfico.",
            "Data e hora da sessão pública ": "27/04/20 às 9h",
            "Modalidade de licitação": "Pregão",
            "Edital": "_",
            "Link": "https://www2.bbmnet.com.br/bbmnet/Licitacao/DetalharEdital.aspx?Edital=23348",
            "Situação": "Em aberto",
            "Observações": "Participação Exclusiva ME/EPP/COOP"
        },
        {
            "Categoria de Atividade": "Gráfica e Impressão",
            "Órgão": "Carmo da Paranaíba/MG",
            "Objeto resumido": "O objeto da presente licitação é a contratação de empresa para aquisição de material gráfico de boletos de IPTU - Imposto Predial Territorial Urbano do exercício de 2020, conforme especificações detalhadas no Projeto Básico/Termo de Referência.",
            "Data e hora da sessão pública ": "14/04/20209 às 12h59min",
            "Modalidade de licitação": "Pregão eletrônico",
            "Edital": "02/20",
            "Link": "http://www.diariomunicipal.com.br/amm-mg/materia/8C6C3AB0",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Gráfica e Impressão",
            "Órgão": "Nova serrana/MG",
            "Objeto resumido": "PRESTAÇÃO DE SERVIÇOS DE CONFECÇÃO DE MATERIAIS GRÁFICOS PARA ATENDER AS NECESSIDADES DAS SECRETARIAS MUNIICIPAIS DE NOVA SERRANA-MG.",
            "Data e hora da sessão pública ": "29/04/2020 HORÁRIO: 12:30 HORAS",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "35/20",
            "Link": "https://www.novaserrana.mg.gov.br/download_editais.php?cod=3786",
            "Situação": "Em aberto",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia Ambiental",
            "Órgão": "Monstes Claros/MG [CODANORTE - Consórcio Intermunicipal para o Desenvolvimento Sustentável do Norte de Minas]",
            "Objeto resumido": "Contratação de pessoa jurídica para prestar serviços de engenharia ambiental",
            "Data e hora da sessão pública ": "27/04/2020 A PARTIR DAS 14:30",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "12/20",
            "Link": "http://codanorte.mg.gov.br/wp-content/uploads/2020/04/012-PREG%C3%83O-006-2020-SERV.-ENG%C2%AA-AMBIENTAL-EDITAL.pdf",
            "Situação": "Em aberto",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia Ambiental",
            "Órgão": "ESTADO DO PARANÁ - DER",
            "Objeto resumido": "Seleção de Consultores para Elaboração de Estudos Ambientais (EIA/RIMA) e Projetos Básico e Executivo de Engenharia para Implantação da Ponte sobre a Baía de Guaratuba",
            "Data e hora da sessão pública ": "16/04/2020",
            "Modalidade de licitação": "Manifestação de interesse",
            "Edital": "_",
            "Link": "http://www.comprasparana.pr.gov.br/modules/conteudo/conteudo.php?conteudo=31",
            "Situação": "Encerrado",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Engenharia Ambiental",
            "Órgão": "Pedra do Indaiá - MG",
            "Objeto resumido": "ESTADO DE MINAS GERAIS PREFEITURA DE PEDRA DO INDAIÁ PREFEITURA MUNICIPAL DE PEDRA DO INDAIÁ PROCESSO 041/2020 - TOMADA DE PREÇOS 004/2020 AVISO DE LICITAÇÃO O Município de Pedra do Indaiá comunica que irá realizar Procedimento licitatório nº. 041/2020 modalidade Tomada de Preços 004/2020, que tem por objeto a contratação de empresa especializada para prestação de serviços necessários a elaboração de projetos do Aterro Sanitário e documentação para licenciamento ambiental, conforme especificações e condições constantes no Termo de Referência e demais anexos do Edital",
            "Data e hora da sessão pública ": "08:45 horas do dia 30 de Abril de 2020",
            "Modalidade de licitação": "Tomada de Preços",
            "Edital": "04/20",
            "Link": "http://www.diariomunicipal.com.br/amm-mg/materia/556D1122/03AHaCkAa9dKItUaKN179k4N2EBPcZCFlVbJRJMp2_hZg7ItEvR0iT1tBcW2yZZgm0mM0CAVAvmvXIZ6CBCyKBUQz95JEjVY-Weo-tNoxtKDUb0_wYQMTMdkZs2lh-LG8eKuSMzcdDtj9OG7qJm-uY9wD5ild-MU8UKMFFDI-1TSQho_i0BFW6PRL5MvFj5l5DwRTG3nQZ964s14Dm6vWDSLQ624kJ8mCz-xi2uJwL_VhsxtLScylTqzkoAmMFJvimYCgyNmqPI6SRgbvM1Qg2Q1x5r2YxPYRseKZDI27hYlyKQgy6Sl18zpQr0ksTO__lDlR3tpvqndSmLCbRmqxkm2oDkbSM2xUlDh7QYl5jY3RqiGtX_vdzS_O1066nmSz9YwFwj12uC5WXqrjkYdSFqyboL8Kx3tMl1Q",
            "Situação": "Em aberto",
            "Observações": "x"
        },
        {
            "Categoria de Atividade": "Aluguel de Som, Iluminação e Palco; Organização de  Festa",
            "Órgão": "Cássia/MG (Prefeitura)",
            "Objeto resumido": "Prestação de Serviços de Locação Som para Eventos Promovidos pela Administração Municipal Prestação de Serviços de Locação Som para Eventos Promovidos pela Administração Municipal",
            "Data e hora da sessão pública ": "28/04 às 8h",
            "Modalidade de licitação": "Pregão presencial",
            "Edital": "22/20",
            "Link": "https://www.cassia.mg.gov.br/portal/editais/0/1/750/",
            "Situação": "Em aberto",
            "Observações": "x"
        },
        {
            "Situação": "Em aberto",
            "Observações": "x"
        },
        {
            "Situação": "Em aberto",
            "Observações": "x"
        },
        {
            "Situação": "Em aberto",
            "Observações": "x"
        },
        {
            "Situação": "Em aberto",
            "Observações": "x"
        },
        {
            "Situação": "Em aberto",
            "Observações": "x"
        },
        {
            "Situação": "Em aberto",
            "Observações": "x"
        },
        {
            "Situação": "Em aberto",
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        },
        {
            "Observações": "x"
        }
    ],
    "Tabelas Referências": [
        {
            "undefined": "Observações"
        },
        {
            "undefined": "Nome"
        },
        {
            "undefined": "Exclusivo para MEi e MPE's"
        },
        {
            "undefined": "Exclusivo para empresas da região"
        },
        {
            "undefined": "Exclusivo para Agricultura Familiar e Empreendedor Rural"
        },
        {
            "undefined": "Exclusivo para MEi e MPE's e para empresas da região"
        },
        {
            "undefined": "Anulado"
        },
        {
            "undefined": "Revogado"
        },
        {
            "undefined": "Leilão"
        },
        {
            "undefined": "Dispensa"
        },
        {
            "undefined": "Inexibilidade"
        },
        {
            "undefined": "Tomada de Preços"
        },
        {
            "undefined": "Câmara Municipal de Dom Viçoso/MG"
        },
        {
            "undefined": "Câmara Municipal de Heliodora/MG"
        },
        {
            "undefined": "Câmara Municipal de Itajubá/MG"
        },
        {
            "undefined": "Câmara Municipal de Itamonte/MG"
        },
        {
            "undefined": "Câmara Municipal de Itanhandu/MG"
        },
        {
            "undefined": "Câmara Municipal de Jaceaba/MG"
        },
        {
            "undefined": "Câmara Municipal de Lavras/MG"
        },
        {
            "undefined": "Câmara Municipal de Maria da Fé/MG"
        },
        {
            "undefined": "Câmara Municipal de Marmelópolis/MG"
        },
        {
            "undefined": "Câmara Municipal de Natércia  - MG"
        },
        {
            "undefined": "Câmara Municipal de Ouro Fino/MG"
        },
        {
            "undefined": "Câmara Municipal de Paraisópolis/MG"
        },
        {
            "undefined": "Câmara Municipal de Passa Quatro/MG"
        },
        {
            "undefined": "Câmara Municipal de Pedralva/MG"
        },
        {
            "undefined": "Câmara Municipal de Piranguçu/MG"
        },
        {
            "undefined": "Câmara Municipal de Piranguinho/MG"
        },
        {
            "undefined": "Câmara Municipal de Poços de Caldas - MG"
        },
        {
            "undefined": "Câmara Municipal de Pouso Alegre/MG"
        },
        {
            "undefined": "Câmara Municipal de Pouso Alto/MG"
        },
        {
            "undefined": "Câmara Municipal de Santa Rita do Sapucaí/MG"
        },
        {
            "undefined": "Câmara Municipal de São José do Alegre/MG"
        },
        {
            "undefined": "Câmara Municipal de São Lourenço/MG"
        },
        {
            "undefined": "Câmara Municipal de São Sebastião da Bela Vista/MG"
        },
        {
            "undefined": "Câmara Municipal de São Sebastião do Rio Verde/MG"
        },
        {
            "undefined": "Câmara Municipal de São Tomé das Letras/MG"
        },
        {
            "undefined": "Câmara Municipal de Uberaba/MG"
        },
        {
            "undefined": "Câmara Municipal de Varginha/MG"
        },
        {
            "undefined": "Câmara Municipal de Virgínia/MG"
        },
        {
            "undefined": "Câmara Municipal de Wenceslau Braz/MG"
        },
        {
            "undefined": "CODANORTE - Consórcio Intermunicipal para o Desenvolvimento Sustentável do Norte de Minas "
        },
        {
            "undefined": "DNIT - Departamento Nacional de Infra-Estrutura de Transportes"
        },
        {
            "undefined": "Jaceaba/MG (Prefeitura)"
        },
        {
            "undefined": "João Pinheiro/MG (Câmara)"
        },
        {
            "undefined": "Natércia - MG (Prefeitura)"
        },
        {
            "undefined": "Prefeitura Municipal de  Cambuí/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Baependi/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Borda da Mata/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Brazópolis/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Cachoeira de Minas/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Carmo de Minas/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Caxambu/íMG "
        },
        {
            "undefined": "Prefeitura Municipal de Conceição das Pedras/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Conceição dos Ouros/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Congonhal/M"
        },
        {
            "undefined": "Prefeitura Municipal de Cristina/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Delfim Moreira/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Dom Viçoso/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Heliodora/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Itajubá/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Itamonte/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Itanhandu/MG"
        },
        {
            "undefined": "Prefeitura Municipal de João Pinheiro/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Lavras/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Maria da Fé/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Marmelópolis/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Ouro Fino/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Paraisópolis/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Passa Quatro/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Pedralva/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Piranguçu/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Piranguinho/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Poços de Caldas/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Pouso Alegre/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Pouso Alto/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Santa Rita do Sapucaí/MG (Câmara)"
        },
        {
            "undefined": "Prefeitura Municipal de Santa Vitória/MG"
        },
        {
            "undefined": "Prefeitura Municipal de São José do Alegre/MG"
        },
        {
            "undefined": "Prefeitura Municipal de São Lourenço/MG"
        },
        {
            "undefined": "Prefeitura Municipal de São Sebastião da Bela Vista/MG"
        },
        {
            "undefined": "Prefeitura Municipal de São Sebastião do Rio Verde"
        },
        {
            "undefined": "Prefeitura Municipal de São Tomé das Letras/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Uberaba/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Varginha/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Virgínia/MG"
        },
        {
            "undefined": "Prefeitura Municipal de Wenceslau Braz/MG "
        },
        {
            "undefined": "Secretaria de Infraestrutura e Meio Ambiente da Prefeitura de São Paulo"
        },
        {
            "undefined": "87"
        },
        {
            "undefined": "88"
        },
        {
            "undefined": "89"
        },
        {
            "undefined": "90"
        },
        {
            "undefined": "91"
        },
        {
            "undefined": "92"
        },
        {
            "undefined": "93"
        },
        {
            "undefined": "94"
        },
        {
            "undefined": "95"
        },
        {
            "undefined": "96"
        },
        {
            "undefined": "97"
        },
        {
            "undefined": "98"
        },
        {
            "undefined": "99"
        },
        {
            "undefined": "100"
        },
        {
            "undefined": "101"
        },
        {
            "undefined": "102"
        },
        {
            "undefined": "103"
        },
        {
            "undefined": "104"
        },
        {
            "undefined": "105"
        },
        {
            "undefined": "106"
        },
        {
            "undefined": "107"
        },
        {
            "undefined": "108"
        },
        {
            "undefined": "109"
        },
        {
            "undefined": "110"
        },
        {
            "undefined": "111"
        },
        {
            "undefined": "112"
        },
        {
            "undefined": "113"
        }
    ]
}
  ''';

}
