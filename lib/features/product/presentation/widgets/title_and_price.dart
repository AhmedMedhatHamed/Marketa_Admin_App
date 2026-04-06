import 'package:flutter/material.dart';
import 'package:marketa_admin/core/utils/app_color.dart';
import 'package:marketa_admin/core/utils/text_styles.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({super.key, required this.title, required this.price});

  final String title, price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: Text(
              title,
              style: CustomTextStyles.poppins400styles18Black,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          Text(
            '\$ $price',
            style: CustomTextStyles.poppinsBoldStyles18Black.copyWith(
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
