import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _updateBg = Color(0xFFF6F8F8);
const _updatePrimary = Color(0xFF11D4C4);

class RentalUpdateWhatThisMeansForYouScreen extends StatelessWidget {
  const RentalUpdateWhatThisMeansForYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _updateBg,
      appBar: AppBar(
        backgroundColor: _updateBg,
        elevation: 0,
        actions: const [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text('RUWTMFY', style: TextStyle(fontWeight: FontWeight.w700)),
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
        title: const Text('Rental update (UAE)'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [_updatePrimary, Color(0xFF0FA6D8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: const Text('Rental update (UAE)', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, height: 1.1, color: Colors.white)),
              ),
              const SizedBox(height: 10),
              Text(
                'New RERA regulations have adjusted the required notice period for eviction regarding landlord reclaim in Dubai.',
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
        border: Border.all(color: _updatePrimary.withValues(alpha: 0.2)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('For your lease, this means:', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
              const Icon(Icons.shield, color: _updatePrimary),
            ],
          ),
          const SizedBox(height: 12),
          _Point(text: 'Your current notice period remains valid and unchanged.'),
          const SizedBox(height: 10),
          _Point(text: 'No immediate action is required from you at this time.'),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: _updatePrimary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _updatePrimary.withValues(alpha: 0.2)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.verified, color: _updatePrimary, size: 16),
                SizedBox(width: 6),
                Text('Verified for your contract', style: TextStyle(color: _updatePrimary, fontWeight: FontWeight.w800, fontSize: 11)),
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
        const Icon(Icons.check_circle, color: _updatePrimary, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Text(text, style: const TextStyle(color: Color(0xFF111817), height: 1.4, fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}
