import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  final Function(String) onPost;

  const CreatePostScreen({super.key, required this.onPost});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _controller = TextEditingController();

  void _submitPost() {
    if (_controller.text.isNotEmpty) {
      widget.onPost(_controller.text);
      _controller.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Post created!')),
      );
      Navigator.of(context).pop(); // Go back to home
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'What\'s on your mind? Share something fun!',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitPost,
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}