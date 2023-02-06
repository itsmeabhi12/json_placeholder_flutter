import 'package:dummy_api/features/initialization/cubit/initialization_cubit.dart';
import 'package:dummy_api/features/initialization/cubit/initialization_state.dart';
import 'package:dummy_api/features/posts/presentation/pages/posts_page.dart';
import 'package:dummy_api/features/splash/presentation/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitializationCubit, InitializationState>(
      builder: (context, state) {
        if (state is Uninitialized) {
          return const SplashPage();
        }
        return const PostsPage();
      },
    );
  }
}
