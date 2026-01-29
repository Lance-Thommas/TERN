import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _unevenStatusBg = Color(0xFFF8F7F6);
const _unevenStatusPrimary = Color(0xFFE5A01F);

class UnevenMonthScreen extends StatelessWidget {
  const UnevenMonthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _unevenStatusBg,
      appBar: AppBar(
        backgroundColor: _unevenStatusBg,
        actions: const [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text('UM', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        title: const Text('Timeline Status'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/app/adjustments');
            }
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [_unevenStatusPrimary, Color(0xFFB37D18)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.check_circle, color: Colors.white),
                            SizedBox(width: 8),
                            Text('Adjusted', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'We are keeping things smooth this month.',
                          style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 6),
                        const Text('Rent will be paid on time, and your timeline now shows Adjusted status.', style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const _StatusTile(
                    icon: Icons.event_available,
                    title: 'Paid on time',
                    body: 'We covered this month so you stay current.',
                  ),
                  const SizedBox(height: 10),
                  const _StatusTile(
                    icon: Icons.tune,
                    title: 'Timeline updated',
                    body: "Status set to 'Adjusted' with notes for your landlord.",
                  ),
                  const SizedBox(height: 10),
                  const _StatusTile(
                    icon: Icons.trending_flat,
                    title: 'Next steps',
                    body: 'We will rebalance gradually over the coming months.',
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Color(0xFFE5E0D6))),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => context.go('/app/timeline'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _unevenStatusPrimary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Back to timeline', style: TextStyle(fontWeight: FontWeight.w800)),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(foregroundColor: const Color(0xFF6B665C)),
                  child: const Text('View adjustment details'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusTile extends StatelessWidget {
  const _StatusTile({required this.icon, required this.title, required this.body});
  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E0D6)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(color: _unevenStatusPrimary.withValues(alpha: 0.12), shape: BoxShape.circle),
            child: Icon(icon, color: _unevenStatusPrimary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF181511))),
                const SizedBox(height: 4),
                Text(body, style: const TextStyle(color: Color(0xFF6B665C), height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
