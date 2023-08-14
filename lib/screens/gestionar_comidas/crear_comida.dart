import 'package:flutter/material.dart';
import 'package:tienda/services/data_base_firebase.dart';

class GuardarComida extends StatefulWidget {
  const GuardarComida({super.key});

  @override
  State<GuardarComida> createState() => _GuardarComidaState();
}

class _GuardarComidaState extends State<GuardarComida> {
  //* controlador de text edit
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController precioController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Nueva Comida'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration:
                  const InputDecoration(hintText: 'Ingrese nueva Comida'),
            ),
            TextField(
              controller: precioController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Precio'),
            ),
            ElevatedButton(
                onPressed: () async {
                  //* el ".then" se ejecuta despues de terinar el "await"
                  await crearComida(nameController.text,
                          double.parse(precioController.text))
                      .then((_) => Navigator.pop(context));
                },
                child: const Text('Guardar'))
          ],
        ),
      ),
    );
  }
}
