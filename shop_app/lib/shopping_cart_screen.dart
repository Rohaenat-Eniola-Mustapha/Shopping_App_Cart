
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              final item = state.items[index];
              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(item.name),
                  subtitle: Text("\$${item.price}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      context.read<CartBloc>().add(RemoveItem(item));
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomSheet: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total: \$${state.totalCost.toStringAsFixed(2)}"),
                ElevatedButton(
                  onPressed: () {
                    context.read<CartBloc>().add(ClearCart());
                  },
                  child: const Text("Clear Cart"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
