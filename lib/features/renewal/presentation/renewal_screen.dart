import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RenewalScreen extends StatelessWidget {
  const RenewalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gradient = LinearGradient(
      colors: [theme.colorScheme.primary, theme.colorScheme.tertiary],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      appBar: AppBar(
        actions: [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text('R', style: const TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        title: const Text('Renewal Decision'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              ShaderMask(
                shaderCallback: (rect) => gradient.createShader(rect),
                child: Text(
                  'Your lease is nearing a decision point.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Review your options below to choose the path that suits you best. Take your time, there is no rush.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.secondary),
              ),
              const SizedBox(height: 22),
              _PrimaryCard(onRenew: () => context.push('/app/timeline')),
              const SizedBox(height: 16),
              _SecondaryCard(
                title: 'Plan a Transition',
                icon: Icons.calendar_month,
                body: 'Need flexibility? Structure a move-out plan that works for your timeline.',
                ctaLabel: 'Explore Options',
                onTap: () => context.push('/app/renewal/options'),
              ),
              const SizedBox(height: 12),
              _SecondaryCard(
                title: 'Exit Lease',
                icon: Icons.logout,
                body: 'End your tenancy at the conclusion of your current term.',
                ctaLabel: 'Initiate Exit',
                onTap: () => context.push('/app/transition/early-exit'),
                isOutlined: true,
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.open_in_new, size: 16),
                  label: const Text('Need help deciding?'),
                  style: TextButton.styleFrom(foregroundColor: theme.colorScheme.primary),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _PrimaryCard extends StatelessWidget {
  const _PrimaryCard({required this.onRenew});
  final VoidCallback onRenew;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primary.withValues(alpha: 0.16),
                  theme.colorScheme.primary.withValues(alpha: 0.08),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 6)),
              ],
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.primary.withValues(alpha: 0.25),
                      theme.colorScheme.primary.withValues(alpha: 0.12),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary.withValues(alpha: 0.18),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(Icons.verified, color: theme.colorScheme.primary),
                        ),
                        const SizedBox(width: 10),
                        Text('Renew Lease', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Continue living in your home with locked-in rates. This is the simplest way to secure your housing stability.',
                      style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.secondary),
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: onRenew,
                        child: const Text('Renew Now'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SecondaryCard extends StatelessWidget {
  const _SecondaryCard({
    required this.title,
    required this.icon,
    required this.body,
    required this.ctaLabel,
    required this.onTap,
    this.isOutlined = false,
  });

  final String title;
  final IconData icon;
  final String body;
  final String ctaLabel;
  final VoidCallback onTap;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: theme.colorScheme.primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                      const SizedBox(height: 6),
                      Text(body, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.secondary)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: isOutlined
                  ? OutlinedButton(onPressed: onTap, child: Text(ctaLabel))
                  : ElevatedButton(onPressed: onTap, child: Text(ctaLabel)),
            ),
          ],
        ),
      ),
    );
  }
}
