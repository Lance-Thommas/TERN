import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _unevenBg = Color(0xFFF8F7F6);
const _unevenPrimary = Color(0xFFE5A01F);

class UnevenMonthAdjustmentOfferScreen extends StatelessWidget {
  const UnevenMonthAdjustmentOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _unevenBg,
      appBar: AppBar(
        backgroundColor: _unevenBg,
        elevation: 0,
        actions: const [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text('UMAO', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
        title: const Text('Timeline Status'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 170),
            child: Column(
              children: [
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 2 / 1,
                          child: Image.network(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuABP9PaRh_TsSlpIbLb2unGElawEUEDVnHrl8xLWoEfAkWBRplWi-pi9QCCEnT3WTRlSIOH-wgPDcOZFAugwPTacqPYX-Tlvl2ihQVBnd566Fckd7a1JbKaXt0VBpqZEBzy6BYq5mCo6DISoctyu8wCUhdcNZZx3lMAPGvGG4tzJbQ5r1PiMdGFJFS769sjv10f74ImdF7qANL7KO_k3-9MDdh89wE69MwzKRyM19hJQooao9hacuMki9DZK22GQBXDJKraLN8n0i9H',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                          child: Container(color: _unevenPrimary.withValues(alpha: 0.08)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        'This month looks uneven. Want us to keep things smooth?',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineSmall?.copyWith(color: _unevenPrimary, fontWeight: FontWeight.w800, height: 1.2),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "No stress. Everything stays okay. We'll ensure your rent is paid on time, and your timeline status will change to 'Adjusted'.",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(color: const Color(0xFF6B665C), height: 1.5),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    children: const [
                      _BenefitTile(icon: Icons.event_available, label: 'Immediate Action', value: 'Rent paid on time'),
                      SizedBox(height: 10),
                      _BenefitTile(icon: Icons.tune, label: 'Status Change', value: "Timeline becomes 'Adjusted'"),
                      SizedBox(height: 10),
                      _BenefitTile(icon: Icons.trending_flat, label: 'Future Plan', value: 'Rebalance gradually'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
              decoration: BoxDecoration(
                color: Colors.white,
                border: const Border(top: BorderSide(color: Color(0xFFE5E0D6))),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, -2))],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _unevenPrimary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 6,
                        shadowColor: _unevenPrimary.withValues(alpha: 0.25),
                      ),
                      child: const Text('Yes, keep things smooth', style: TextStyle(fontWeight: FontWeight.w800)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: const BorderSide(color: Color(0xFF6B665C)),
                        foregroundColor: const Color(0xFF6B665C),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text("No thanks, I'll handle it myself", style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: IgnorePointer(
              ignoring: true,
              child: Container(
                height: 70,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFE5E0D6))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _BottomItem(icon: Icons.home, label: 'Home', active: false),
            _BottomItem(icon: Icons.view_timeline, label: 'Timeline', active: true),
            _BottomItem(icon: Icons.account_balance_wallet, label: 'Wallet', active: false),
            _BottomItem(icon: Icons.person, label: 'Profile', active: false),
          ],
        ),
      ),
    );
  }
}

class _BenefitTile extends StatelessWidget {
  const _BenefitTile({required this.icon, required this.label, required this.value});
  final IconData icon;
  final String label;
  final String value;

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
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(color: _unevenPrimary.withValues(alpha: 0.12), shape: BoxShape.circle),
            child: Icon(icon, color: _unevenPrimary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label.toUpperCase(), style: const TextStyle(color: Color(0xFF6B665C), fontWeight: FontWeight.w700, fontSize: 12)),
                const SizedBox(height: 3),
                Text(value, style: const TextStyle(color: Color(0xFF181511), fontWeight: FontWeight.w700)),
              ],
            ),
          ),
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
    final color = active ? _unevenPrimary : const Color(0xFF6B665C);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: active ? FontWeight.w700 : FontWeight.w500)),
      ],
    );
  }
}
