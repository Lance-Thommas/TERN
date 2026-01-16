import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _wlBg = Color(0xFFF6F8F8);
const _wlPrimary = Color(0xFF1EE6D2);

class WelcomeToTernLandlordSideScreen extends StatelessWidget {
  const WelcomeToTernLandlordSideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _wlBg,
      appBar: AppBar(
        backgroundColor: _wlBg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
        title: const Text('Welcome to TERN'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          children: const [
            SizedBox(height: 10),
            _Hero(),
            SizedBox(height: 16),
            _Highlights(),
            SizedBox(height: 16),
            _Actions(),
          ],
        ),
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Colors.white, Color(0xFFE8EAEE)], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE5E9E8)),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Welcome to TERN', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
            SizedBox(height: 8),
            Text('Protect continuity, reduce vacancy, and simplify renewals across your portfolio.', style: TextStyle(color: Color(0xFF5F6B6A), height: 1.4)),
            SizedBox(height: 12),
            _Pill(icon: Icons.check, label: 'Continuity-first portfolio view'),
            SizedBox(height: 6),
            _Pill(icon: Icons.shield, label: 'Bounded exits and compliant reclaim'),
            SizedBox(height: 6),
            _Pill(icon: Icons.auto_graph, label: 'Forecasted timelines for every unit'),
          ],
        ),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: _wlPrimary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _wlPrimary.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: _wlPrimary, size: 18),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF112120))),
        ],
      ),
    );
  }
}

class _Highlights extends StatelessWidget {
  const _Highlights();

  @override
  Widget build(BuildContext context) {
    final items = const [
      ('Continuity', 'Keep leases active or gracefully transitioned with bounded risk.'),
      ('Portfolio health', 'See renewals, adjustments, and transitions in one timeline.'),
      ('Tenant trust', 'Transparent notices and verified records reduce disputes.'),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Why landlords choose TERN', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          ...items.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFE5E9E8)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(color: _wlPrimary.withValues(alpha: 0.1), shape: BoxShape.circle),
                      child: const Icon(Icons.apartment, color: _wlPrimary),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e.$1, style: const TextStyle(fontWeight: FontWeight.w800)),
                          const SizedBox(height: 4),
                          Text(e.$2, style: const TextStyle(color: Color(0xFF5F6B6A), height: 1.4)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.push('/onboarding/property-setup'),
              style: ElevatedButton.styleFrom(
                backgroundColor: _wlPrimary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Set up your first property', style: TextStyle(color: Color(0xFF112120), fontWeight: FontWeight.w800)),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => context.go('/app/landlord/portfolio'),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFE5E9E8)),
                foregroundColor: const Color(0xFF5F6B6A),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Skip to portfolio'),
            ),
          ),
        ],
      ),
    );
  }
}
