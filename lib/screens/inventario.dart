import 'package:flutter/material.dart';

class Inventario extends StatefulWidget {
  const Inventario({super.key});

  @override
  State<Inventario> createState() => _InventarioState();
}

class _InventarioState extends State<Inventario> {
  final itemPrueba = [
    'Albania',
    'Andorra',
    'Armenia',
    'Austria',
    'Azerbaijan',
    'Belarus',
    'Belgium',
    'Bosnia and Herzegovina',
    'Bulgaria',
    'Croatia',
    'Cyprus',
    'Albania',
    'Andorra',
    'Armenia',
    'Austria',
    'Azerbaijan',
    'Belarus',
    'Belgium',
    'Bosnia and Herzegovina',
    'Bulgaria',
    'Croatia',
    'Cyprus'
  ];

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
