import 'package:flutter/material.dart';
import '../../utils/datos_productos.dart';

class Inventario extends StatefulWidget {
  const Inventario({super.key});

  @override
  State<Inventario> createState() => _InventarioState();
}

class _InventarioState extends State<Inventario> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemPrueba.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(itemPrueba[index]),
        );
      },
    );
  }
}
