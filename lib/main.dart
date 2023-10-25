import 'package:flutter/material.dart';
import 'package:movieapp_170755/home.dart';

void main() {
  // Función principal del programa
  runApp(new MaterialApp(
    // Inicializa la aplicación Flutter
    debugShowCheckedModeBanner:
        false, // Desactiva la etiqueta de depuración en la esquina superior derecha de la aplicación
    home:
        Home(), // Define la pantalla de inicio de la aplicación como una instancia de la clase Home
    theme: new ThemeData
        .dark(), // Establece el tema de la aplicación como un tema oscuro
  ));
}
