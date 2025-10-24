import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/create_post_screen.dart';
import 'screens/profile_screen.dart';
import 'models/post.dart';

void main() {
  runApp(const SocialMediaApp());
}

class SocialMediaApp extends StatelessWidget {
  const SocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enjoy Social',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Post> _posts = [
    Post(id: '1', content: 'Just had an amazing day at the park! 🌳', likes: 5, isLiked: false),
    Post(id: '2', content: 'Loving this new recipe I tried. Foodie life! 🍕', likes: 12, isLiked: false),
    Post(id: '3', content: 'Dance party in the living room! Who\'s joining? 💃', likes: 8, isLiked: false),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addPost(String content) {
    setState(() {
      _posts.insert(0, Post(id: DateTime.now().toString(), content: content, likes: 0, isLiked: false));
    });
  }

  void _toggleLike(String postId) {
    setState(() {
      final post = _posts.firstWhere((p) => p.id == postId);
      post.isLiked = !post.isLiked;
      post.likes += post.isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      HomeScreen(posts: _posts, onLike: _toggleLike),
      CreatePostScreen(onPost: _addPost),
      ProfileScreen(posts: _posts),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enjoy Social'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pinkAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}