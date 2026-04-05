import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa_admin/core/router/app_router.dart';
import 'package:marketa_admin/core/theme/theme_bloc.dart';
import 'package:marketa_admin/core/utils/app_style.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Marketa-Admin',
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
          routerConfig: router,
        );
      },
    );
  }
}
