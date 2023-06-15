// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore dbTienda = FirebaseFirestore.instance;

//* lee los datos almacenados en la tabla "Comidas"
Future<List> getComida() async {
  List getComidas = [];

  CollectionReference collectionReferenceComida =
      dbTienda.collection("comidas");

  QuerySnapshot queryComida = await collectionReferenceComida.get();
  for (var element in queryComida.docs) {
    final Map<String, dynamic> data = element.data() as Map<String, dynamic>;
    final comida = {'nombre': data['nombre'], 'uid': element.id};
    getComidas.add(comida);
  }

  return getComidas;
}

//* Crear datos en la tabla "Comidas"
Future<void> crearComida(String nameComida) async {
  await dbTienda.collection("comidas").add({'nombre': nameComida});
}

//* Actualizar comidas
Future<void> actualizarComida(String uid, String newName) async {
  await dbTienda.collection("comidas").doc(uid).set({'nombre': newName});
}

//* Eliminar comida
Future<void> eliminarComida(String uid) async {
  await dbTienda.collection("comidas").doc(uid).delete();
}
