import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore dbTienda = FirebaseFirestore.instance;

//* Crear datos en la tabla "Producto"
Future<void> crearProducto(String nombreItems, double precio) async {
  await dbTienda
      .collection("Inventario")
      .add({'nombre': nombreItems, 'precio': precio});
}

//* lee los datos almacenados en la tabla "Inventarios"
Future<List> getInventario() async {
  List getProductos = [];

  CollectionReference collectionReferenceInventario =
      dbTienda.collection("Inventario");

  QuerySnapshot queryInventario = await collectionReferenceInventario.get();
  for (var element in queryInventario.docs) {
    final Map<String, dynamic> data = element.data() as Map<String, dynamic>;
    final producto = {
      'uid': element.id,
      'nombre': data['nombre'],
      'precio': data['precio'].toString()
    };
    getProductos.add(producto);
  }

  return getProductos;
}

//* Actualizar comidas
Future<void> actualizarProducto(
    String uid, String newName, double newPrecio) async {
  await dbTienda
      .collection("Inventario")
      .doc(uid)
      .set({'nombre': newName, 'precio': newPrecio});
}
