import 'package:flutter/material.dart';

class InventarioProvider extends ChangeNotifier {
  int _cantidad = 0;

  //* muestra el valor de _cantidad
  int get cantidad => _cantidad;

  //* modifica el valor de cantidad
  set cantidad(int nuevaCantidad) {
    _cantidad = nuevaCantidad;
    notifyListeners();
  }

  void incrementCantidad() {
    _cantidad++;
    notifyListeners();
  }
}
