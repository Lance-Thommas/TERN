import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _drBg = Color(0xFFFAFAFA);
const _drPrimary = Color(0xFF1EE6D2);

class DepositResolutionLandlordScreen extends StatelessWidget {
  const DepositResolutionLandlordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _drBg,
      appBar: AppBar(
        backgroundColor: _drBg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/app/deposit/resolution-landlord');
            }
          },
        ),
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(colors: [_drPrimary, Color(0xFF16B4A4)]).createShader(bounds),
          child: const Text('Deposit Resolution', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _StatusCard(),
                  const SizedBox(height: 14),
                  const _EvidenceSection(),
                  const SizedBox(height: 14),
                  const _Repairs(),
                  const SizedBox(height: 14),
                  const _Settlement(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          const _BottomBar(),
        ],
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  const _StatusCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F5F2),
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
        border: Border.all(color: const Color(0xFFE5E9E8)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(Icons.pending_actions, color: Colors.orange, size: 24),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ready for Review', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                SizedBox(height: 6),
                Text(
                  'Tenant checkout completed on Oct 24. Please review the findings and settlement below.',
                  style: TextStyle(color: Color(0xFF638884)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EvidenceSection extends StatelessWidget {
  const _EvidenceSection();

  @override
  Widget build(BuildContext context) {
    final items = const [
      ('Living Room Wall', 'Oct 24, 2023', 'https://lh3.googleusercontent.com/aida-public/AB6AXuAAd_FjtoJLOLD1gysa1YzICUA8P7U2QsMwC5UpcV4yR3HguoNnP4RNG3oYwGIcaD_ybGug3RPg_noR08Ti2qbXzOcKMlTV9nXaphtfcXKMgRhDyC9ildkKAFzyFXzCKN3Hkku3itePF9tYNq-XQa_m9S8i4FCG0JtGMYbY5XcBk2ITk28azuf8QFT8TCQ5ymSaQdVHYN-TkvPhUQG8XrzjXOLrzfIGs0wxfzX95frZPmjB6HqznrVD1UA0RCLJlRhfw_oeLRMxivx1'),
      ('Bath Faucet', 'Oct 24, 2023', 'https://lh3.googleusercontent.com/aida-public/AB6AXuA8FvKmiN-N79prF4VDuXsfHSnIsuXe9xzuCm0zh9wny-txmI3bWyZ4osJwO1ZxlQYztaDb0Lgw2HcoUehJcadIxJTOAWUv5KCdSbcFsBlRBT2YDBdVDrhC04tBp0y4WxsubvNCkqLD4oMZSIQ1yxdG6rYiOKo2qoZ2wX1nLSrvqQpBr3nLWT9bGDfBw-4Kpqs3BHNCQqWbWymNMBG0GZS_4qqpTBnVbS7E4eHJTYYRsj720Btsbp5NE_1JSvfMFUlhiXLZgx8WZv4q'),
      ('Bedroom Floor', 'Oct 24, 2023', 'https://lh3.googleusercontent.com/aida-public/AB6AXuDgXZZvdsB_RN9rxX_Eu-hTnYibBONTvakYY6d-gdGO2D65WP1ONJCkfxuc7oFDJ8gCVImlyR-2pZzhjWLjZuBvS451Kfe1KL4pxPuLyZtUjoPYYMHBalFwtVDi6vohUs34Af0rn5kGsaYjlZk0v4MFRpNmSfBYpblw8DkdrMx4w-iznA8If1qR4NFQu8-K5TOjiCCU64mNe1zmXX-GavbbWlbadv5PzGDZooTfg49M-cBnCpgcFJ-4rl5BpBuMwx-FrMO2p2Q-R4rP'),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Evidence Summary', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
            TextButton(onPressed: () {}, child: const Text('View all')),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 170,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(right: 6),
            itemBuilder: (context, index) {
              final item = items[index];
              return SizedBox(
                width: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(image: NetworkImage(item.$3), fit: BoxFit.cover),
                        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(item.$1, style: const TextStyle(fontWeight: FontWeight.w700)),
                    Text(item.$2, style: const TextStyle(color: Color(0xFF6B7280), fontSize: 12)),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: items.length,
          ),
        ),
      ],
    );
  }
}

class _Repairs extends StatelessWidget {
  const _Repairs();

  @override
  Widget build(BuildContext context) {
    final items = const [
      ('Paint Touch-up', 'Living room scuff marks repainted.', '200 AED', true),
      ('Broken Window Latch', 'Replacement of hardware required.', '-150 AED', false),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 6.0),
          child: Text('Repair Verification', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
        ),
        ...items.map((e) {
          final covered = e.$4;
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F5F2),
              borderRadius: BorderRadius.circular(14),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
              border: Border.all(color: covered ? _drPrimary.withValues(alpha: 0.2) : Colors.orange.withValues(alpha: 0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.$1, style: const TextStyle(fontWeight: FontWeight.w700)),
                    Text(e.$3, style: TextStyle(color: covered ? _drPrimary : Colors.orange, fontWeight: FontWeight.w700)),
                  ],
                ),
                const SizedBox(height: 6),
                Text(e.$2, style: const TextStyle(color: Color(0xFF6B7280), fontSize: 12)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: covered ? _drPrimary.withValues(alpha: 0.12) : const Color(0xFFFFF7ED),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(covered ? Icons.check_circle : Icons.remove_circle, color: covered ? _drPrimary : Colors.orange, size: 16),
                      const SizedBox(width: 6),
                      Text(
                        covered ? 'Covered by Maintenance Pot' : 'Deducted from Deposit',
                        style: TextStyle(color: covered ? _drPrimary : Colors.orange, fontWeight: FontWeight.w700, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class _Settlement extends StatelessWidget {
  const _Settlement();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 6.0, left: 2),
          child: Text('Final Settlement', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF6F5F2),
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
            border: Border.all(color: const Color(0xFFE5E9E8)),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const _Row(label: 'Original Deposit', value: '5,000 AED'),
              const SizedBox(height: 8),
              const _Row(label: 'Repair Costs', value: '- 350 AED', valueColor: Colors.red),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Row(
                    children: [
                      Text('Maintenance Coverage', style: TextStyle(color: Color(0xFF638884))),
                      SizedBox(width: 6),
                      Icon(Icons.shield, color: _drPrimary, size: 16),
                    ],
                  ),
                  Text('+ 200 AED', style: TextStyle(color: _drPrimary, fontWeight: FontWeight.w700)),
                ],
              ),
              const Divider(height: 20, color: Color(0xFFE5E9E8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('Net Payout', style: TextStyle(fontWeight: FontWeight.w800)),
                  Text('4,850 AED', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.label, required this.value, this.valueColor});
  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF638884))),
        Text(value, style: TextStyle(color: valueColor ?? const Color(0xFF111817), fontWeight: FontWeight.w700)),
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFE5E9E8))),
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  side: const BorderSide(color: Color(0xFFE5E9E8)),
                  foregroundColor: const Color(0xFF6B7280),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Raise Dispute'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: _drPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Approve Settlement', style: TextStyle(color: Color(0xFF111817), fontWeight: FontWeight.w800)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
