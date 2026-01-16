import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandlordPortfolioScreen extends StatelessWidget {
  const LandlordPortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landlord Portfolio'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _NavTile(
            title: 'Portfolio Timeline (Variant 1)',
            subtitle: 'Continuity view with adjustments, renewals, transitions',
            onTap: () => context.push('/app/landlord/portfolio/timeline-1'),
          ),
          _NavTile(
            title: 'Portfolio Timeline (Variant 2)',
            subtitle: 'Variant with “On Track” badge and CTA',
            onTap: () => context.push('/app/landlord/portfolio/timeline-2'),
          ),
          _NavTile(
            title: 'Initiate Reclaim',
            subtitle: 'Select legal ground and see impact summary',
            onTap: () => context.push('/app/landlord/reclaim/initiate'),
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
