import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda/models/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              //* list of cart items
              Expanded(
                  child: ListView.builder(
                itemCount: value.cartItems.length,
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: Image.asset(
                          value.cartItems[index][2],
                          height: 36,
                        ),
                        title: Text(value.cartItems[index][1]),
                        // ignore: prefer_interpolation_to_compose_strings
                        subtitle: Text("Bs" + value.cartItems[index][1]),
                        trailing: IconButton(
                            onPressed: () =>
                                Provider.of<CartModel>(context, listen: false)
                                    .removeFromCart(index),
                            icon: const Icon(Icons.cancel)),
                      ),
                    ),
                  );
                },
              )),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //* price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(color: Colors.grey[100]),
                          ),
                          Text(
                            "Bs ${value.calcularTotal()}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      //* pay now button
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade200),
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(12),
                        child: const Row(
                          children: [
                            Text(
                              "Pay Now",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
