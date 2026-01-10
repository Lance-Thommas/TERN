import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TERN',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(letterSpacing: 4, fontWeight: FontWeight.w700),
        ),
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _RuleUpdateCard(onTap: () => context.push('/app/timeline/rule-update')),
              const SizedBox(height: 18),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Everything is on track.',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Rent paid. You are covered until Nov 1, 2023.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: colorScheme.secondary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _ProgressSection(
                label: 'Annual Progress',
                valueLabel: '150 Days Elapsed',
                progress: 0.42,
              ),
              const SizedBox(height: 24),
              _TimelineRow(
                icon: Icons.check_circle,
                title: 'Lease Start',
                subtitle: 'Jan 1, 2023',
                status: _TimelineStatus.completed,
              ),
              _TimelineRow(
                icon: Icons.check_circle,
                title: 'Rent paid — on time',
                subtitle: 'Automatic payment complete',
                status: _TimelineStatus.current,
              ),
              _TimelineRow(
                icon: Icons.schedule,
                title: 'Next Rent Window',
                subtitle: 'Nov 1, 2023',
                status: _TimelineStatus.upcoming,
                trailing: ElevatedButton.icon(
                  onPressed: () => context.push('/app/adjustments/uneven-month'),
                  icon: const Icon(Icons.tune, size: 18),
                  label: const Text('Adjustments'),
                ),
              ),
              _TimelineRow(
                icon: Icons.flag,
                title: 'Lease End Date',
                subtitle: 'Dec 31, 2023',
                status: _TimelineStatus.upcoming,
              ),
              const SizedBox(height: 20),
              _ActionGrid(
                onDeposit: () => context.push('/app/timeline/deposit'),
                onRenewal: () => context.push('/app/timeline/renewal'),
                onTransition: () => context.push('/app/transition/early-exit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RuleUpdateCard extends StatelessWidget {
  const _RuleUpdateCard({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Icon(Icons.flag, color: theme.colorScheme.secondary),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'A rental rule has changed that may affect your lease.',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProgressSection extends StatelessWidget {
  const _ProgressSection({
    required this.label,
    required this.valueLabel,
    required this.progress,
  });

  final String label;
  final String valueLabel;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: theme.textTheme.titleMedium),
            Text(
              valueLabel,
              style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.primary),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: LinearProgressIndicator(
            minHeight: 10,
            value: progress,
            color: theme.colorScheme.primary,
            backgroundColor: theme.dividerColor,
          ),
        ),
      ],
    );
  }
}

enum _TimelineStatus { completed, current, upcoming }

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.status,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final _TimelineStatus status;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    Color iconColor;
    switch (status) {
      case _TimelineStatus.completed:
        iconColor = colorScheme.primary;
        break;
      case _TimelineStatus.current:
        iconColor = colorScheme.primary;
        break;
      case _TimelineStatus.upcoming:
        iconColor = colorScheme.secondary;
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: colorScheme.secondary),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

class _ActionGrid extends StatelessWidget {
  const _ActionGrid({
    required this.onDeposit,
    required this.onRenewal,
    required this.onTransition,
  });

  final VoidCallback onDeposit;
  final VoidCallback onRenewal;
  final VoidCallback onTransition;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _ActionTile(
          title: 'Deposit',
          subtitle: 'Coverage & maintenance',
          icon: Icons.account_balance_wallet,
          onTap: onDeposit,
        ),
        _ActionTile(
          title: 'Renewal',
          subtitle: 'Decide early',
          icon: Icons.event_repeat,
          onTap: onRenewal,
        ),
        _ActionTile(
          title: 'Transitions',
          subtitle: 'Early exit or reclaim',
          icon: Icons.logout,
          onTap: onTransition,
        ),
        _ActionTile(
          title: 'Notifications',
          subtitle: 'Rental updates',
          icon: Icons.notifications,
          onTap: () => context.push('/app/notifications'),
        ),
      ],
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: colorScheme.primary),
            ),
            const SizedBox(height: 10),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: colorScheme.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
