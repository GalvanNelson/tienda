import 'package:tienda/models/producto.dart';

class Inventario extends Producto {
  final List _listaInventario = [];

  Inventario({
    String? nombreProducto,
    double? precio,
  }) : super(nombreProducto, precio);

  get listaInvenatrio => _listaInventario;

  void adicionarProducto(String nombreProducto, double precio) {
    _listaInventario.add(Producto(nombreProducto, precio));
  }
}
