import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa_admin/core/widgets/custom_appbar_text.dart';
import 'package:marketa_admin/features/upload_product/presentation/cubit/category_bloc.dart';
import 'package:marketa_admin/features/upload_product/presentation/widgets/category_dropdown_widget.dart';

class UploadProductView extends StatelessWidget {
  const UploadProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryBloc(),
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
            /// TODO Image Picker
            SliverToBoxAdapter(child: SizedBox(height: 20.0,),),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: const CategoryDropdown(),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
