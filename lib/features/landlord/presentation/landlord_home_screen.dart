import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _lhBg = Color(0xFFF6F8F8);
const _lhPrimary = Color(0xFF1EE6D2);
const _lhPrimaryDark = Color(0xFF16B0A1);

class LandlordHomeScreen extends StatelessWidget {
  const LandlordHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _lhBg,
      appBar: AppBar(
        backgroundColor: _lhBg,
        elevation: 0,
        title: const Text('Home'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text('LL HM', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeroCard(theme: theme),
              const SizedBox(height: 20),
              _SectionTitle('Shortcuts', theme: theme),
              const SizedBox(height: 10),
              _ShortcutGrid(),
              const SizedBox(height: 20),
              _SectionTitle('Signals', theme: theme),
              const SizedBox(height: 10),
              _SignalList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [_lhPrimary, _lhPrimaryDark], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 6))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.35)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.shield_moon, color: Colors.white, size: 16),
                    const SizedBox(width: 6),
                    Text('Continuity steady', style: theme.textTheme.labelLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              Text('3 units watched', style: theme.textTheme.labelLarge?.copyWith(color: Colors.white.withValues(alpha: 0.9))),
            ],
          ),
          const SizedBox(height: 12),
          Text('Keep every unit predictable.', style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w800, height: 1.2)),
          const SizedBox(height: 8),
          Text('Upcoming renewal in 45 days. Transition signal on 88 Pine Ln.', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white.withValues(alpha: 0.85))),
          const SizedBox(height: 16),
          Row(
            children: [
              ElevatedButton(
                onPressed: () => context.go('/app/landlord/portfolio'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF0F1E1C),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('View portfolio', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: () => context.push('/app/landlord/reclaim/initiate'),
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                child: const Text('Start reclaim'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title, {required this.theme});
  final String title;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800, color: const Color(0xFF111817)));
  }
}

class _ShortcutGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      _ShortcutData(
        icon: Icons.apartment,
        title: 'Portfolio',
        subtitle: 'Continuity & rent windows',
        onTap: () => context.go('/app/landlord/portfolio'),
      ),
      _ShortcutData(
        icon: Icons.rule_folder,
        title: 'Decisions',
        subtitle: 'Renewal, exits, claims',
        onTap: () => context.go('/app/landlord/decisions'),
      ),
      _ShortcutData(
        icon: Icons.shield_outlined,
        title: 'Deposit',
        subtitle: 'Resolution & settlement',
        onTap: () => context.push('/app/deposit/resolution-landlord'),
      ),
      _ShortcutData(
        icon: Icons.notifications_none,
        title: 'Signals',
        subtitle: 'Rule updates & notices',
        onTap: () => context.push('/app/notifications/landlord/transition-signal'),
      ),
    ];

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _ShortcutCard(data: items[0])),
            const SizedBox(width: 12),
            Expanded(child: _ShortcutCard(data: items[1])),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _ShortcutCard(data: items[2])),
            const SizedBox(width: 12),
            Expanded(child: _ShortcutCard(data: items[3])),
          ],
        ),
      ],
    );
  }
}

class _ShortcutCard extends StatelessWidget {
  const _ShortcutCard({required this.data});
  final _ShortcutData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return InkWell(
      onTap: data.onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(data.icon, color: colorScheme.primary, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800, color: const Color(0xFF111817))),
                  const SizedBox(height: 4),
                  Text(data.subtitle, style: theme.textTheme.bodySmall?.copyWith(color: const Color(0xFF618986))),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFF7C8B89)),
          ],
        ),
      ),
    );
  }
}

class _SignalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cards = [
      _SignalCard(
        badge: 'Transition signal',
        title: 'Tenant signaled move-out',
        body: '88 Pine Ln requested early exit. Review transition plan and bounded costs.',
        onPrimary: () => context.push('/app/transition/landlord'),
        onSecondary: () => context.push('/onboarding/landlord/rent-timing'),
      ),
      _SignalCard(
        badge: 'Rule update',
        title: 'New rental rule impacts notice periods',
        body: 'Review the update and apply to active leases calmly.',
        onPrimary: () => context.push('/app/notifications/landlord/rental-rule'),
        onSecondary: () => context.push('/app/notifications/landlord/transition-signal'),
      ),
    ];

    return Column(
      children: [
        for (final card in cards) ...[
          card,
          const SizedBox(height: 12),
        ]
      ],
    );
  }
}

class _SignalCard extends StatelessWidget {
  const _SignalCard({
    required this.badge,
    required this.title,
    required this.body,
    required this.onPrimary,
    required this.onSecondary,
  });

  final String badge;
  final String title;
  final String body;
  final VoidCallback onPrimary;
  final VoidCallback onSecondary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(color: colorScheme.primary.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(12)),
            child: Text(badge, style: theme.textTheme.labelMedium?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w800)),
          ),
          const SizedBox(height: 8),
          Text(title, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800, color: const Color(0xFF111817))),
          const SizedBox(height: 4),
          Text(body, style: theme.textTheme.bodySmall?.copyWith(color: const Color(0xFF618986))),
          const SizedBox(height: 12),
          Row(
            children: [
              OutlinedButton(
                onPressed: onPrimary,
                style: OutlinedButton.styleFrom(
                  foregroundColor: colorScheme.primary,
                  side: BorderSide(color: colorScheme.primary.withValues(alpha: 0.6)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                ),
                child: const Text('Review'),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: onSecondary,
                style: TextButton.styleFrom(foregroundColor: const Color(0xFF2F4F4B)),
                child: const Text('Learn more'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ShortcutData {
  const _ShortcutData({required this.icon, required this.title, required this.subtitle, required this.onTap});
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
}
