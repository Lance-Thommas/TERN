import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _landlordUpdateBg = Color(0xFFF6F8F8);
const _landlordUpdatePrimary = Color(0xFF11D4C4);

class RentalUpdateImpactLandlordScreen extends StatelessWidget {
  const RentalUpdateImpactLandlordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _landlordUpdateBg,
      appBar: AppBar(
        backgroundColor: _landlordUpdateBg,
        elevation: 0,
        actions: const [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text('RUIL', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/app/notifications');
            }
          },
        ),
        title: const Text('Rental Update (Landlord)'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 120),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [_landlordUpdatePrimary, Color(0xFF0FA6D8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: const Text('Rental update (Landlord)', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, height: 1.1, color: Colors.white)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'New reclaim rules require updated notice periods and clearer tenant communications.',
                    style: theme.textTheme.titleMedium?.copyWith(color: const Color(0xFF111817), height: 1.5),
                  ),
                  const SizedBox(height: 18),
                  _ImpactCard(),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => context.go('/app/notifications'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: Color(0xFFE0E6E5)),
                        foregroundColor: const Color(0xFF616F6D),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Dismiss'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'This is informational. Your contract terms still apply.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF94A3AF), fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          const _BottomNav(),
        ],
      ),
    );
  }
}

class _ImpactCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _landlordUpdatePrimary.withValues(alpha: 0.2)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('For your portfolio, this means:', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
              const Icon(Icons.gavel, color: _landlordUpdatePrimary),
            ],
          ),
          const SizedBox(height: 12),
          _Point(text: 'Update notices to match new reclaim requirements.'),
          const SizedBox(height: 10),
          _Point(text: 'Communicate timelines to tenants to reduce disputes.'),
          const SizedBox(height: 10),
          _Point(text: 'Log compliance in your continuity records.'),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: _landlordUpdatePrimary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _landlordUpdatePrimary.withValues(alpha: 0.2)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.verified, color: _landlordUpdatePrimary, size: 16),
                SizedBox(width: 6),
                Text('Verified guidance', style: TextStyle(color: _landlordUpdatePrimary, fontWeight: FontWeight.w800, fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Point extends StatelessWidget {
  const _Point({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check_circle, color: _landlordUpdatePrimary, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Text(text, style: const TextStyle(color: Color(0xFF111817), height: 1.4, fontWeight: FontWeight.w600)),
        ),
      ],
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
            _NavItem(icon: Icons.description, label: 'Leases', active: true),
            _NavItem(icon: Icons.account_balance_wallet, label: 'Wallet'),
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
    final color = active ? _landlordUpdatePrimary : const Color(0xFF9CA3AF);
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
