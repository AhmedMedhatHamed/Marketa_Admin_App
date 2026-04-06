import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa_admin/core/utils/app_style.dart';
import 'package:marketa_admin/features/upload_or_edit_product/presentation/cubit/category_bloc.dart';

class CategoryDropdown extends StatelessWidget {
  final void Function(String category)? onChanged;

  const CategoryDropdown({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          initialValue: state.selected,
          hint: Text(
            'Select Category',
            style: TextStyle(color: colors.subtext, fontSize: 14),
          ),
          decoration: InputDecoration(
            labelText: 'Category',
            labelStyle: TextStyle(color: colors.primary, fontWeight: FontWeight.w500),
            prefixIcon: Icon(Icons.category_outlined, color: colors.primary),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            filled: true,
            fillColor: colors.surface,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: colors.subtext.withValues(alpha: 0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: colors.primary, width: 1.5),
            ),
          ),
          dropdownColor: colors.surface,
          borderRadius: BorderRadius.circular(14),
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: colors.primary),
          items: kCategories
              .map((c) => DropdownMenuItem(
            value: c,
            child: Center(child: Text(c, style: TextStyle(color: colors.text, fontSize: 14.0))),
          ))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              context.read<CategoryBloc>().add(SelectCategoryEvent(value)); // ← يحدّث الـ Bloc
              onChanged?.call(value); // ← يبعت للـ Cubit
            }
          },
        );
      },
    );
  }
}