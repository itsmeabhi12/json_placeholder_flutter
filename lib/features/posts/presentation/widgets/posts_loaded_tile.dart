import 'package:dummy_api/features/posts/domain/entity/post.dart';
import 'package:flutter/material.dart';

class PostsLoadedTile extends StatelessWidget {
  final Post post;
  const PostsLoadedTile({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('${post.id}'),
      title: Text(post.title),
      subtitle: Text(post.body),
    );
  }
}
