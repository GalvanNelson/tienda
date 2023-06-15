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
                return Text(snapshot.data?[index]['nombre']);
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
