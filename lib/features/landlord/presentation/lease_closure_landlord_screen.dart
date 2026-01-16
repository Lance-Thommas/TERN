import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _lcBg = Color(0xFFF6F8F8);
const _lcPrimary = Color(0xFF1EE6D2);

class LeaseClosureLandlordScreen extends StatelessWidget {
  const LeaseClosureLandlordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _lcBg,
      appBar: AppBar(
        backgroundColor: _lcBg,
        elevation: 0,
        actions: const [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text('LCL', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
        title: const Text('Lease Closure'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 120),
            child: Column(
              children: [
                const SizedBox(height: 12),
                _Header(),
                const Divider(height: 24, thickness: 1, color: Color(0xFFE5E9E8)),
                _SettlementCard(),
                const SizedBox(height: 20),
                _Actions(),
                const SizedBox(height: 24),
              ],
            ),
          ),
          const _BottomNav(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 6),
        _SuccessIcon(),
        SizedBox(height: 12),
        Text('Tenancy completed', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
        SizedBox(height: 4),
        Text('Unit 402, Marina Heights', style: TextStyle(color: Color(0xFF638884), fontWeight: FontWeight.w600)),
        SizedBox(height: 12),
        _StatusChip(),
      ],
    );
  }
}

class _SuccessIcon extends StatelessWidget {
  const _SuccessIcon();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(color: _lcPrimary.withValues(alpha: 0.15), shape: BoxShape.circle),
          child: const Icon(Icons.check_circle, color: _lcPrimary, size: 58),
        ),
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: _lcPrimary.withValues(alpha: 0.3)),
          ),
        ),
      ],
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: _lcPrimary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _lcPrimary.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.verified, color: _lcPrimary, size: 18),
          SizedBox(width: 6),
          Text('Property ready for re-leasing', style: TextStyle(color: Color(0xFF112120), fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _SettlementCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 6),
            child: Text('Settlement summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))],
              border: Border.all(color: const Color(0xFFE5E9E8)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: const [
                      _RowItem(label: 'Security Deposit', value: 'AED 5,000'),
                      SizedBox(height: 10),
                      _RowItem(label: 'Maintenance Deductions', value: '- AED 250', valueColor: Colors.red),
                      SizedBox(height: 12),
                      Divider(height: 1, color: Color(0xFFE5E9E8)),
                      SizedBox(height: 10),
                      _TotalRow(),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F8F8),
                    border: Border(top: BorderSide(color: Colors.grey.shade200)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.info_outline, color: Color(0xFF9CA3AF), size: 18),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Funds have been transferred to your registered bank account ending in •••• 4291.',
                          style: TextStyle(color: Color(0xFF6B7280), fontSize: 12, height: 1.4),
                        ),
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

class _RowItem extends StatelessWidget {
  const _RowItem({required this.label, required this.value, this.valueColor});
  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF638884), fontWeight: FontWeight.w600)),
        Text(value, style: TextStyle(color: valueColor ?? const Color(0xFF111817), fontWeight: FontWeight.w700)),
      ],
    );
  }
}

class _TotalRow extends StatelessWidget {
  const _TotalRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text('Net Settlement', style: TextStyle(fontWeight: FontWeight.w800)),
        Text('AED 4,750', style: TextStyle(color: Color(0xFF112120), fontSize: 20, fontWeight: FontWeight.w800)),
      ],
    );
  }
}

class _Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward, color: Color(0xFF112120)),
              label: const Text('List Property Now', style: TextStyle(color: Color(0xFF112120), fontWeight: FontWeight.w800)),
              style: ElevatedButton.styleFrom(
                backgroundColor: _lcPrimary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 2,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => context.push('/app/landlord/history'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(color: Color(0xFFE5E9E8)),
                foregroundColor: const Color(0xFF638884),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('View Tenancy History'),
            ),
          ),
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
            _NavItem(icon: Icons.grid_view, label: 'Home'),
            _NavItem(icon: Icons.real_estate_agent, label: 'Properties', active: true),
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
    final color = active ? _lcPrimary : const Color(0xFF9CA3AF);
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
