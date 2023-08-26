import 'package:flutter/material.dart';
import '../../const/index.dart';
import '../widgets/header.dart';

class Error404 extends StatelessWidget {
  const Error404({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderScaffold(
        body: Container(
      alignment: Alignment.center,
      child: const Text(ERROR404),
    ));
  }
}
