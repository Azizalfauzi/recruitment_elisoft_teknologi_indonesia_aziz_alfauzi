import 'package:flutter/material.dart';
import 'package:recruitment_elisoft_teknologi_indonesia_aziz_alfauzi/cubit/api/dashboard_cubit/dashboard_cubit.dart';
import 'package:recruitment_elisoft_teknologi_indonesia_aziz_alfauzi/cubit/api/login_cubit/login_cubit.dart';
import 'package:recruitment_elisoft_teknologi_indonesia_aziz_alfauzi/cubit/routes/routes_cubit.dart';
import 'package:recruitment_elisoft_teknologi_indonesia_aziz_alfauzi/views/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RoutesCubit(),
        ),
        BlocProvider(
          create: (_) => LoginCubit(),
        ),
        BlocProvider(
          create: (_) => DashboardCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const WrapperPage(),
      ),
    );
  }
}
