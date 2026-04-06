import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketa_admin/core/utils/app_color.dart';
import 'package:marketa_admin/core/utils/text_styles.dart';
import 'package:marketa_admin/core/widgets/heart_button_widget.dart';
import 'package:marketa_admin/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:marketa_admin/features/orders/presentation/cubit/viewed_cubit/viewed_cubit.dart';
import 'package:marketa_admin/features/product/data/models/product_model.dart';


class SearchGridViewWidget extends StatelessWidget {
  final ProductModel product;

  const SearchGridViewWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final viewedCubit = context.read<ViewedCubit>();
    return GestureDetector(
      onTap: () {
        viewedCubit.addProductInHistory(productId: product.productId);
        context.push('/productDetails', extra: product.productId);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.network(
                product.productImage,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.22,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: Text(
                    product.productTitle,
                    style: CustomTextStyles.poppins400styles18Black,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: HeartButtonWidget(productId: product.productId),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    '\$ ${product.productPrice}',
                    style: CustomTextStyles.poppins300styles16,
                  ),
                ),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    final cartCubit = context.read<CartCubit>();
                    final isInCart = cartCubit.isProductInCart(
                      productId: product.productId,
                    );
                    return Flexible(
                      child: Material(
                        borderRadius: BorderRadius.circular(16.0),
                        color: AppColor.primaryColor,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16.0),
                          onTap: () async {
                            if (isInCart) return;
                            await cartCubit.addProductToCart(
                              productId: product.productId,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              isInCart
                                  ? CupertinoIcons.checkmark_alt
                                  : CupertinoIcons.shopping_cart,
                              color: Theme.of(context).scaffoldBackgroundColor,
                              size: 18.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
