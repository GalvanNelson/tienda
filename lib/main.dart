import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:tienda/models/cart_model.dart';
import 'package:tienda/services/firebase_options.dart';
import 'screens/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tienda',
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/crearComida': (context) => const GuardarComida(),
          '/editarComida': (context) => const EditarComida()
        },
        theme: ThemeData(primarySwatch: Colors.green),
      ),
    );
  }
}
