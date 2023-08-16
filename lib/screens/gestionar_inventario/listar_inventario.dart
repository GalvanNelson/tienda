import 'package:flutter/material.dart';
import 'package:tienda/services/inventario_services.dart';
import '../../utils/datos_productos.dart';

class ListarInventario extends StatefulWidget {
  const ListarInventario({super.key});

  @override
  State<ListarInventario> createState() => _ListarInventarioState();
}

class _ListarInventarioState extends State<ListarInventario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getInventario(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data?[index]['nombre']),
                subtitle: Text(snapshot.data?[index]['precio']),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/crearProducto');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

/* class _InventarioState extends State<Inventario> {
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
} */