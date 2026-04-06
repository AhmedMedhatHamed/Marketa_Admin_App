part of 'wishlist_cubit.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

class AddProductInWishlistState extends WishlistState{}

class RemoveProductFromWishlistState extends WishlistState{}

class ClearAllWishlistState extends WishlistState{}