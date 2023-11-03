import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  static const route = '/message';
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Message Screen'),
      ),
    );
  }
}
