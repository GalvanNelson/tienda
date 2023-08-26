import 'package:flutter/material.dart';
import 'package:tienda/models/inventario.dart';
import 'package:tienda/screens/widgets/header.dart';

class RegistrarVentas extends StatefulWidget {
  const RegistrarVentas({super.key});

  @override
  State<RegistrarVentas> createState() => _RegistrarVentasState();
}

class _RegistrarVentasState extends State<RegistrarVentas> {
  @override
  Widget build(BuildContext context) {
    return HeaderScaffold(
      body: Container(
        alignment: Alignment.center,
        child: FormRegistrarProducto(),
      ),
    );
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
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  invetario.adicionarProducto(nombreProductoController.text,
                      double.parse(precioProductoController.text));
                }
              },
              child: const Text('registrar'))
        ],
      ),
    );
  }
}
