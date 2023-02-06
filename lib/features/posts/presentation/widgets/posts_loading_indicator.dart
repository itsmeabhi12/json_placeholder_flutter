import 'package:flutter/material.dart';

class PostsLoadingIndicator extends StatelessWidget {
  const PostsLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
