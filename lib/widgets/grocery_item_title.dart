import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GregoryItemTitle extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  void Function()? onPressed;
  // ignore: prefer_typing_uninitialized_variables
  final color;

  GregoryItemTitle(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: color[100], borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //* image
            Image.asset(imagePath, height: 64),
            //* item name
            Text(itemName),
            //* price + button
            MaterialButton(
              onPressed: onPressed,
              color: color[800],
              child: Text(
                "Bs $itemPrice",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
