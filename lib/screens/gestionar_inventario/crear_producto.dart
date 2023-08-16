import 'package:flutter/material.dart';
import '../../services/inventario_services.dart';

class CrearProducto extends StatefulWidget {
  const CrearProducto({super.key});

  @override
  State<CrearProducto> createState() => _CrearProductoState();
}

class _CrearProductoState extends State<CrearProducto> {
  //* controlador de text edit
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController precioController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Nuevo Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration:
                  const InputDecoration(hintText: 'Ingrese nuevo producto'),
            ),
            TextField(
              controller: precioController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Precio'),
            ),
            ElevatedButton(
                onPressed: () async {
                  //* el ".then" se ejecuta despues de terinar el "await"
                  await crearProducto(nameController.text,
                          double.parse(precioController.text))
                      .then((_) => Navigator.pop(context));
                },
                child: const Text('Guardar Producto'))
          ],
        ),
      ),
    );
  }
}
