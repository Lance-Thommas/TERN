import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _aeBg = Color(0xFFF6F8F8);
const _aePrimary = Color(0xFF17CFB0);

class AfterExitContinuityRecordScreen extends StatelessWidget {
  const AfterExitContinuityRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _aeBg,
      appBar: AppBar(
        backgroundColor: _aeBg,
        elevation: 0,
        actions: const [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text('AECR', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
        title: const Text('Continuity Record'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 120),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [_aePrimary, Color(0xFF0F8A75)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: const Text('Continuity Record', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, height: 1.1, color: Colors.white)),
                      ),
                      const SizedBox(height: 6),
                      Text('Your tenancy has ended.', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _RefundCard(),
                  const SizedBox(height: 16),
                  _VerifiedHistory(),
                  const SizedBox(height: 16),
                  _Timeline(),
                  const SizedBox(height: 16),
                  _DownloadCTA(),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Color(0xFFDCE5E4))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _NavItem(icon: Icons.home, label: 'Home'),
                  _NavItem(icon: Icons.history_edu, label: 'Record', active: true),
                  _NavItem(icon: Icons.chat_bubble, label: 'Messages'),
                  _NavItem(icon: Icons.person, label: 'Profile'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RefundCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDCE5E4)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Final Deposit Refund', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
              Icon(Icons.account_balance_wallet, color: _aePrimary),
            ],
          ),
          const SizedBox(height: 8),
          const Text('AED 1,200.00', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Color(0xFF111817))),
          const SizedBox(height: 6),
          Row(
            children: const [
              Icon(Icons.check_circle, color: Color(0xFF638882), size: 18),
              SizedBox(width: 6),
              Text('Settled Oct 15, 2024', style: TextStyle(color: Color(0xFF638882), fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}

class _VerifiedHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = const [
      ('payments', 'Payment Consistency', 'On-time payments', '24/24'),
      ('verified', 'Lease Adherence', 'Terms fulfilled', ''),
      ('home_work', 'Property Care', 'Returned in good standing', ''),
      ('gavel', 'Disputes', 'Formal record', 'None'),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Text('Verified History', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFDCE5E4)),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
          ),
          child: Column(
            children: items.map((item) {
              final trailing = item.$4;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(color: _aePrimary.withValues(alpha: 0.12), shape: BoxShape.circle),
                          child: const Icon(Icons.check, color: _aePrimary),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.$2, style: const TextStyle(fontWeight: FontWeight.w800)),
                              const SizedBox(height: 2),
                              Text(item.$3, style: const TextStyle(color: Color(0xFF638882))),
                            ],
                          ),
                        ),
                        if (trailing.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: trailing == 'None' ? const Color(0xFFE8F5E9) : Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: Text(trailing, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF52705F))),
                          ),
                      ],
                    ),
                  ),
                  if (item != items.last)
                    const Divider(height: 1, thickness: 1, color: Color(0xFFE5E9E8)),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final entries = const [
      ('Move-in', 'Jan 15, 2022', Icons.key, false, true),
      ('Move-out', 'Jan 15, 2024', Icons.meeting_room, false, true),
      ('Finalized', 'Jan 16, 2024', Icons.assignment_turned_in, true, false),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 6),
          child: Text('Tenancy Timeline', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                for (var i = 0; i < entries.length; i++) ...[
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: entries[i].$4 ? _aePrimary : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: entries[i].$4 ? _aePrimary : const Color(0xFFDCE5E4)),
                      boxShadow: entries[i].$4
                          ? [const BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))]
                          : null,
                    ),
                    child: Icon(entries[i].$3, color: entries[i].$4 ? Colors.white : const Color(0xFF638882), size: 18),
                  ),
                  if (i != entries.length - 1)
                    Container(width: 2, height: 50, color: const Color(0xFFDCE5E4)),
                ]
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: entries.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.$1, style: TextStyle(color: e.$4 ? _aePrimary : const Color(0xFF111817), fontWeight: FontWeight.w800)),
                        const SizedBox(height: 4),
                        Text(e.$2, style: const TextStyle(color: Color(0xFF638882))),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DownloadCTA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download),
            label: const Text('Download Official Record', style: TextStyle(fontWeight: FontWeight.w700)),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: _aePrimary),
              foregroundColor: _aePrimary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'This record is immutable and verified on the TERN infrastructure.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFF638882), fontSize: 12),
        ),
      ],
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
    final color = active ? _aePrimary : const Color(0xFF638882);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: active ? FontWeight.w700 : FontWeight.w500)),
      ],
    );
  }
}
