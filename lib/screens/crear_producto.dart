import 'package:flutter/material.dart';
import 'package:tienda/services/data_base_firebase.dart';

class CrearProducto extends StatefulWidget {
  const CrearProducto({super.key});

  @override
  State<CrearProducto> createState() => _CrearProductoState();
}

class _CrearProductoState extends State<CrearProducto> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getComida(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return Text(snapshot.data?[index]['nombre']);
            },
          );
        } else {
          return const Center(
            child: Text("Cargando..."),
          );
        }
      },
    );
  }
}
