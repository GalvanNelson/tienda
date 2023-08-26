import 'package:flutter/material.dart';
import '../../models/inventario.dart';
import '../../services/data_base_inventario.dart';

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
        body: const FormRegistrarProducto());
  }
}

class FormRegistrarProducto extends StatefulWidget {
  const FormRegistrarProducto({super.key});

  @override
  State<FormRegistrarProducto> createState() => _FormRegistrarProductoState();
}

class _FormRegistrarProductoState extends State<FormRegistrarProducto> {
  final invetario = Inventario();
  final _formKey = GlobalKey<FormState>();
  TextEditingController nombreProductoController =
      TextEditingController(text: "");
  TextEditingController precioProductoController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: 'Nombre Producto'),
            controller: nombreProductoController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo requerido';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Precio'),
            keyboardType: TextInputType.number,
            controller: precioProductoController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo requerido';
              }
              return null;
            },
          ),
          ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await crearProducto(nombreProductoController.text,
                          double.parse(precioProductoController.text))
                      .then((_) => Navigator.pop(context));
                }
              },
              child: const Text('registrar')),
        ],
      ),
    );
  }
}
