import 'package:dummy_api/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:dummy_api/features/posts/presentation/bloc/posts_events.dart';
import 'package:dummy_api/features/posts/presentation/bloc/posts_state.dart';
import 'package:dummy_api/features/posts/presentation/widgets/posts_failure_tile.dart';
import 'package:dummy_api/features/posts/presentation/widgets/posts_initial.dart';
import 'package:dummy_api/features/posts/presentation/widgets/posts_loaded_tile.dart';
import 'package:dummy_api/features/posts/presentation/widgets/posts_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    context.read<PostsBloc>().add(FetchPosts());
    super.initState();
  }

  bool hasShownUnFreshDialog = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          final metrics = notification.metrics;
          final limit =
              metrics.maxScrollExtent - (metrics.viewportDimension / 3);
          if (metrics.pixels >= limit) {
            final postBloc = context.read<PostsBloc>();
            postBloc.state.mapOrNull(
              loaded: (_) => postBloc.add(FetchPosts()),
            );
          }
          return false;
        },
        child: BlocConsumer<PostsBloc, PostsState>(
          listener: (context, state) {
            if (!state.posts.fresh) {
              if (!hasShownUnFreshDialog) {
                const snackBar = SnackBar(
                  content: Text('No Internet some of data may be outdated'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                hasShownUnFreshDialog = true;
              }
            }
          },
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.when(
                initial: (_) => 0,
                loading: (posts) => posts.data.length + 1,
                loaded: (posts) => posts.data.length,
                failure: (posts, _) => posts.data.length + 1,
              ),
              itemBuilder: (_, i) {
                return state.when(
                  initial: (_) => const PostsInitial(),
                  loading: (posts) {
                    if (i == posts.data.length) {
                      return const PostsLoadingIndicator();
                    }
                    return PostsLoadedTile(post: posts.data[i]);
                  },
                  loaded: (posts) => PostsLoadedTile(post: posts.data[i]),
                  failure: (posts, failure) {
                    if (i == posts.data.length) {
                      return PostsFailureTile(failure: failure);
                    }
                    return PostsLoadedTile(post: posts.data[i]);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
