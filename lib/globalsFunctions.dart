

import 'package:connectivity/connectivity.dart';

class FunctionsGlobals{

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

}