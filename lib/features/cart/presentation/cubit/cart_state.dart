part of 'cart_cubit.dart';

@immutable
sealed class CartState {}
final class CartInitial extends CartState {}

class AddProductToCartState extends CartState {}

class UpdateProductQuantityState extends CartState {}

class RemoveProductState extends CartState {}

class ClearAllCartState extends CartState {}


