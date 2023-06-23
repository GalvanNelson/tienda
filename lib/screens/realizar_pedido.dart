import 'package:flutter/material.dart';

class RealizarPedido extends StatefulWidget {
  const RealizarPedido({super.key});

  @override
  State<RealizarPedido> createState() => _RealizarPedidoState();
}

class _RealizarPedidoState extends State<RealizarPedido> {
  TextEditingController textNombreComida = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: const [
          ListTile(
            title: Text('data'),
          ),
          ListTile(
            title: Text('data2'),
          )
        ],
      ),
    );
  }
}
