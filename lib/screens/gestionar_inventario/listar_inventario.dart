import 'package:flutter/material.dart';
import 'package:tienda/services/inventario_services.dart';

class ListarInventario extends StatefulWidget {
  const ListarInventario({super.key});

  @override
  State<ListarInventario> createState() => _ListarInventarioState();
}

class _ListarInventarioState extends State<ListarInventario> {
  TextEditingController buscarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: buscarController,
              decoration: const InputDecoration(hintText: "Buscar"),
              onChanged: (value) {
                setState(() {});
              },
            ),
            Expanded(
              child: FutureBuilder(
                future: getInventario(),
                builder: (context, snapshot) {
                  List? newSnapshot = snapshot.data;
                  if (snapshot.hasData) {
                    if (buscarController.text.isNotEmpty) {
                      newSnapshot = newSnapshot!
                          .where((element) =>
                              element['nombre'].contains(buscarController.text))
                          .toList();
                    }
                    return ListView.builder(
                      itemCount: newSnapshot?.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.asset('assets/imagenes/avocado.png'),
                          key: Key(newSnapshot?[index]['uid']),
                          title: Text(newSnapshot?[index]['nombre']),
                          subtitle: Text(newSnapshot?[index]['precio']),
                          onTap: () async {
                            await Navigator.pushNamed(
                                context, '/editarProducto',
                                arguments: {
                                  'uid': newSnapshot?[index]['uid'],
                                  'nombre': newSnapshot?[index]['nombre'],
                                  'precio': newSnapshot?[index]['precio']
                                });
                            setState(() {});
                          },
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('Cargando...'),
                    );
                  }
                },
              ),
            )
          ],
        ),
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
