import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa_admin/core/theme/theme_bloc.dart';
import 'app/marketa_admin.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeBloc(),
               ),
      ],
      child: const MyApp(),
    ),
  );
}
