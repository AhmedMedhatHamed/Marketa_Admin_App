import 'package:flutter/material.dart';
import 'package:marketa_admin/core/utils/text_styles.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.categoryName, required this.description});

  final String categoryName,description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'About This Item',
                style: CustomTextStyles.poppinsBoldStyles18Black,
              ),
              Text(
                'in $categoryName',
                style: CustomTextStyles.poppins400styles18Black,
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            description,
            style: CustomTextStyles.poppins300styles16,
          ),
        ],
      ),
    );
  }
}


