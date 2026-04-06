import 'package:flutter/material.dart';
import 'package:marketa_admin/core/utils/app_color.dart';
import 'package:marketa_admin/core/utils/text_styles.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.textInputAction,
    this.keyboardType,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.onChanged,
  });
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value){
        if(value!.isEmpty){
          return 'This Field is Required';
        }
        return null;
      },
      controller: controller,
      style: CustomTextStyles.poppins300styles16,
      cursorColor: AppColor.primaryColor,
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: keyboardType,
      cursorHeight: 14,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: prefixIcon,
        prefixIconColor: AppColor.primaryColor,
        suffixIcon: suffixIcon,
        suffixIconColor: AppColor.primaryColor,
        labelText: labelText,
        labelStyle: CustomTextStyles.poppins300styles16.copyWith(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
