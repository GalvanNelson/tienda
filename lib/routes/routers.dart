import 'package:tienda/screens/ventas/registrar_venta.dart';

import '../screens/404/error404.dart';
import '../screens/gestionar_comidas/crear_comida.dart';
import '../screens/gestionar_comidas/editar_comida.dart';
import '../screens/gestionar_inventario/crear_producto.dart';
import '../screens/gestionar_inventario/editar_producto.dart';
import '../screens/gestionar_inventario/listar_inventario.dart';
import '../screens/home_screen.dart';

final routers = {
  '/': (context) => const HomeScreen(),
  '/listarInventario': (context) => const ListarInventario(),
  '/crearComida': (context) => const GuardarComida(),
  '/editarComida': (context) => const EditarComida(),
  '/crearProducto': (context) => const CrearProducto(),
  '/editarProducto': (context) => const EditarProducto(),
  '/error404': (context) => const Error404(),
  '/ventas': (context) => const RegistrarVentas()
};
