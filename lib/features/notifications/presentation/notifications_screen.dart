import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _notifPrimary = Color(0xFF17CFB0);

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [_notifPrimary, Color(0xFF0D8C76)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text('Rental Updates', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.only(bottom: 90),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
                child: Text(
                  'Archive of rental law changes and news relevant to your lease region.',
                  style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
                ),
              ),
              _FilterChips(),
              const SizedBox(height: 10),
              _NewsCard(
                date: 'Jan 1, 2024',
                relevanceLabel: 'High Relevance',
                relevanceColor: _notifPrimary,
                title: 'Rent Control Cap Adjustment 2024',
                body: 'Maximum allowable rent increase for stabilized units set to 3% for 2024.',
                impact: 'Yes. Your renewal offer must not exceed a 3% increase if you choose to renew in 2024.',
                onTap: () => context.push('/app/notifications/update'),
              ),
              _NewsCard(
                date: 'Oct 15, 2023',
                relevanceLabel: 'FYI Only',
                relevanceColor: const Color(0xFF9CA3AF),
                title: 'Winter Heating Ordinance',
                body: 'Landlords must maintain a minimum indoor temperature during the heating season.',
                impact: 'Partially. Relevant only if you pay for utilities directly.',
                onTap: () => context.push('/app/notifications/update'),
              ),
              _NewsCard(
                date: 'Sep 1, 2023',
                relevanceLabel: 'Review',
                relevanceColor: const Color(0xFFF59E0B),
                title: 'Security Deposit Interest Rates',
                body: 'New legislation requires interest on security deposits held over 12 months.',
                impact: 'Yes. Check your account statement to ensure interest is credited.',
                onTap: () => context.push('/app/notifications/update'),
              ),
              const SizedBox(height: 16),
              _Pagination(),
            ],
          ),
          const _BottomNav(),
        ],
      ),
    );
  }
}

class _FilterChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        children: [
          _Chip(label: 'All Years', active: true, icon: Icons.expand_more),
          _Chip(label: '2024'),
          _Chip(label: '2023'),
          _Chip(label: 'Region'),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label, this.active = false, this.icon});
  final String label;
  final bool active;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final bg = active ? _notifPrimary.withValues(alpha: 0.1) : const Color(0xFFF0F4F4);
    final fg = active ? _notifPrimary : const Color(0xFF111817);
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(18), border: Border.all(color: active ? _notifPrimary.withValues(alpha: 0.3) : Colors.transparent)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: TextStyle(color: fg, fontWeight: active ? FontWeight.w700 : FontWeight.w600, fontSize: 12)),
            if (icon != null) ...[
              const SizedBox(width: 4),
              Icon(icon, color: fg, size: 16),
            ],
          ],
        ),
      ),
    );
  }
}

class _NewsCard extends StatelessWidget {
  const _NewsCard({
    required this.date,
    required this.relevanceLabel,
    required this.relevanceColor,
    required this.title,
    required this.body,
    required this.impact,
    required this.onTap,
  });

  final String date;
  final String relevanceLabel;
  final Color relevanceColor;
  final String title;
  final String body;
  final String impact;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF6F5F2),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(date, style: const TextStyle(color: Color(0xFF6B7280), fontWeight: FontWeight.w700, fontSize: 12)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: relevanceColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10), border: Border.all(color: relevanceColor.withValues(alpha: 0.2))),
                    child: Text(relevanceLabel, style: TextStyle(color: relevanceColor, fontWeight: FontWeight.w800, fontSize: 11)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 6),
              Text(body, style: theme.textTheme.bodyMedium?.copyWith(color: const Color(0xFF111817), height: 1.4)),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: relevanceColor.withValues(alpha: 0.3)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(relevanceColor == _notifPrimary ? Icons.check_circle : Icons.info, color: relevanceColor, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Does this affect my lease?', style: theme.textTheme.labelSmall?.copyWith(color: relevanceColor, fontWeight: FontWeight.w800)),
                          const SizedBox(height: 4),
                          Text(impact, style: const TextStyle(color: Color(0xFF111817), height: 1.4)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Pagination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: null, icon: const Icon(Icons.chevron_left, color: Colors.grey)),
          const SizedBox(width: 8),
          const Text('Page 1 of 4', style: TextStyle(color: Color(0xFF6B7280))),
          const SizedBox(width: 8),
          IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right, color: Colors.grey)),
        ],
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFE5E9E8))),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            _NavItem(icon: Icons.home, label: 'Home'),
            _NavItem(icon: Icons.search, label: 'Search'),
            _NavItem(icon: Icons.help, label: 'Help', active: true),
            _NavItem(icon: Icons.person, label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.icon, required this.label, this.active = false});
  final IconData icon;
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = active ? _notifPrimary : const Color(0xFF9CA3AF);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: active ? FontWeight.w700 : FontWeight.w500)),
      ],
    );
  }
}
