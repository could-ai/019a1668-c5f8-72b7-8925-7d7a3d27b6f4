import 'package:flutter/material.dart';
import '../models/post.dart';
import '../widgets/post_widget.dart';

class HomeScreen extends StatelessWidget {
  final List<Post> posts;
  final Function(String) onLike;

  const HomeScreen({super.key, required this.posts, required this.onLike});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: posts.isEmpty
          ? const Center(child: Text('No posts yet! Create your first post.'))
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return PostWidget(
                  post: post,
                  onLike: () => onLike(post.id),
                );
              },
            ),
    );
  }
}