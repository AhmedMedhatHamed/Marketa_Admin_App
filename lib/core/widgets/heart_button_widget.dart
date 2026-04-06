import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:marketa_admin/core/utils/app_color.dart';
import 'package:marketa_admin/features/orders/presentation/cubit/wishlist_cubit/wishlist_cubit.dart';

class HeartButtonWidget extends StatelessWidget {
  const HeartButtonWidget({
    super.key,
    this.color,
    this.size,
    this.iconColor,
    required this.productId,
  });

  final Color? color, iconColor;
  final double? size;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        final wishlistCubit = context.read<WishlistCubit>();
        final isInWishlist = wishlistCubit.isProductInWishlist(productId: productId);
        return Container(
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: IconButton(
            onPressed: () {
              wishlistCubit.addProductInWishlist(productId: productId);
            },
            icon: Icon(
              isInWishlist ? IconlyBold.heart : IconlyLight.heart,
              size: size,
              color: isInWishlist ? AppColor.primaryColor : Colors.black,
            ),
          ),
        );
      },
    );
  }
}