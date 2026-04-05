import 'package:flutter/material.dart';
import 'package:marketa_admin/core/utils/app_color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.thickness,
    this.endIndent,
    this.indent,
    this.color,
  });

  final double? thickness, endIndent, indent;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? AppColor.greyColor,
      thickness: thickness ?? 1,
      endIndent:endIndent ?? 25,
      indent:indent ?? 25,
    );
  }
}
