import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa_admin/core/theme/theme_bloc.dart';
import 'app/marketa_admin.dart';
import 'core/database/cache_helper.dart';
import 'features/cart/presentation/cubit/cart_cubit.dart';
import 'features/product/presentation/cubit/product_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => ProductCubit()),
      ],
      child: const MyApp(),
    ),
  );
}
