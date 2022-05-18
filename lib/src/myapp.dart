import 'package:flutter/material.dart';
import 'package:loginform/src/cubit/horizontal_news/horizontal_cubit.dart';
import 'package:loginform/src/cubit/news/news_cubit.dart';
import 'package:loginform/src/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'AppColors/colors.dart';
import 'cubit/grid_news/grid_cubit.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit(),
        ),
        BlocProvider(
          create: (context) => HorizontalCubit(),
        ),
        BlocProvider(
          create: (context) => GridCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'login form',
        theme: ThemeData(
          primaryColor:AppTheme.colors.bgcolor,
         scaffoldBackgroundColor: AppTheme.colors.bgcolor
        ),

        home: const Login(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
