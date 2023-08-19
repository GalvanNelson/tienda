import 'package:flutter/material.dart';
import 'package:tienda/services/data_base_firebase.dart';
import '../../services/inventario_services.dart';
import '../../widgets/index.dart';

class EditarProducto extends StatefulWidget {
  const EditarProducto({super.key});

  @override
  State<EditarProducto> createState() => _EditarProductoState();
}

class _EditarProductoState extends State<EditarProducto> {
  TextEditingController editarNombreProductoController =
      TextEditingController(text: "");
  TextEditingController editarPrecioProductoController =
      TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    //* recibe el dato del item seleccionado en listaComida
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    //* pasa el dato capturado en argumets
    editarNombreProductoController.text = arguments['nombre'];
    editarPrecioProductoController.text = arguments['precio'];

    return Scaffold(
      appBar: AppBar(title: const Text('Editar Producto')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFieldComponent(
                textEditingController: editarNombreProductoController,
                inputHintText: "Nuevo Nombre Producto",
                inputLabelText: "Producto"),
            Flexible(
                flex: 1,
                child: Container(
                  height: 20,
                )),
            TextField(
              controller: editarPrecioProductoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: 'Precio',
                  border: const OutlineInputBorder(),
                  labelText: "Nuevo Precio"),
            ),
            ElevatedButtonComponent(
              onPressed: () async {
                await actualizarProducto(
                        arguments['uid'],
                        editarNombreProductoController.text,
                        double.parse(editarPrecioProductoController.text))
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
