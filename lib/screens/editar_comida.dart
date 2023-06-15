import 'package:flutter/material.dart';
import 'package:tienda/services/data_base_firebase.dart';

class EditarComida extends StatefulWidget {
  const EditarComida({super.key});

  @override
  State<EditarComida> createState() => _EditarComidaState();
}

class _EditarComidaState extends State<EditarComida> {
  TextEditingController nameEditarComidaController =
      TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    //* recibe el dato del item seleccionado en listaComida
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    //* pasa el dato capturado en argumets
    nameEditarComidaController.text = arguments['name'];

    return Scaffold(
      appBar: AppBar(title: const Text('Editar Comida')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: nameEditarComidaController,
              decoration:
                  const InputDecoration(hintText: 'Nombre de la comida'),
            ),
            ElevatedButton(
              onPressed: () async {
                await actualizarComida(
                        arguments['uid'], nameEditarComidaController.text)
                    .then((_) => Navigator.pop(context));
              },
              child: const Text("Actualizar"),
            )
          ],
        ),
      ),
    );
  }
}
