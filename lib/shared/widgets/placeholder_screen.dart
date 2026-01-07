import 'package:flutter/material.dart';

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({
    super.key,
    required this.title,
    required this.designRef,
    this.subtitle,
    this.description,
    this.actions = const [],
  });

  final String title;
  final String designRef;
  final String? subtitle;
  final String? description;
  final List<PlaceholderAction> actions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (subtitle != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    subtitle!,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              Text(
                description ?? 'Reference: $designRef',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              Chip(label: Text('Design: $designRef')),
              const SizedBox(height: 20),
              if (actions.isNotEmpty)
                Column(
                  children: [
                    for (final action in actions)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: action.isPrimary
                              ? ElevatedButton(
                                  onPressed: action.onPressed,
                                  child: Text(action.label),
                                )
                              : OutlinedButton(
                                  onPressed: action.onPressed,
                                  child: Text(action.label),
                                ),
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceholderAction {
  const PlaceholderAction({
    required this.label,
    required this.onPressed,
    this.isPrimary = false,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isPrimary;
}
