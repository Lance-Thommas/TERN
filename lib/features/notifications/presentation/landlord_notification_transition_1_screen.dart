import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandlordNotificationTransition1Screen extends StatelessWidget {
  const LandlordNotificationTransition1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text('LNT1', style: const TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
        title: const Text('Landlord Notification Transition 1'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text('Landlord Notification Transition 1', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
            SizedBox(height: 12),
            Text('Refer to design: landlord_notification_transition_1'),
            SizedBox(height: 12),
            Text('Screen is scrollable, aligned to design structure with mocked data.'),
          ],
        ),
      ),
    );
  }
}
