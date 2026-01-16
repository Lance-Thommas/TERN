import 'package:flutter/material.dart';
const _settleBg = Color(0xFFF6F8F8);
const _settlePrimary = Color(0xFF11D4C4);

class MoveOutAndDepositSettlementScreen extends StatelessWidget {
  const MoveOutAndDepositSettlementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _settleBg,
      appBar: AppBar(
        backgroundColor: _settleBg,
        elevation: 0,
        actions: const [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text('MOD', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        leadingWidth: 48,
        leading: const SizedBox(width: 12),
        title: Text('Move-Out Complete', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
        centerTitle: true,
        toolbarHeight: 56,
        actionsIconTheme: const IconThemeData(color: _settlePrimary),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 12),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    _Hero(),
                    const SizedBox(height: 8),
                    _Chips(),
                    const SizedBox(height: 12),
                    _BreakdownCard(),
                    const SizedBox(height: 14),
                    _ReceiptButton(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Text(
                '"That was surprisingly calm."',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(color: const Color(0xFF7D8C89), fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 8),
        CircleAvatar(
          radius: 48,
          backgroundColor: _settlePrimary,
          child: Icon(Icons.check_circle, color: Colors.white, size: 42),
        ),
        SizedBox(height: 16),
        Text(
          'Your tenancy has ended.\nYour deposit has been settled.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Color(0xFF111817), height: 1.2),
        ),
      ],
    );
  }
}

class _Chips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: _settlePrimary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: _settlePrimary.withValues(alpha: 0.2)),
            ),
            child: Row(
              children: const [
                Icon(Icons.verified, color: _settlePrimary, size: 18),
                SizedBox(width: 6),
                Text('Settled', style: TextStyle(color: _settlePrimary, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BreakdownCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E9E8)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 4,
            width: double.infinity,
            decoration: BoxDecoration(color: _settlePrimary, borderRadius: const BorderRadius.all(Radius.circular(2))),
          ),
          const SizedBox(height: 12),
          const Text('Full deposit returned', style: TextStyle(color: Color(0xFF6B7280), fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const Text('AED 5,000', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: Color(0xFF111817))),
          const SizedBox(height: 16),
          _BreakRow(label: 'Original Deposit', value: 'AED 5,000'),
          _BreakRow(label: 'Deductions', value: 'AED 0.00', muted: true),
          const _MaintenanceRow(),
          const Divider(height: 24),
          const _BreakRow(label: 'Net Refund', value: 'AED 5,000', highlight: true),
        ],
      ),
    );
  }
}

class _BreakRow extends StatelessWidget {
  const _BreakRow({required this.label, required this.value, this.muted = false, this.highlight = false});
  final String label;
  final String value;
  final bool muted;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final color = highlight ? _settlePrimary : (muted ? const Color(0xFF9CA3AF) : const Color(0xFF111817));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: muted ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563), fontWeight: FontWeight.w600)),
          Text(value, style: TextStyle(color: color, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _MaintenanceRow extends StatelessWidget {
  const _MaintenanceRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Text('Maintenance', style: TextStyle(color: Color(0xFF4B5563), fontWeight: FontWeight.w600)),
              SizedBox(width: 4),
              Icon(Icons.info, size: 16, color: Color(0xFF9CA3AF)),
            ],
          ),
          Row(
            children: const [
              Icon(Icons.shield, size: 16, color: _settlePrimary),
              SizedBox(width: 4),
              Text('Included', style: TextStyle(color: _settlePrimary, fontWeight: FontWeight.w700)),
            ],
          ),
        ],
      ),
    );
  }
}

class _ReceiptButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        side: const BorderSide(color: Color(0xFFE5E9E8)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        foregroundColor: const Color(0xFF111817),
      ),
      icon: const Icon(Icons.receipt_long, size: 20),
      label: const Text('View Transaction Receipt', style: TextStyle(fontWeight: FontWeight.w700)),
    );
  }
}
