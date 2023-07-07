import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tienda/models/cart_model.dart';
import '../../widgets/index.dart';
import '../index.dart';

class GaleriaComida extends StatelessWidget {
  const GaleriaComida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const CartPage();
            },
          )),
          backgroundColor: Colors.black,
          child: const Icon(Icons.shopping_bag),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              //* good morning
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text("Good Morning")),
              const SizedBox(height: 4),
              //* Let's order fresh items for you
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "Pedidos",
                    style: GoogleFonts.notoSerif(
                        fontSize: 36, fontWeight: FontWeight.bold),
                  )),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Divider()),
              const SizedBox(height: 24),
              //* fresh items + grid
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "Platillos",
                    style: TextStyle(fontSize: 16),
                  )),
              Expanded(child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                      itemCount: value.shopItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                      itemBuilder: (context, index) {
                        return GregoryItemTitle(
                          itemName: value.shopItems[index][0],
                          itemPrice: value.shopItems[index][1],
                          imagePath: value.shopItems[index][2],
                          onPressed: () {
                            Provider.of<CartModel>(context, listen: false)
                                .addItemToCart(index);
                          },
                        );
                      });
                },
              ))
            ],
          ),
        ));
  }
}
