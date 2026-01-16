import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _renewConfirmBg = Color(0xFFF6F8F8);
const _renewConfirmPrimary = Color(0xFF17CFB0);

class RenewNowConfirmationScreen extends StatefulWidget {
  const RenewNowConfirmationScreen({super.key});

  @override
  State<RenewNowConfirmationScreen> createState() => _RenewNowConfirmationScreenState();
}

class _RenewNowConfirmationScreenState extends State<RenewNowConfirmationScreen> {
  bool _agreed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _renewConfirmBg,
      appBar: AppBar(
        backgroundColor: _renewConfirmBg,
        actions: const [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text('RNC', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
        title: const Text('Renew Now'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [_renewConfirmPrimary, Color(0xFF2DD4B9), Color(0xFF0C7A6B)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: Text(
                          'Confirm Your \nLease Renewal',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            height: 1.1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Review the details below to finalize your term.',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _PropertyCard(),
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _LeaseDetails(),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => _agreed = !_agreed),
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: _agreed ? _renewConfirmPrimary : Colors.grey.shade400, width: 2),
                            color: _agreed ? _renewConfirmPrimary : Colors.transparent,
                          ),
                          child: _agreed ? const Icon(Icons.check, color: Colors.white, size: 16) : null,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _agreed = !_agreed),
                          child: Text(
                            'I agree to the terms of renewal and understand that this action will finalize my lease extension.',
                            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[700], height: 1.4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                border: const Border(top: BorderSide(color: Color(0xFFE2E6E5))),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 12, offset: Offset(0, -3))],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _agreed ? () {} : null,
                      style: ElevatedButton.styleFrom(
                                backgroundColor: _renewConfirmPrimary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        elevation: 8,
                                shadowColor: _renewConfirmPrimary.withValues(alpha: 0.3),
                        disabledBackgroundColor: Colors.grey.shade400,
                      ),
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Confirm Renewal', style: TextStyle(fontWeight: FontWeight.w800)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('No hidden fees. Cancel anytime before signing.', style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[500], fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PropertyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 12, offset: Offset(0, 6))],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          SizedBox(
            height: 240,
            width: double.infinity,
            child: Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuDaOFy5hmLENYvr_kS0VFVvDYbOXSYSUxxkXyJT-MwOApPHBIIkyNWGrxF6BRRUZDuendVz74wIR53Nge0USs0v6dtUprlSyTz_JdkQSRNmlww2JTs2ep9dvH_45UXYnDmqe6aZ2SwrvWG2hUWkjMJJSAcKTFDcKAnmVHeyuF3blIOGcX2JdGRer1U3LkF7uSmCdJ7_uccitAk5YH4kPzqGbOJRC69FYJonKTJ2VmBb5fZ0vCj1R2AVCrCQ4yrXmi_eRziou6uAGmcT',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black87, Colors.black38, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: _renewConfirmPrimary.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.verified_user, color: Colors.white, size: 16),
                      SizedBox(width: 6),
                      Text('Continuity Protected', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text('Unit 402, Marina Heights', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Icon(Icons.location_on, color: Colors.white70, size: 18),
                    SizedBox(width: 6),
                    Text('Dubai Marina, Dubai, UAE', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LeaseDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget row({required IconData icon, required String label, required String value, bool bold = false, bool divider = true}) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(color: _renewConfirmPrimary.withValues(alpha: 0.12), shape: BoxShape.circle),
                    child: Icon(icon, color: _renewConfirmPrimary, size: 18),
                  ),
                  const SizedBox(width: 12),
                  Text(label, style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w600)),
                ],
              ),
              Text(value, style: TextStyle(fontWeight: bold ? FontWeight.w800 : FontWeight.w700, color: const Color(0xFF111817), fontSize: bold ? 18 : 14)),
            ],
          ),
          if (divider)
            Divider(
              height: 18,
              color: Colors.grey.shade200,
            ),
        ],
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E6E5)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Lease Terms', style: Theme.of(context).textTheme.labelSmall?.copyWith(letterSpacing: 0.4, fontWeight: FontWeight.w700, color: Colors.grey[500])),
          const SizedBox(height: 10),
          row(icon: Icons.calendar_month, label: 'New Term Start', value: 'Jan 1, 2024'),
          row(icon: Icons.event_busy, label: 'New Term End', value: 'Dec 31, 2024'),
          row(icon: Icons.payments, label: 'Monthly Rent', value: 'AED 8,500', bold: true, divider: false),
        ],
      ),
    );
  }
}
