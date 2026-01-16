import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _depositBg = Color(0xFFF6F8F8);
const _depositPrimary = Color(0xFF11D4C4);

class DepositOverviewTenantScreen extends StatelessWidget {
  const DepositOverviewTenantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _depositBg,
      appBar: AppBar(
        backgroundColor: _depositBg,
        elevation: 0,
        actions: const [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text('DOT', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
        title: const Text('Deposit Overview'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          child: Column(
            children: [
              _HeroCard(),
              const SizedBox(height: 14),
              _StatsGrid(),
              const SizedBox(height: 14),
              _ProgressCard(),
              const SizedBox(height: 14),
              _ActionPanel(onViewCoverage: () {}),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _BottomNav(),
    );
  }
}

class _HeroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFDCE5E4)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -50,
            top: -50,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: _depositPrimary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: _depositPrimary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: _depositPrimary.withValues(alpha: 0.2)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.verified_user, color: _depositPrimary, size: 18),
                      const SizedBox(width: 6),
                      Text('Deposit Protected', style: theme.textTheme.labelSmall?.copyWith(color: _depositPrimary, fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text('Total Secure Amount', style: theme.textTheme.bodyMedium?.copyWith(color: const Color(0xFF638882))),
                const SizedBox(height: 4),
                Text('AED 12,000', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800, color: const Color(0xFF111817))),
                const SizedBox(height: 12),
                Divider(color: const Color(0xFFDCE5E4)),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _depositBg,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFDCE5E4)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(color: _depositPrimary.withValues(alpha: 0.2), shape: BoxShape.circle),
                        child: Icon(Icons.trending_up, color: _depositPrimary),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Earns Maintenance Coverage', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700, color: const Color(0xFF111817))),
                          const SizedBox(height: 4),
                          Text('Coverage grows over time automatically', style: theme.textTheme.bodySmall?.copyWith(color: const Color(0xFF638882))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: _StatCard(title: 'AED 450', subtitle: 'Available Maintenance Credit', icon: Icons.build_circle, iconColor: _depositPrimary)),
        SizedBox(width: 12),
        Expanded(child: _StatCard(title: '184', subtitle: 'Days Protected', icon: Icons.calendar_month, iconColor: Color(0xFF7C8B89))),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.title, required this.subtitle, required this.icon, required this.iconColor});
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFDCE5E4)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 22),
          const SizedBox(height: 10),
          Text(title, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800, color: const Color(0xFF111817), fontSize: 24)),
          const SizedBox(height: 4),
          Text(subtitle, style: theme.textTheme.bodySmall?.copyWith(color: const Color(0xFF638882))),
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFDCE5E4)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Coverage Accumulated', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(color: _depositPrimary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
                child: Text('15% of Cap', style: theme.textTheme.labelMedium?.copyWith(color: _depositPrimary, fontWeight: FontWeight.w800)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              minHeight: 10,
              value: 0.15,
              color: _depositPrimary,
              backgroundColor: _depositBg,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('AED 450 Earned', style: TextStyle(color: Color(0xFF638882), fontSize: 12)),
              Text('Cap: AED 3,000', style: TextStyle(color: Color(0xFF638882), fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionPanel extends StatelessWidget {
  const _ActionPanel({required this.onViewCoverage});
  final VoidCallback onViewCoverage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white, _depositBg],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFDCE5E4)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Icon(Icons.shield_outlined, color: _depositPrimary, size: 26),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Safety First', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                    const SizedBox(height: 6),
                    Text(
                      'Your deposit is held securely. You can use your accumulated coverage for repairs without touching your initial deposit.',
                      style: theme.textTheme.bodyMedium?.copyWith(color: const Color(0xFF638882), height: 1.4),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onViewCoverage,
              style: ElevatedButton.styleFrom(
                backgroundColor: _depositPrimary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                shadowColor: _depositPrimary.withValues(alpha: 0.25),
              ),
              child: const Text('View Coverage Details', style: TextStyle(fontWeight: FontWeight.w800)),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE3E8E7))),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _BottomItem(icon: Icons.home, label: 'Home', active: false),
          _BottomItem(icon: Icons.account_balance_wallet, label: 'Deposit', active: true),
          _BottomItem(icon: Icons.handyman, label: 'Services', active: false),
          _BottomItem(icon: Icons.person, label: 'Profile', active: false),
        ],
      ),
    );
  }
}

class _BottomItem extends StatelessWidget {
  const _BottomItem({required this.icon, required this.label, this.active = false});
  final IconData icon;
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = active ? _depositPrimary : const Color(0xFF9CAEA9);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 10, fontWeight: active ? FontWeight.w700 : FontWeight.w500, color: color)),
      ],
    );
  }
}
