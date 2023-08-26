import 'package:flutter/material.dart';
import 'package:tienda/const/string_const.dart';
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
        child: Image.asset('assets/imagenes/avocado.png'),
      ),
    );
  }
}
