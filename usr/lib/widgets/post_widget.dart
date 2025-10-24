import 'package:flutter/material.dart';
import '../models/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  final VoidCallback onLike;

  const PostWidget({super.key, required this.post, required this.onLike});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.content,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${post.likes} likes'),
                IconButton(
                  icon: Icon(
                    post.isLiked ? Icons.favorite : Icons.favorite_border,
                    color: post.isLiked ? Colors.red : Colors.grey,
                  ),
                  onPressed: onLike,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}