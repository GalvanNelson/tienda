import 'package:flutter/material.dart';
import 'package:tienda/services/data_base_firebase.dart';

class ListarComida extends StatefulWidget {
  const ListarComida({super.key});

  @override
  State<ListarComida> createState() => _ListarComidaState();
}

class _ListarComidaState extends State<ListarComida> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getComida(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                //* Dismissible crear el efecto de eliminar un dato deslizando el item de izquierda a derecha
                return Dismissible(
                  onDismissed: (direction) async {
                    await eliminarComida(snapshot.data?[index]['uid']);
                    snapshot.data?.removeAt(index);
                  },
                  confirmDismiss: (direction) async {
                    bool result = false;
                    result = await showDialog(
                      context: context,
                      builder: (context) {
                        //* Se crear un modal para confirmar la eliminacion de un item
                        return AlertDialog(
                          title: Text(
                              '¿Desea eliminar ${snapshot.data?[index]['nombre']}?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  return Navigator.pop(context, false);
                                },
                                child: const Text('Cancelar')),
                            TextButton(
                                onPressed: () {
                                  return Navigator.pop(context, true);
                                },
                                child: const Text('Confirmar'))
                          ],
                        );
                      },
                    );

                    return result;
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  direction: DismissDirection.startToEnd,
                  key: Key(snapshot.data?[index]['uid']),
                  child: ListTile(
                    title: Text(snapshot.data?[index]['nombre']),
                    onTap: () async {
                      await Navigator.pushNamed(context, '/editarComida',
                          arguments: {
                            'name': snapshot.data?[index]['nombre'],
                            'uid': snapshot.data?[index]['uid']
                          });
                      setState(() {});
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text("Cargando..."),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        //* este metodo se usa para que al volver de registrar un dato este se actualize automaticamente
        onPressed: () async {
          await Navigator.pushNamed(context, '/crearComida');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
