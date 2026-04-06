import 'package:go_router/go_router.dart';
import 'package:marketa_admin/features/dashboard/presentation/view/dashboard_view.dart';
import 'package:marketa_admin/features/orders/presentation/views/all_order_view.dart';
import 'package:marketa_admin/features/product/presentation/view/product_details_view.dart';
import 'package:marketa_admin/features/search/presentation/views/search_view.dart';
import 'package:marketa_admin/features/upload_product/presentation/view/upload_product_view.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const DashboardView()),
    GoRoute(
      path: '/search',
      builder: (context, state) {
        final categoryName = state.extra as String?;
        return SearchView(categoryName: categoryName);
      },
    ),
    GoRoute(
      path: '/productDetails',
      builder: (context, state) {
        final productId = state.extra as String;
        return ProductDetailsView(productId: productId);
      },
    ),
    GoRoute(
      path: '/allOrder',
      builder: (context, state) => const AllOrderView(),
    ),
    GoRoute(
      path: '/uploadProduct',
      builder: (context, state) => const UploadProductView(),
    ),
  ],
);
