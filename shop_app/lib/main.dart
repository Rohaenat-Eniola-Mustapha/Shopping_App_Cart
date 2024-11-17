
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_bloc.dart';
import 'cart_event.dart';
import 'product.dart';
import 'shopping_cart_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => CartBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc(),
      child: MaterialApp(
        title: 'Shopping Cart App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductListScreen(),
      ),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  final List<Product> products = [
    Product(name: "Laptop", price: 1000, imageUrl: "https://www.techtarget.com/rms/onlineimages/hp_elitebook.jpg"),
    Product(name: "Smartphone", price: 500, imageUrl: "https://cdn.thewirecutter.com/wp-content/media/2024/05/smartphone-2048px-1013.jpg"),
    Product(name: "Headphones", price: 150, imageUrl: "https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/12/3411431/1.jpg?6628"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(product.imageUrl),
              title: Text(product.name),
              subtitle: Text("\$${product.price}"),
              trailing: IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  context.read<CartBloc>().add(AddItem(product));
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ShoppingCartScreen()),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
