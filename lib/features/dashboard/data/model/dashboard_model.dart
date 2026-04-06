import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:marketa_admin/core/utils/app_assets.dart';

class DashboardModel {
  final String image, text;
  final void Function() onTap;

  DashboardModel({
    required this.image,
    required this.text,
    required this.onTap,
  });

  static List<DashboardModel> dashboardList (BuildContext context) => [
    DashboardModel(
      image: AppAssets.cloud,
      text: 'Add New Product',
      onTap: () {
        context.push('/uploadProduct');
      },
    ),
    DashboardModel(
      image: AppAssets.shoppingCart,
      text: 'Inspect All Products',
      onTap: () {
        context.push('/search');
      },
    ),
    DashboardModel(
      image: AppAssets.order,
      text: 'View Orders',
      onTap: () {
        context.push('/allOrder');
      },
    ),
  ];
}
