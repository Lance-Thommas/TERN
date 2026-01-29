import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _transBg = Color(0xFFF6F8F8);
const _transPrimary = Color(0xFF17CFB0);

class TransitionScreen extends StatelessWidget {
  const TransitionScreen({super.key, required this.title, required this.designRef});

  final String title;
  final String designRef;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _transBg,
      appBar: AppBar(
        backgroundColor: _transBg,
        elevation: 0,
        actions: const [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text('T', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        title: Text(title),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/app/transition/early-exit');
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [_transPrimary, Color(0xFF0E8A75)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Plan transitions calmly', style: theme.textTheme.titleMedium?.copyWith(color: Colors.white70)),
                  const SizedBox(height: 6),
                  Text(
                    'Use the tools below to manage exits and continuity.',
                    style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w800, height: 1.2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _ActionCard(
              title: 'Signal Early Exit',
              subtitle: 'Freeze penalties and switch lease to Transition state.',
              icon: Icons.logout,
              onTap: () => context.push('/app/transition/early-exit/step-1'),
            ),
            const SizedBox(height: 12),
            _ActionCard(
              title: 'Request Flexibility',
              subtitle: 'Bounded extensions to fit your move-out timeline.',
              icon: Icons.swap_horiz,
              onTap: () => context.push('/app/transition/request-flexibility'),
            ),
            const SizedBox(height: 12),
            _ActionCard(
              title: 'Continuity Record',
              subtitle: 'View verified history and final settlement.',
              icon: Icons.history_edu,
              onTap: () => context.push('/app/transition/continuity-record'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({required this.title, required this.subtitle, required this.icon, required this.onTap});
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
          border: Border.all(color: const Color(0xFFDCE5E4)),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(color: _transPrimary.withValues(alpha: 0.15), shape: BoxShape.circle),
              child: Icon(icon, color: _transPrimary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: theme.textTheme.bodySmall?.copyWith(color: const Color(0xFF6E7B78), height: 1.3)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFF6E7B78)),
          ],
        ),
      ),
    );
  }
}
