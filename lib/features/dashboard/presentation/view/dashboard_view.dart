import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa_admin/core/theme/theme_bloc.dart';
import 'package:marketa_admin/core/utils/app_style.dart';
import 'package:marketa_admin/core/widgets/app_bar_leading.dart';
import 'package:marketa_admin/core/widgets/custom_appbar_text.dart';
import 'package:marketa_admin/features/dashboard/data/model/dashboard_model.dart';
import 'package:marketa_admin/features/dashboard/presentation/widgets/dashboard_card_widget.dart';
import 'package:marketa_admin/features/dashboard/presentation/widgets/theme_button_widget.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final colors = Theme.of(context).extension<AppColors>()!;
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  leading: const AppBarLeading(),
                  title: const CustomAppBarText(
                    text: 'Dashboard',
                    fontSize: 18.0,
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ThemeToggleButton(
                        isDark: state.isDark,
                        colors: colors,
                      ),
                    ),
                  ],
                ),
                SliverToBoxAdapter(child: SizedBox(height: 10.0)),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => DashboardCardWidget(
                      text: DashboardModel.dashboardList(context)[index].text,
                      image: DashboardModel.dashboardList(context)[index].image,
                      onTap: DashboardModel.dashboardList(context)[index].onTap,
                    ),
                    childCount: 3,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
