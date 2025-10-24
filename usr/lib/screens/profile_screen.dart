import 'package:flutter/material.dart';
import '../models/post.dart';
import '../widgets/post_widget.dart';

class ProfileScreen extends StatelessWidget {
  final List<Post> posts;

  const ProfileScreen({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.pinkAccent,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'Your Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('Posts: ${0}'), // Placeholder; could count user's posts
            const SizedBox(height: 16),
            const Text(
              'Your Posts:',
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
              child: posts.isEmpty
                  ? const Center(child: Text('No posts yet!'))
                  : ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return PostWidget(
                          post: post,
                          onLike: () {}, // No-op for profile
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}