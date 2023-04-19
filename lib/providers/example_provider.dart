import 'package:flutter/material.dart';

class ExampleProvider extends ChangeNotifier {
  int contador = 0;

  cambiarContador(int valor) {
    contador = valor;
    notifyListeners();
  }

  agregaContador() {
    contador++;
    notifyListeners();
  }
}