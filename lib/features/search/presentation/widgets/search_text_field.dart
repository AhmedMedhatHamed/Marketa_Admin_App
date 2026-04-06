import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:marketa_admin/core/utils/app_color.dart';
import 'package:marketa_admin/core/widgets/custom_text_field.dart';


class SearchTextField extends StatelessWidget {
  final TextEditingController searchController;

  const SearchTextField({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomTextFormField(
        labelText: 'Search',
        controller: searchController,
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
        prefixIcon: const Icon(IconlyLight.search),
        suffixIcon: IconButton(
          onPressed: () {
            searchController.clear();
            FocusScope.of(context).unfocus();
          },
          icon: Icon(Icons.clear, color: AppColor.errorMsgColor),
        ),
      ),
    );
  }
}