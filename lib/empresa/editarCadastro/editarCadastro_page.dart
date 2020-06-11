import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:twp_licitacoes/empresa/editarCadastro/editarCadastro_widget.dart';

import '../../globals.dart';
import 'editarCadastro_functions.dart';

class EditarCadastroPage extends StatefulWidget {
  @override
  _EditarCadastroPageState createState() => _EditarCadastroPageState();
}

class _EditarCadastroPageState extends State<EditarCadastroPage> {

  EditarCadastroFunctions editarCadastroFunctions;
  bool _carregando = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_carregaPagina();
  }

  int aux=0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    editarCadastroFunctions = Provider.of<EditarCadastroFunctions>(context);

    if(aux == 0){
      _carregaPagina();
      aux = 1;
    }

  }

  Future _carregaPagina() async {
    await editarCadastroFunctions.verificaUser();

    setState(() {
      _carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    EditarCadastroWidget editarCadastroWidget = EditarCadastroWidget(context);
    return Scaffold(
      body: _carregando ? SpinKitThreeBounce(
          color: StyleGlobals().primaryColor,
          size: StyleGlobals().sizeTitulo,
        )
          : editarCadastroWidget.editarWidget(),
    );
  }
}
