import 'package:dummy_api/features/core/error/failure.dart';
import 'package:dummy_api/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:dummy_api/features/posts/presentation/bloc/posts_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsFailureTile extends StatelessWidget {
  final Failure failure;
  const PostsFailureTile({super.key, required this.failure});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          context.read<PostsBloc>().add(FetchPosts());
        },
        icon: const Icon(Icons.refresh_rounded),
      ),
      title: Text(failure.message ?? "Unknown Error Occurred"),
    );
  }
}
