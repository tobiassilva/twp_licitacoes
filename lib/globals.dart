import 'package:flutter/material.dart';


class StyleGlobals {
    /// CORES DO APP
    var primaryColor = Colors.orange;
    var secundaryColor = Colors.white;
    var tertiaryColor = Colors.blueAccent;//Color(0xFF447DEB);

    /// CORES DE TEXTO
    var textColorForte = Colors.grey.shade800;
    var textColorMedio = Color(0xFF797979);
    var textColorFraco = Colors.grey.shade600;
    var textColorSecundary = Colors.white;

    var colorGradiente = LinearGradient(
        colors: [ Colors.orange, Colors.orangeAccent]
    );

    /// TAMANHO DE TEXTO
    var sizeTitulo = 24.0;
    var sizeText = 14.0;
    var sizeTextMedio = 16.0;
    var sizeSubtitulo = 18.0;
}

