import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa_admin/core/utils/app_color.dart';
import 'package:marketa_admin/core/widgets/custom_buttons.dart';
import 'package:marketa_admin/core/widgets/heart_button_widget.dart';
import 'package:marketa_admin/features/cart/presentation/cubit/cart_cubit.dart';


class FavoriteAndAddToCartWidget extends StatelessWidget {
  const FavoriteAndAddToCartWidget({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cartCubit = context.read<CartCubit>();
        final isInCart = cartCubit.isProductInCart(productId: productId);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HeartButtonWidget(
                productId: productId,
                  color: AppColor.secondColor,
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: CustomButtonWithIcon(
                  onPressed: () {
                    if (isInCart) return;
                    cartCubit.addProductToCart(productId: productId);
                  },
                  text: isInCart ? 'Already in cart' : 'Add to cart',
                  icon: isInCart
                      ? Icon(
                    CupertinoIcons.checkmark_alt,
                    color: AppColor.offWhite,
                    size: 24.0,
                  )
                      : Icon(
                    CupertinoIcons.shopping_cart,
                    color: AppColor.offWhite,
                    size: 24.0,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}