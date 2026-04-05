import 'package:flutter/material.dart';
import 'package:marketa_admin/core/utils/app_assets.dart';

class AppBarLeading extends StatelessWidget {
  const AppBarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(AppAssets.shoppingCart, fit: BoxFit.fill),
    );
  }
}
