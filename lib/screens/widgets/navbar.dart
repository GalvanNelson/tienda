import 'package:flutter/material.dart';

class NavBarDrawaver extends StatelessWidget {
  const NavBarDrawaver({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Tienda Celestina'),
            accountEmail: Text('Tienda@gmail.com'),
          ),
          ListTile(
            leading: const Icon(Icons.storage),
            title: const Text('Inventario'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopify_sharp),
            title: const Text('Ventas'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/ventas');
            },
          ),
          ListTile(
            leading: const Icon(Icons.error),
            title: const Text('Error 404'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/error404');
            },
          )
        ],
      ),
    );
  }
}
