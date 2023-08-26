import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:tienda/const/string_const.dart';
import 'package:tienda/models/cart_model.dart';
import 'package:tienda/provider/inventario_provider.dart';
import 'package:tienda/routes/routers.dart';
import 'package:tienda/services/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => InventarioProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: TITULO,
        initialRoute: '/',
        routes: routers,
        onGenerateRoute: (settings) {
          Navigator.of(context).pushReplacementNamed('/error404');
          return null;
        },
        theme: ThemeData(primarySwatch: Colors.green),
      ),
    );
  }
}
