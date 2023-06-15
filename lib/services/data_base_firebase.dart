import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore dbTienda = FirebaseFirestore.instance;

//* lee los datos almacenados en la tabla "Comidas"
Future<List> getComida() async {
  List comidaDB = [];

  CollectionReference collectionReferenceComida =
      dbTienda.collection("comidas");

  QuerySnapshot queryComida = await collectionReferenceComida.get();
  for (var element in queryComida.docs) {
    comidaDB.add(element.data());
  }

  return comidaDB;
}

//* Crear datos en la tabla "Comidas"
Future<void> crearComida(String nameComida) async {
  await dbTienda.collection("comidas").add({'nombre': nameComida});
}
