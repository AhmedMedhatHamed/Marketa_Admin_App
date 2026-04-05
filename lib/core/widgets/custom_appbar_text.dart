import 'package:flutter/material.dart';
import 'package:marketa_admin/core/utils/app_color.dart';
import 'package:shimmer/shimmer.dart';

class CustomAppBarText extends StatelessWidget {
  const CustomAppBarText({super.key, this.fontSize, this.fontWeight, required this.text});
  final double? fontSize;
  final FontWeight? fontWeight;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: Duration(seconds: 5),
      baseColor: AppColor.primaryColor,
      highlightColor: AppColor.secondColor,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 20.0,
          fontWeight: fontWeight ?? FontWeight.bold,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
