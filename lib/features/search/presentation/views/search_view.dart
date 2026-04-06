import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa_admin/core/widgets/app_bar_leading.dart';
import 'package:marketa_admin/core/widgets/custom_appbar_text.dart';
import 'package:marketa_admin/features/product/presentation/cubit/product_cubit.dart';
import 'package:marketa_admin/features/search/presentation/widgets/search_grid_view_widget.dart';
import 'package:marketa_admin/features/search/presentation/widgets/search_text_field.dart';


class SearchView extends StatefulWidget {
  final String? categoryName;

  const SearchView({super.key, this.categoryName});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            final productCubit = context.read<ProductCubit>();
            final products = productCubit.searchQuery(
              searchText: searchController.text,
              categoryName: widget.categoryName,
            );

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  title: CustomAppBarText(
                    text: widget.categoryName ?? 'Search',
                  ),
                  leading: AppBarLeading(),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
                SliverToBoxAdapter(
                  child: SearchTextField(searchController: searchController),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: products.length,
                        (context, index) {
                      return SearchGridViewWidget(product: products[index]);
                    },
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    mainAxisExtent: 320,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}