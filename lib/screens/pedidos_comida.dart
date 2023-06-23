import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'index.dart';

class PedidosComida extends StatefulWidget {
  const PedidosComida({super.key});

  @override
  State<PedidosComida> createState() => _PedidosComidaState();
}

class _PedidosComidaState extends State<PedidosComida> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //* Logo
          Padding(
            padding: const EdgeInsets.only(
                left: 80.0, right: 80, bottom: 10, top: 50),
            child: Image.asset('imgs/stich.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "we delivery groceries",
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(),
            ),
          ),
          const Text("Fresh Item Everyday"),
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const GaleriaComida();
              },
            )),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(24),
              child: const Text(
                "Get Stated",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
