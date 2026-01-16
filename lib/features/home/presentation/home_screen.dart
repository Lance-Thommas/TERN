import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _bg = Color(0xFFF6F8F8);
  static const _primary = Color(0xFF11D4C4);
  static const _primaryDark = Color(0xFF0E8F85);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: _bg,
        elevation: 0,
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text('HM', style: const TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeroCard(theme: theme, primary: _primary, primaryDark: _primaryDark),
              const SizedBox(height: 20),
              _SectionTitle('Shortcuts', theme: theme),
              const SizedBox(height: 10),
              _ShortcutList(colorScheme: colorScheme, theme: theme),
              const SizedBox(height: 20),
              _SectionTitle('Rent & deposit', theme: theme),
              const SizedBox(height: 10),
              _InfoCards(theme: theme, colorScheme: colorScheme),
              const SizedBox(height: 20),
              _SectionTitle('Signals', theme: theme),
              const SizedBox(height: 10),
              _SignalCard(theme: theme, colorScheme: colorScheme),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.theme, required this.primary, required this.primaryDark});
  final ThemeData theme;
  final Color primary;
  final Color primaryDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primary, primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
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
                    Text('On track', style: theme.textTheme.labelLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              Text('Calm lease', style: theme.textTheme.labelLarge?.copyWith(color: Colors.white.withValues(alpha: 0.9))),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Keep your lease running smoothly.',
            style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w800, height: 1.2),
          ),
          const SizedBox(height: 8),
          Text(
            'Next rent window opens in 5 days. Deposit coverage is steady.',
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white.withValues(alpha: 0.85)),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              ElevatedButton(
                onPressed: () => context.go('/app/timeline'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF0F1E1C),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('View timeline', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: () => context.push('/app/timeline/renewal'),
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                child: const Text('Renewal options'),
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

class _ShortcutList extends StatelessWidget {
  const _ShortcutList({required this.colorScheme, required this.theme});
  final ColorScheme colorScheme;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final items = [
      _ShortcutData(
        icon: Icons.timeline,
        title: 'Timeline',
        subtitle: 'Status, rent window',
        onTap: () => context.go('/app/timeline'),
      ),
      _ShortcutData(
        icon: Icons.savings,
        title: 'Deposit',
        subtitle: 'Coverage & preview',
        onTap: () => context.push('/app/timeline/deposit'),
      ),
      _ShortcutData(
        icon: Icons.tune,
        title: 'Adjust month',
        subtitle: 'Smooth uneven rent',
        onTap: () => context.go('/app/adjustments'),
      ),
      _ShortcutData(
        icon: Icons.notifications_none,
        title: 'Updates',
        subtitle: 'Rule changes & news',
        onTap: () => context.push('/app/profile/notifications'),
      ),
    ];

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _ShortcutCard(data: items[0], colorScheme: colorScheme, theme: theme)),
            const SizedBox(width: 12),
            Expanded(child: _ShortcutCard(data: items[1], colorScheme: colorScheme, theme: theme)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _ShortcutCard(data: items[2], colorScheme: colorScheme, theme: theme)),
            const SizedBox(width: 12),
            Expanded(child: _ShortcutCard(data: items[3], colorScheme: colorScheme, theme: theme)),
          ],
        ),
      ],
    );
  }
}

class _ShortcutCard extends StatelessWidget {
  const _ShortcutCard({required this.data, required this.colorScheme, required this.theme});
  final _ShortcutData data;
  final ColorScheme colorScheme;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
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

class _InfoCards extends StatelessWidget {
  const _InfoCards({required this.theme, required this.colorScheme});
  final ThemeData theme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _InfoCard(
          title: 'Next rent window',
          detail: 'Opens Jan 15',
          helper: 'Buffer ready if needed',
          icon: Icons.calendar_month,
          color: colorScheme.primary,
          onTap: () => context.go('/app/timeline'),
        ),
        const SizedBox(height: 12),
        _InfoCard(
          title: 'Deposit coverage',
          detail: 'AED 7,500 protected',
          helper: 'Preview before move-out',
          icon: Icons.shield_outlined,
          color: const Color(0xFF2C7A7B),
          onTap: () => context.push('/app/timeline/deposit'),
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.title,
    required this.detail,
    required this.helper,
    required this.icon,
    required this.color,
    this.onTap,
  });

  final String title;
  final String detail;
  final String helper;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(14)),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800, color: const Color(0xFF111817))),
                  const SizedBox(height: 4),
                  Text(detail, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 2),
                  Text(helper, style: theme.textTheme.bodySmall?.copyWith(color: const Color(0xFF618986))),
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

class _SignalCard extends StatelessWidget {
  const _SignalCard({required this.theme, required this.colorScheme});
  final ThemeData theme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
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
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text('Signal', style: theme.textTheme.labelMedium?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w800)),
              ),
              const SizedBox(width: 8),
              Text('Stay ahead of changes', style: theme.textTheme.labelLarge?.copyWith(color: const Color(0xFF111817))),
            ],
          ),
          const SizedBox(height: 10),
          Text('Review rental rule update', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          Text(
            'There is a new rental rule update affecting notice periods. Tap to read calmly.',
            style: theme.textTheme.bodySmall?.copyWith(color: const Color(0xFF618986)),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              OutlinedButton(
                onPressed: () => context.push('/app/profile/notifications'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: colorScheme.primary,
                  side: BorderSide(color: colorScheme.primary.withValues(alpha: 0.6)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                ),
                child: const Text('View update'),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () => context.push('/app/transition/request-flexibility'),
                style: TextButton.styleFrom(foregroundColor: const Color(0xFF2F4F4B)),
                child: const Text('Ask for flexibility'),
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
