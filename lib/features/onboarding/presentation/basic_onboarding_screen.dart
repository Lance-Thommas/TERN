import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/shared/widgets/placeholder_screen.dart';

class BasicOnboardingScreen extends StatelessWidget {
  const BasicOnboardingScreen({
    super.key,
    required this.title,
    required this.designRef,
    this.description,
    this.nextPath,
    this.secondaryPath,
  });

  final String title;
  final String designRef;
  final String? description;
  final String? nextPath;
  final String? secondaryPath;

  @override
  Widget build(BuildContext context) {
    return PlaceholderScreen(
      title: title,
      designRef: designRef,
      description: description ?? 'Follow the design reference for layout and interactions.',
      actions: [
        if (nextPath != null)
          PlaceholderAction(
            label: 'Continue',
            isPrimary: true,
            onPressed: () => context.go(nextPath!),
          ),
        if (secondaryPath != null)
          PlaceholderAction(
            label: 'Skip',
            onPressed: () => context.go(secondaryPath!),
          ),
      ],
    );
  }
}
