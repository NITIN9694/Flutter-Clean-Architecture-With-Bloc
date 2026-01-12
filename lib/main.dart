  import 'package:clean_architure/core/theme/app_theme.dart';
import 'package:clean_architure/feature/auth/presentation/auth/bloc.dart';
import 'package:clean_architure/feature/auth/presentation/pages/singup_page.dart';
import 'package:clean_architure/feature/home/presentation/home_bloc/bloc.dart';
import 'package:clean_architure/feature/home/presentation/pages/home_page.dart';
import 'package:clean_architure/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp( MultiBlocProvider(
    providers: [
      BlocProvider(create: (_)=>serviceLocator<AuthBloc>()),
      BlocProvider(create: (_)=>serviceLocator<HomeBloc>())
    ],
    child:
      MyApp(),

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: const HomePage(),
    );
  }
}
