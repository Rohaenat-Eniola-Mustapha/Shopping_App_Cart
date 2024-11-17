
import 'product.dart';

abstract class CartEvent {}

class AddItem extends CartEvent {
  final Product product;

  AddItem(this.product);
}

class RemoveItem extends CartEvent {
  final Product product;

  RemoveItem(this.product);
}

class ClearCart extends CartEvent {}
