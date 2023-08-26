import 'package:flutter/material.dart';
import 'package:tienda/const/string_const.dart';
import 'navbar.dart';

class HeaderScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  const HeaderScaffold(
      {super.key, required this.body, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      drawer: const NavBarDrawaver(),
      appBar: AppBar(
        title: const Text(TITULO),
      ),
      body: body,
    );
  }
}
