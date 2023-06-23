import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore dbTienda = FirebaseFirestore.instance;

Future<void> crearPedido(String nombreComida, bool entregado) async {
  await dbTienda.collection("pedidos").add({
    'nombreComida': nombreComida,
    'entregado': entregado,
  });
}
