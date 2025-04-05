import 'package:e_commerce_application/screens/(Auth)/login_screen.dart';
import 'package:e_commerce_application/screens/add_product_screen.dart';
import 'package:e_commerce_application/screens/cart_screen.dart';
import 'package:e_commerce_application/screens/edit_product_screen.dart';
import 'package:e_commerce_application/screens/home_screen.dart';
import 'package:e_commerce_application/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        // colorScheme: ColorScheme.dark(),

        // textTheme: const TextTheme(
        //   bodyLarge: TextStyle(color: Colors.red),
        //   bodyMedium: TextStyle(color: Colors.red),
        //   titleLarge: TextStyle(color: Colors.red),
        //   // Add more styles if needed
        // ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/add-product': (context) => const AddProductScreen(),
        '/login': (context) => const LoginScreen(),
        '/cart': (context) => const CartScreen(),
        '/profile': (context) => const CartScreen(),
      },
      onGenerateRoute: (settings) {
        final uri = Uri.parse(settings.name!);
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments[0] == 'product-detail') {
          final id = uri.pathSegments[1];
          return MaterialPageRoute(
            builder: (context) => ProductDetailScreen(productId: id),
          );
        }
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments[0] == 'edit-product') {
          final id = uri.pathSegments[1];
          return MaterialPageRoute(
            builder: (context) => EditProductScreen(productId: id),
          );
        }
        return null; // Unknown route
      },
    );
  }
}
