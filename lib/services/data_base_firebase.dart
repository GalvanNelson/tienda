import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getComida() async {
  List comidaDB = [];

  CollectionReference collectionReferenceComida = db.collection("comidas");

  QuerySnapshot queryComida = await collectionReferenceComida.get();
  queryComida.docs.forEach((element) {
    comidaDB.add(element.data());
  });

  return comidaDB;
}
