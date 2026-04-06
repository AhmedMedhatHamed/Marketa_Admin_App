import 'package:flutter/material.dart';
import 'package:marketa_admin/core/utils/app_style.dart';
import 'package:marketa_admin/core/utils/text_styles.dart';

class DashboardCardWidget extends StatelessWidget {
  const DashboardCardWidget({
    super.key,
    required this.text,
    required this.image,
    this.onTap,
  });

  final String text, image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return InkWell(
      borderRadius: BorderRadius.circular(22.0),
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, fit: BoxFit.cover, width: 60.0, height: 60.0),
            const SizedBox(height: 10.0),
            Text(
              text,
              style: CustomTextStyles.poppinsBoldStyles18Black.copyWith(
                color: colors.text,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
