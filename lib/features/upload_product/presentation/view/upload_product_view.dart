import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa_admin/core/widgets/custom_appbar_text.dart';
import 'package:marketa_admin/features/upload_product/presentation/cubit/upload_product/upload_product_cubit.dart';
import 'package:marketa_admin/features/upload_product/presentation/widgets/upload_product_form.dart';

class UploadProductView extends StatelessWidget {
  const UploadProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UploadProductCubit(),
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                title: const CustomAppBarText(
                  text: 'Upload New Product',
                  fontSize: 18.0,
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                sliver: SliverToBoxAdapter(child: UploadProductForm()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

