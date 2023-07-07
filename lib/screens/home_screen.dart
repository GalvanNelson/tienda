import 'package:flutter/material.dart';
import 'package:tienda/screens/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;

  final List<Widget> _pages = <Widget>[
    //const Inventario(),
    const ListarComida(),
    const GaleriaComida(),
    const GaleriaFireBase(),
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
                icon: Icon(Icons.food_bank), label: 'Comidas'),
            BottomNavigationBarItem(
                icon: Icon(Icons.food_bank_outlined), label: 'pedidos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.photo), label: 'FirebaseImagenes')
          ]),
    );
  }
}
