import 'package:flutter/material.dart';
import 'package:tienda/screens/crear_producto.dart';
import 'package:tienda/screens/inventario.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;

  final List<Widget> _pages = <Widget>[
    const Inventario(),
    const CrearProducto()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tienda"),
      ),
      body: _pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectIndex,
          onTap: (int value) {
            setState(() {
              _selectIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.inventory), label: 'Inventario'),
            BottomNavigationBarItem(
                icon: Icon(Icons.create), label: 'Crear Producto'),
          ]),
    );
  }
}
