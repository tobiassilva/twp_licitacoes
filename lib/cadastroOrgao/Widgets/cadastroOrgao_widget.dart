import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:twp_licitacoes/cadastroOrgao/cadastroOrgao_functions.dart';
import 'package:twp_licitacoes/cadastroOrgao/cadastroOrgao_page.dart';
import '../../globals.dart';


class dropdownOrgao{
  /*var jsonOrgao;
List<DropdownMenuItem<String>> dropDownMenuItems;
Future<String> getOrgaoEmissor() async {
  var data = await http.get(
      "http://itajuba.myscriptcase.com/scriptcase/devel/conf/grp/Procon/libraries/php/orgao_emissor.php");
  jsonOrgao = json.decode(data.body);
  print(jsonOrgao['orgao_emissor'][0]['nome']);
  print(jsonOrgao['orgao_emissor']);
  dropDownMenuItems = _getDropDownMenuItems(jsonOrgao);
  //opcaoOrgaoEmissor = null;
  return 'sucesso';
}

List<DropdownMenuItem<String>> _getDropDownMenuItems(jsonData) {
  List<DropdownMenuItem<String>> items = new List();
  int qtde = jsonData['orgao_emissor'].length;
  int i;
  items.add(new DropdownMenuItem(
    value: '',
    child: Text('Selecione...', style: TextStyle(
      color: Colors.black54,),),
  ));
  for (i = 0; i < qtde; i++) {
    items.add(new DropdownMenuItem(
      value: jsonData['orgao_emissor'][i]['id'],
      child: new Text(jsonData['orgao_emissor'][i]['nome'],
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.black,
          )),
    ));
  }
  return items;
}*/

/*void changedDropDownItem(String itemSelecionado) {
    int i;
    setState(() {
      print(itemSelecionado);
      print(DIglobal.jsonOrgao['orgao_emissor'].length);
      DIglobal.opcaoOrgaoEmissor = itemSelecionado;
      for (i = 0; i < DIglobal.jsonOrgao['orgao_emissor'].length; i++) {
        if (DIglobal.jsonOrgao['orgao_emissor'][i]['id'] == DIglobal.opcaoOrgaoEmissor) {
          itemSel = i;
          DIglobal.formOrgaoEmissor.text = DIglobal.opcaoOrgaoEmissor;
          return;
        }
      }
      DIglobal.formOrgaoEmissor.text = '';
    });
  }*/

}
