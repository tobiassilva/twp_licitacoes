import 'package:flutter/material.dart';


class StyleGlobals {
    /// CORES DO APP
    var primaryColor = Colors.orange;
    var secundaryColor = Colors.white;
    var tertiaryColor = Colors.blueAccent;//Color(0xFF447DEB);

    /// CORES DE TEXTO
    var textColorForte = Color(0xFF1C1915);
    var textColorMedio = Color(0xFF797979);
    var textColorFraco = Color(0xFFB5B5B5);
    var textColorSecundary = Colors.white;
    var textColorTransparent = Colors.white70;

    var colorGradiente = LinearGradient(
        colors: [ Colors.orange, Colors.orangeAccent]
    );

    /// TAMANHO DE TEXTO
    var sizeTitulo = 24.0;
    var sizeText = 14.0;
    var sizeTextMedio = 16.0;
    var sizeSubtitulo = 18.0;
}

