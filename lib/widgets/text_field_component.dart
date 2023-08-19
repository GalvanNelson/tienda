import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldComponent extends StatelessWidget {
  final TextEditingController textEditingController;
  String inputHintText = "";
  String inputLabelText = "";

  TextFieldComponent(
      {super.key,
      required this.textEditingController,
      required this.inputHintText,
      required this.inputLabelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          hintText: inputHintText,
          border: const OutlineInputBorder(),
          labelText: inputLabelText),
    );
  }
}
