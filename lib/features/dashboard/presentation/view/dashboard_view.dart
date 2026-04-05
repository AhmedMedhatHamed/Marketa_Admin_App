import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa_admin/core/theme/theme_bloc.dart';
import 'package:marketa_admin/core/utils/app_style.dart';
import 'package:marketa_admin/core/widgets/app_bar_leading.dart';
import 'package:marketa_admin/core/widgets/custom_appbar_text.dart';
import 'package:marketa_admin/features/dashboard/presentation/widgets/theme_button_widget.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final colors = Theme.of(context).extension<AppColors>()!;
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                leading: AppBarLeading(),
                title: CustomAppBarText(text: 'Dashboard', fontSize: 18.0),
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
            ],
          ),
        );
      },
    );
  }
}
