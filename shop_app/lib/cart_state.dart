
import 'product.dart';

class CartState {
  final List<Product> items;
  final double totalCost;

  CartState({required this.items, required this.totalCost});

  CartState.initial() : items = [], totalCost = 0.0;

  CartState copyWith({List<Product>? items, double? totalCost}) {
    return CartState(
      items: items ?? this.items,
      totalCost: totalCost ?? this.totalCost,
    );
  }
}
