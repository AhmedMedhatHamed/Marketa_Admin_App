import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa_admin/core/widgets/custom_appbar_text.dart';
import 'package:marketa_admin/features/product/data/models/product_model.dart';
import 'package:marketa_admin/features/upload_product/presentation/cubit/upload_product/upload_product_cubit.dart';
import 'package:marketa_admin/features/upload_product/presentation/widgets/upload_product_form.dart';

class EditProductView extends StatelessWidget {
  final ProductModel product;
  const EditProductView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UploadProductCubit()..initWithProduct(product),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              title: const CustomAppBarText(
                text: 'Edit Product',
                fontSize: 18.0,
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 12),
              sliver: SliverToBoxAdapter(
                child: UploadProductForm(isEdit: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}