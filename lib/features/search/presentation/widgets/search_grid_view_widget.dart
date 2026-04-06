import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketa_admin/core/utils/text_styles.dart';
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
