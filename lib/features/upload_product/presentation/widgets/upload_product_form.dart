import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa_admin/core/utils/app_color.dart';
import 'package:marketa_admin/core/utils/app_style.dart';
import 'package:marketa_admin/core/utils/text_styles.dart';
import 'package:marketa_admin/core/widgets/custom_buttons.dart';
import 'package:marketa_admin/core/widgets/custom_text_field.dart';
import 'package:marketa_admin/features/upload_product/presentation/cubit/category_bloc.dart';
import 'package:marketa_admin/features/upload_product/presentation/cubit/upload_product/upload_product_cubit.dart';
import 'category_dropdown_widget.dart';

class UploadProductForm extends StatelessWidget {
  const UploadProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UploadProductCubit>();
    final colors = Theme.of(context).extension<AppColors>()!;

    return Form(
      key: cubit.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            BlocProvider(
              create: (_) => CategoryBloc(),
              child: CategoryDropdown(onChanged: cubit.selectCategory),
            ),
            const SizedBox(height: 20.0),
            CustomTextFormField(
              labelText: 'Product Title',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              prefixIcon: Icon(
                Icons.drive_file_rename_outline_rounded,
                color: colors.primary,
              ),
              controller: cubit.titleController,
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    labelText: 'Price',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    prefixIcon: Icon(
                      Icons.attach_money_rounded,
                      color: colors.primary,
                    ),
                    controller: cubit.priceController,
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: CustomTextFormField(
                    labelText: 'QTY',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    prefixIcon: Icon(
                      Icons.inventory_outlined,
                      color: colors.primary,
                    ),
                    controller: cubit.qtyController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            CustomTextFormField(
              labelText: 'Product Description',
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.multiline,
              prefixIcon: Icon(Icons.notes_rounded, color: colors.primary),
              controller: cubit.descriptionController,
            ),
            const SizedBox(height: 28.0),
            BlocConsumer<UploadProductCubit, UploadProductState>(
              listener: (context, state) {
                if (state is UploadProductSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Center(
                        child: Text(
                          'Product uploaded successfully!',
                          style: CustomTextStyles.poppins400styles18Black.copyWith(
                              color: colors.background
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (state is UploadProductError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Center(
                        child: Text(
                          state.message,
                          style: CustomTextStyles.poppins400styles18Black.copyWith(
                            color: colors.text
                          ),
                        ),
                      ),
                      backgroundColor: AppColor.errorMsgColor,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Row(
                  children: [
                    CustomButtonWithIcon(
                      width: 120.0,
                      text: 'Clear',
                      fontSize: 16.0,
                      icon: Icon(Icons.clear, size: 24.0, color: AppColor.offWhite),
                      color: AppColor.errorMsgColor,
                      onPressed: state is UploadProductLoading
                          ? null
                          : cubit.clearForm,
                    ),
                    SizedBox(width: 10.0),

                    Expanded(
                      child: CustomButtonWithIcon(
                        text: 'upload product',
                        fontSize: 18.0,
                        icon: Icon(
                          Icons.upload,
                          size: 24.0,
                          color: AppColor.offWhite,
                        ),
                        color: colors.primary,
                        onPressed: state is UploadProductLoading
                            ? null
                            : cubit.uploadProduct,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
