import 'package:go_router/go_router.dart';
import 'package:marketa_admin/features/dashboard/presentation/view/dashboard_view.dart';


final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const DashboardView()),
  ],
);
