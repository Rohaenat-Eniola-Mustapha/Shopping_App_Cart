import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';
import 'product.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState.initial()) {
    // Register the event handlers
    on<AddItem>(_onAddItem);
    on<RemoveItem>(_onRemoveItem);
    on<ClearCart>(_onClearCart);
  }

  // Event handler for AddItem
  void _onAddItem(AddItem event, Emitter<CartState> emit) {
    final updatedItems = List<Product>.from(state.items)..add(event.product);
    final updatedTotalCost = state.totalCost + event.product.price;
    emit(state.copyWith(items: updatedItems, totalCost: updatedTotalCost));
  }

  // Event handler for RemoveItem
  void _onRemoveItem(RemoveItem event, Emitter<CartState> emit) {
    final updatedItems = List<Product>.from(state.items)..remove(event.product);
    final updatedTotalCost = state.totalCost - event.product.price;
    emit(state.copyWith(items: updatedItems, totalCost: updatedTotalCost));
  }

  // Event handler for ClearCart
  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    emit(CartState.initial());
  }
}
