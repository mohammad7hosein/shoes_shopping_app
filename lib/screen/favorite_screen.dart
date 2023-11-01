import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  static const route = '/favorite';
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Favorite Screen'),
      ),
    );
  }
}
