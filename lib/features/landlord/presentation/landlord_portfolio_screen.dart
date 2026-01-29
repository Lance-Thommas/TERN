import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandlordDecisionsScreen extends StatelessWidget {
  const LandlordDecisionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decisions'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _NavTile(
            title: 'Initiate Reclaim',
            subtitle: 'Select legal ground and see impact summary',
            onTap: () => context.push('/app/landlord/reclaim/initiate'),
          ),
          _NavTile(
            title: 'Transition & Exit Plan',
            subtitle: 'Shift a unit into transition with bounded timelines',
            onTap: () => context.push('/app/transition/landlord'),
          ),
          _NavTile(
            title: 'Lease Closure',
            subtitle: 'Schedule closure and protect against vacancy loss',
            onTap: () => context.push('/app/transition/lease-closure'),
          ),
          _NavTile(
            title: 'Clear Exits Reduce Loss',
            subtitle: 'Guide orderly endings and protect income',
            onTap: () => context.push('/app/landlord/clear-exits'),
          ),
          _NavTile(
            title: 'Deposit Resolution',
            subtitle: 'Review settlements and confirm payouts',
            onTap: () => context.push('/app/deposit/resolution-landlord'),
          ),
          _NavTile(
            title: 'Tenancy History',
            subtitle: 'View continuity record and past settlements',
            onTap: () => context.push('/app/landlord/history'),
          ),
          _NavTile(
            title: 'Notifications (Landlord)',
            subtitle: 'Transition signals and rental rule updates',
            onTap: () => context.push('/app/notifications/landlord/transition-signal'),
          ),
        ],
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  const _NavTile({required this.title, required this.subtitle, required this.onTap});
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
