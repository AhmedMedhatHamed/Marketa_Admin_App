import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa_admin/core/widgets/custom_appbar_text.dart';
import 'package:marketa_admin/features/product/presentation/cubit/product_cubit.dart';
import 'package:marketa_admin/features/product/presentation/widgets/product_description.dart';
import 'package:marketa_admin/features/product/presentation/widgets/product_image.dart';
import 'package:marketa_admin/features/product/presentation/widgets/title_and_price.dart';


class ProductDetailsView extends StatelessWidget {
  final String productId;

  const ProductDetailsView({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final productCubit = context.read<ProductCubit>();
    final getCurrentProduct = productCubit.findByProductId(productId);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: CustomAppBarText(text: 'Marketa'),
          ),
          SliverToBoxAdapter(
            child: ProductImage(image: getCurrentProduct!.productImage),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 25.0)),
          SliverToBoxAdapter(
            child: TitleAndPrice(
              title: getCurrentProduct.productTitle,
              price: getCurrentProduct.productPrice,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 25.0)),
          SliverToBoxAdapter(
            child: ProductDescription(
              description: getCurrentProduct.productDescription,
              categoryName: getCurrentProduct.productCategory,
            ),
          ),
        ],
      ),
    );
  }
}
