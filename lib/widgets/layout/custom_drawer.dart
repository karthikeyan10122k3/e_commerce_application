import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.red[200],
      child: ListView(
        children: [
          const DrawerHeader(child: Text('KarthiKart Menu')),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: const Text('Add Product'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/add-product');
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: const Text('Edit Product'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/edit-product/2');
            },
          ),
          ListTile(
            leading: Icon(Icons.production_quantity_limits),
            title: const Text("Previous Shopping"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/product-bought');
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.person),
          //   title: const Text("Profile"),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.pushNamed(context, '/profile');
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: const Text("Settings"),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.pushNamed(context, '/settings');
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text("LogOut"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}
