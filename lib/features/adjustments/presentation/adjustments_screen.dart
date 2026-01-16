import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _adjustBg = Color(0xFFF8F7F6);
const _adjustPrimary = Color(0xFFE5A01F);

class AdjustmentsScreen extends StatelessWidget {
  const AdjustmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _adjustBg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: const [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text('A', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        title: const Text('Adjustments'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [_adjustPrimary, Color(0xFFB37D18)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Stay on track, calmly', style: theme.textTheme.titleMedium?.copyWith(color: Colors.white70)),
                  const SizedBox(height: 6),
                  Text(
                    'Choose an adjustment path to keep your timeline smooth.',
                    style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w800, height: 1.2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _AdjustmentCard(
              title: 'Uneven month',
              subtitle: 'We can smooth cash flow and keep rent paid on time.',
              icon: Icons.balance,
              onTap: () => context.push('/app/adjustments/uneven-month'),
            ),
            const SizedBox(height: 12),
            _AdjustmentCard(
              title: 'Clear exits reduce loss',
              subtitle: 'Design calm endings with clear costs and options.',
              icon: Icons.logout,
              onTap: () => context.push('/app/adjustments/clear-exits'),
            ),
            const SizedBox(height: 12),
            _AdjustmentCard(
              title: 'Request flexibility',
              subtitle: 'Ask for bounded extensions that fit your move-out timeline.',
              icon: Icons.swap_horiz,
              onTap: () => context.push('/app/transition/request-flexibility'),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdjustmentCard extends StatelessWidget {
  const _AdjustmentCard({
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
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE5E0D6)),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _adjustPrimary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: _adjustPrimary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(color: const Color(0xFF887B63), height: 1.3),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFF887B63)),
          ],
        ),
      ),
    );
  }
}
