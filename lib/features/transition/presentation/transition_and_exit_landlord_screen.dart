import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _tlBg = Color(0xFFF6F8F8);
const _tlPrimary = Color(0xFF1EE6D2);

class TransitionAndExitLandlordScreen extends StatelessWidget {
  const TransitionAndExitLandlordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _tlBg,
      appBar: AppBar(
        backgroundColor: _tlBg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
        title: const Text('Transition & Exit'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: const [
          SizedBox(height: 10),
          _HeroCard(),
          SizedBox(height: 16),
          _ActionList(),
        ],
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Colors.white, Color(0xFFE8EAEE)], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE5E9E8)),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Keep exits orderly', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
            SizedBox(height: 6),
            Text('Bound penalties, align timelines, and notify tenants calmly through TERN workflows.', style: TextStyle(color: Color(0xFF5F6B6A), height: 1.4)),
          ],
        ),
      ),
    );
  }
}

class _ActionList extends StatelessWidget {
  const _ActionList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _Card(
            title: 'Initiate Reclaim',
            subtitle: 'Select legal ground, lock dates, notify tenant.',
            icon: Icons.gavel,
            onTap: () => context.push('/app/transition/reclaim-initiate'),
          ),
          _Card(
            title: 'Tenant Transition',
            subtitle: 'Timeline projections and options for orderly exit.',
            icon: Icons.trending_up,
            onTap: () => context.push('/app/notifications/landlord/transition-signal'),
          ),
          _Card(
            title: 'Rental Rule Updates',
            subtitle: 'Stay compliant with latest reclaim timelines.',
            icon: Icons.rule,
            onTap: () => context.push('/app/notifications/landlord/rental-rule'),
          ),
          _Card(
            title: 'Lease Closure',
            subtitle: 'Settle deposits, record continuity, relist quickly.',
            icon: Icons.check_circle,
            onTap: () => context.push('/app/transition/lease-closure'),
          ),
          _Card(
            title: 'History',
            subtitle: 'Neutral record of prior tenancies for this unit.',
            icon: Icons.history_edu,
            onTap: () => context.push('/app/landlord/history'),
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.title, required this.subtitle, required this.icon, required this.onTap});
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE5E9E8)),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(color: _tlPrimary.withValues(alpha: 0.12), shape: BoxShape.circle),
                child: Icon(icon, color: _tlPrimary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
                    const SizedBox(height: 4),
                    Text(subtitle, style: const TextStyle(color: Color(0xFF5F6B6A), height: 1.4)),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF9CA3AF)),
            ],
          ),
        ),
      ),
    );
  }
}
