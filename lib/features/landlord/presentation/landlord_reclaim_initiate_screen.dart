import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _reclaimBg = Color(0xFFF6F8F8);
const _reclaimPrimary = Color(0xFF1EE6D2);

class LandlordReclaimInitiateScreen extends StatelessWidget {
  const LandlordReclaimInitiateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _reclaimBg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
        title: const Text('Initiate Reclaim'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 110),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [_reclaimPrimary, Color(0xFF14B8A8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: const Text('Reclaim Property', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white)),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Select the legal ground for reclaiming possession. This action initiates a compliant transition process and is required to proceed.',
                    style: TextStyle(color: Color(0xFF4B5563), height: 1.5),
                  ),
                  const SizedBox(height: 14),
                  ...[
                    _RadioTile(title: 'Intention to Sell', subtitle: 'Property will be listed for sale immediately'),
                    _RadioTile(title: 'Personal Occupation', subtitle: 'Owner intends to move into the property', checked: true),
                    _RadioTile(title: 'Family Member Occupation', subtitle: 'Immediate family member requires housing'),
                    _RadioTile(title: 'Major Renovation', subtitle: 'Requires vacant possession for works'),
                  ],
                  const SizedBox(height: 16),
                  _ImpactCard(),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.gavel, color: Color(0xFF9CA3AF)),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'By proceeding, you confirm that the selected reason is genuine. False declarations may result in penalties under local housing regulations.',
                          style: TextStyle(color: Color(0xFF6B7280), fontSize: 12, height: 1.4),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Color(0xFFE5E9E8))),
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward, color: Color(0xFF112120)),
                  label: const Text('Initiate Property Reclaim', style: TextStyle(color: Color(0xFF112120), fontWeight: FontWeight.w800)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _reclaimPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RadioTile extends StatelessWidget {
  const _RadioTile({required this.title, required this.subtitle, this.checked = false});
  final String title;
  final String subtitle;
  final bool checked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: checked ? _reclaimPrimary : const Color(0xFFE5E7EB)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: Color(0xFF6B7280), fontSize: 12)),
                ],
              ),
            ),
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: checked ? _reclaimPrimary : const Color(0xFFD1D5DB), width: 2),
                color: checked ? _reclaimPrimary.withValues(alpha: 0.12) : Colors.white,
              ),
              child: checked
                  ? const Center(child: Icon(Icons.check, size: 14, color: _reclaimPrimary))
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class _ImpactCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF111827)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.info, color: _reclaimPrimary),
              SizedBox(width: 8),
              Text('Impact Summary', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
            ],
          ),
          const SizedBox(height: 12),
          _ImpactPoint(icon: Icons.published_with_changes, title: 'Lease State Change', body: "Status updates to 'Transition (Landlord-Initiated)' immediately."),
          const SizedBox(height: 10),
          _ImpactPoint(icon: Icons.lock_clock, title: 'Locked Timelines', body: 'Statutory notice periods apply. Dates cannot be edited once initiated.'),
          const SizedBox(height: 10),
          _ImpactPoint(icon: Icons.visibility, title: 'Tenant Visibility', body: 'Tenant receives immediate notification of the reclaim intent.'),
        ],
      ),
    );
  }
}

class _ImpactPoint extends StatelessWidget {
  const _ImpactPoint({required this.icon, required this.title, required this.body});
  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.white70, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text(body, style: const TextStyle(color: Colors.white70, fontSize: 12, height: 1.4)),
            ],
          ),
        ),
      ],
    );
  }
}
