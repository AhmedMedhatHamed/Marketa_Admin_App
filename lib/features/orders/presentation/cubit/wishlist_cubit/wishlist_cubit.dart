import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa_admin/core/models/wishlist_model.dart';
import 'package:uuid/uuid.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  final Map<String, WishlistModel> wishlistItems = {};

  Map<String, WishlistModel> get getWishlistItems {
    return wishlistItems;
  }

  bool isProductInWishlist({required String productId}) {
    return wishlistItems.containsKey(productId);
  }

  Future<void> addProductInWishlist({required String productId}) async {
    if (wishlistItems.containsKey(productId)) {
      wishlistItems.remove(productId);
      emit(RemoveProductFromWishlistState());
    } else {
      wishlistItems.putIfAbsent(
        productId,
            () => WishlistModel(productId: productId, id: Uuid().v4()),
      );
      emit(AddProductInWishlistState());
    }
  }

  void clearAllWishlist() {
    wishlistItems.clear();
    emit(ClearAllWishlistState());
  }
}
