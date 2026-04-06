import 'package:flutter/material.dart';
import 'package:marketa_admin/core/widgets/custom_appbar_text.dart';
import 'package:marketa_admin/core/widgets/custom_divider.dart';
import 'package:marketa_admin/features/orders/presentation/widgets/all_order_widget.dart';


class AllOrderView extends StatelessWidget {
  const AllOrderView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomAppBarText(text: 'All order'),
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView.separated(
        itemCount: 15,
        separatorBuilder: (context, index) {
          return CustomDivider();
        },
        itemBuilder: (context, index) {
          return AllOrderWidget();
        },
      ),
    );
  }
}
