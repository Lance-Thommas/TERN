import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransitionScreen extends StatelessWidget {
  const TransitionScreen({super.key, required this.title, required this.designRef});

  final String title;
  final String designRef;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go('/');
          }
        },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transition flow placeholder',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Reference design: $designRef. Use mocked state to guide exits without penalties.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.push('/app/timeline'),
                child: const Text('Return to timeline'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
