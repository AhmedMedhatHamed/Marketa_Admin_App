import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa_admin/features/cart/data/models/cart_model.dart';
import 'package:marketa_admin/features/product/data/models/product_model.dart';
import 'package:marketa_admin/features/product/presentation/cubit/product_cubit.dart';
import 'package:uuid/uuid.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final Map<String, CartModel> cartItems = {};

  Map<String, CartModel> get getCartItems {
    return cartItems;
  }

  bool isProductInCart({required String productId}) {
    return cartItems.containsKey(productId);
  }

  Future<void> addProductToCart({required String productId}) async {
    cartItems.putIfAbsent(
      productId,
      () => CartModel(productId: productId, cartId: Uuid().v4(), quantity: 1),
    );
    emit(AddProductToCartState());
  }

  Future<void> updateProductQuantity({
    required String productId,
    required int quantity,
  }) async {
    cartItems.update(
      productId,
      (item) => CartModel(
        productId: productId,
        cartId: item.cartId,
        quantity: quantity,
      ),
    );
    emit(UpdateProductQuantityState());
  }

  double getTotal({required ProductCubit productCubit}){
    double total = 0;
    cartItems.forEach((key,value){
      final ProductModel? getCurrentProduct = productCubit.findByProductId(value.productId);
      if(getCurrentProduct == null){
        total+=0;
      }else{
        total += double.parse(getCurrentProduct.productPrice) * value.quantity;
      }
    });
    return total;
  }

  int getQuantity(){
    int total = 0;
    cartItems.forEach((key,value){
      total += value.quantity;
    });
    return total;
  }


  void removeProduct({required String productId}) {
    cartItems.remove(productId);
    emit(RemoveProductState());
  }

  void clearAllCart() {
    cartItems.clear();
    emit(ClearAllCartState());
  }
}
