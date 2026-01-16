import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text('W', style: const TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        title: const Text('Welcome'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
      ),
      body: const Center(
        child: Text('Legacy welcome placeholder'),
      ),
    );
  }
}
