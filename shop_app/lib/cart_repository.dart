
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'product.dart';

class CartRepository {
  Future<void> saveCart(List<Product> items) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = items.map((e) => json.encode({
      'name': e.name,
      'price': e.price,
      'imageUrl': e.imageUrl,
    })).toList();
    await prefs.setStringList('cart', jsonList);
  }

  Future<List<Product>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList('cart') ?? [];
    return jsonList.map((jsonStr) {
      final jsonMap = json.decode(jsonStr);
      return Product(
        name: jsonMap['name'],
        price: jsonMap['price'],
        imageUrl: jsonMap['imageUrl'],
      );
    }).toList();
  }
}
