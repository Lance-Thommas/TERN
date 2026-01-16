import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _psBg = Color(0xFFF6F8F8);
const _psPrimary = Color(0xFF1EE6D2);

class PropertyAndLeaseSetupLandlordScreen extends StatelessWidget {
  const PropertyAndLeaseSetupLandlordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _psBg,
      appBar: AppBar(
        backgroundColor: _psBg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
        title: const Text('Set up property'),
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
                  const SizedBox(height: 12),
                  _Header(),
                  const SizedBox(height: 16),
                  _StepCard(title: 'Property basics', body: 'Address, unit, and photos for verification.'),
                  _StepCard(title: 'Lease terms', body: 'Rent, notice periods, deposits, and grace rules.'),
                  _StepCard(title: 'Tenant invite', body: 'Share access so tenants can see continuity protections.'),
                  const SizedBox(height: 20),
                  _UploadBox(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          Positioned(
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
                      onPressed: () => context.go('/app/landlord/portfolio'),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFE5E9E8)),
                        foregroundColor: const Color(0xFF5F6B6A),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Skip'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => context.push('/app/landlord/portfolio'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _psPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Save & continue', style: TextStyle(color: Color(0xFF112120), fontWeight: FontWeight.w800)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Your first property', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
        SizedBox(height: 8),
        Text('Set up the lease and invite your tenant to unlock continuity protections.', style: TextStyle(color: Color(0xFF5F6B6A), height: 1.4)),
      ],
    );
  }
}

class _StepCard extends StatelessWidget {
  const _StepCard({required this.title, required this.body});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE5E9E8)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(color: _psPrimary.withValues(alpha: 0.1), shape: BoxShape.circle),
              child: const Icon(Icons.check, color: _psPrimary),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
                  const SizedBox(height: 4),
                  Text(body, style: const TextStyle(color: Color(0xFF5F6B6A), height: 1.4)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UploadBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E9E8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Upload lease documents', style: TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE5E9E8)),
            ),
            child: Column(
              children: const [
                Icon(Icons.upload_file, color: Color(0xFF5F6B6A)),
                SizedBox(height: 6),
                Text('Drag & drop or browse', style: TextStyle(color: Color(0xFF5F6B6A))),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Text('PDF, JPG, or PNG. Max 10MB.', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
        ],
      ),
    );
  }
}
