import 'package:dummy_api/dependencies.dart';
import 'package:dummy_api/features/core/presentation/app_widget.dart';
import 'package:dummy_api/features/initialization/cubit/initialization_cubit.dart';
import 'package:dummy_api/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => getIt<InitializationCubit>()..initialize()),
          BlocProvider(create: (_) => getIt<PostsBloc>()),
        ],
        child: const AppWidget(),
      ),
    );
  }
}
