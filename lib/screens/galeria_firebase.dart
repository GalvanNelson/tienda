import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tienda/services/select_image.dart';

class GaleriaFireBase extends StatefulWidget {
  const GaleriaFireBase({super.key});

  @override
  State<GaleriaFireBase> createState() => _GaleriaFireBaseState();
}

class _GaleriaFireBaseState extends State<GaleriaFireBase> {
  File? imageToUp;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          imageToUp != null
              ? Image.file(imageToUp!)
              : Container(
                  margin: const EdgeInsets.all(10),
                  height: 200,
                  width: double.infinity,
                  color: Colors.red,
                ),
          ElevatedButton(
              onPressed: () async {
                final imagen = await getImage();
                setState(() {
                  imageToUp = File(imagen!.path);
                });
              },
              child: const Text("Seleccionar imagen")),
          ElevatedButton(
              onPressed: () {}, child: const Text("Subir a Firebase")),
        ],
      ),
    );
  }
}
